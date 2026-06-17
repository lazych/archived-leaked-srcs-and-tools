import sys
import ctypes
import ctypes.wintypes as wt
import struct
import os
import re
import threading
import queue
import time
import json
import bisect
from collections import defaultdict
from dataclasses import dataclass, field
from typing import List, Optional, Tuple, Dict
from concurrent.futures import ThreadPoolExecutor, as_completed

try:
    import numpy as np
    HAS_NP = True
except ImportError:
    HAS_NP = False

from PyQt5.QtWidgets import (
    QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout,
    QLabel, QPushButton, QLineEdit, QHeaderView, QProgressBar,
    QAbstractItemView, QFileDialog, QMessageBox, QFrame, QMenu,
    QSpinBox, QStatusBar, QButtonGroup, QTableView
)
from PyQt5.QtCore import (
    Qt, QThread, pyqtSignal, QTimer, QAbstractTableModel,
    QModelIndex, QSortFilterProxyModel, QVariant
)
from PyQt5.QtGui import (
    QColor, QBrush, QPainter, QLinearGradient, QRadialGradient, QPalette
)

os.system("")

PROCESS_ALL_ACCESS = 0x1F0FFF
TH32CS_SNAPPROCESS = 0x00000002
TH32CS_SNAPMODULE = 0x00000008
TH32CS_SNAPMODULE32 = 0x00000010
MEM_COMMIT = 0x1000
PAGE_GUARD = 0x100
READABLE_PROTS = {0x02, 0x04, 0x08, 0x20, 0x40, 0x80}

CHUNK_SIZE = 64 * 1024 * 1024
WORKER_THREADS = max(4, os.cpu_count() or 8)
DRAIN_MS = 120
DRAIN_BATCH = 8000
MIN_STR_LEN = 3
MAX_STR_LEN = 512

IGNORED_MODULES_LOWER = frozenset([
    "mdnsnsp.dll",
    "dnssd.dll",
    "bonjour.dll",
])


class PROCESSENTRY32(ctypes.Structure):
    _fields_ = [
        ("dwSize", wt.DWORD), ("cntUsage", wt.DWORD),
        ("th32ProcessID", wt.DWORD),
        ("th32DefaultHeapID", ctypes.POINTER(ctypes.c_ulong)),
        ("th32ModuleID", wt.DWORD), ("cntThreads", wt.DWORD),
        ("th32ParentProcessID", wt.DWORD), ("pcPriClassBase", ctypes.c_long),
        ("dwFlags", wt.DWORD), ("szExeFile", ctypes.c_char * 260),
    ]


class MODULEENTRY32(ctypes.Structure):
    _fields_ = [
        ("dwSize", wt.DWORD), ("th32ModuleID", wt.DWORD),
        ("th32ProcessID", wt.DWORD), ("GlblcntUsage", wt.DWORD),
        ("ProccntUsage", wt.DWORD),
        ("modBaseAddr", ctypes.POINTER(ctypes.c_byte)),
        ("modBaseSize", wt.DWORD), ("hModule", wt.HMODULE),
        ("szModule", ctypes.c_char * 256), ("szExePath", ctypes.c_char * 260),
    ]


class MEMORY_BASIC_INFORMATION(ctypes.Structure):
    _fields_ = [
        ("BaseAddress", ctypes.c_void_p), ("AllocationBase", ctypes.c_void_p),
        ("AllocationProtect", wt.DWORD), ("RegionSize", ctypes.c_size_t),
        ("State", wt.DWORD), ("Protect", wt.DWORD), ("Type", wt.DWORD),
    ]


k32 = ctypes.windll.kernel32
k32.CreateToolhelp32Snapshot.restype = wt.HANDLE
k32.OpenProcess.restype = wt.HANDLE
k32.VirtualQueryEx.restype = ctypes.c_size_t
k32.ReadProcessMemory.restype = wt.BOOL
k32.CloseHandle.restype = wt.BOOL
k32.Module32First.restype = wt.BOOL
k32.Module32Next.restype = wt.BOOL
k32.Process32First.restype = wt.BOOL
k32.Process32Next.restype = wt.BOOL


def read_mem(proc, addr, size):
    if addr <= 0 or size <= 0:
        return None
    buf = ctypes.create_string_buffer(size)
    n = ctypes.c_size_t(0)
    if k32.ReadProcessMemory(proc, ctypes.c_void_p(addr), buf, size, ctypes.byref(n)) and n.value > 0:
        return buf.raw[:n.value]
    return None


def find_roblox_processes():
    snap = k32.CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
    if snap == ctypes.c_void_p(-1).value:
        return []
    results = []
    e = PROCESSENTRY32()
    e.dwSize = ctypes.sizeof(PROCESSENTRY32)
    if k32.Process32First(snap, ctypes.byref(e)):
        while True:
            try:
                exe = e.szExeFile.decode("utf-8", errors="replace")
            except Exception:
                exe = "?"
            if "roblox" in exe.lower():
                results.append((e.th32ProcessID, exe))
            if not k32.Process32Next(snap, ctypes.byref(e)):
                break
    k32.CloseHandle(snap)
    return results


def get_modules(pid):
    snap = k32.CreateToolhelp32Snapshot(TH32CS_SNAPMODULE | TH32CS_SNAPMODULE32, pid)
    if snap == ctypes.c_void_p(-1).value:
        return []
    modules = []
    me = MODULEENTRY32()
    me.dwSize = ctypes.sizeof(MODULEENTRY32)
    if k32.Module32First(snap, ctypes.byref(me)):
        while True:
            base = ctypes.cast(me.modBaseAddr, ctypes.c_void_p).value or 0
            size = me.modBaseSize
            try:
                name = me.szModule.decode("utf-8", errors="replace")
            except Exception:
                name = "?"
            modules.append((base, size, name))
            if not k32.Module32Next(snap, ctypes.byref(me)):
                break
    k32.CloseHandle(snap)
    return modules


def get_regions(proc):
    raw = []
    addr = 0
    mbi = MEMORY_BASIC_INFORMATION()
    mbi_sz = ctypes.sizeof(mbi)
    while True:
        sz = k32.VirtualQueryEx(proc, ctypes.c_void_p(addr), ctypes.byref(mbi), mbi_sz)
        if sz == 0:
            break
        prot = mbi.Protect & 0xFF
        base = mbi.BaseAddress or 0
        region_sz = mbi.RegionSize
        if (mbi.State == MEM_COMMIT and prot in READABLE_PROTS
                and not (mbi.Protect & PAGE_GUARD) and region_sz > 0):
            raw.append((base, region_sz))
        if region_sz == 0:
            break
        addr = base + region_sz
        if addr >= 0x7FFFFFFFFFFF:
            break
    if not raw:
        return []
    merged = []
    cb, cs = raw[0]
    for b, s in raw[1:]:
        if b == cb + cs:
            cs += s
        else:
            merged.append((cb, cs))
            cb, cs = b, s
    merged.append((cb, cs))
    return merged


ROBLOX_CLASSES = frozenset([
    "Accessory", "AccoutService", "Accoutrement", "Actor", "AdGui", "AdPortal",
    "AdService", "AdvancedDragger", "AirController", "AlignOrientation",
    "AlignPosition", "AnalyticsService", "Animator", "Animation",
    "AnimationClip", "AnimationClipProvider", "AnimationController",
    "AnimationFromVideoCreatorService", "AnimationRigData",
    "AnimationStreamTrack", "AnimationTrack", "ArcHandles", "Atmosphere",
    "Attachment", "AudioAnalyzer", "AudioChorus", "AudioCompressor",
    "AudioDeviceInput", "AudioDeviceOutput", "AudioDistortion", "AudioEcho",
    "AudioEmitter", "AudioEqualizer", "AudioFader", "AudioFlanger",
    "AudioListener", "AudioPitchShifter", "AudioPlayer", "AudioReverb",
    "AudioSearchParams", "AudioWire", "AvatarEditorService",
    "AvatarImportService", "Backpack", "BackpackItem", "BadgeService",
    "BallSocketConstraint", "BasePart", "BasePlayerGui", "BaseScript",
    "BaseWrap", "Beam", "BillboardGui", "BinaryStringValue", "BindableEvent",
    "BindableFunction", "BlockMesh", "BloomEffect", "BlurEffect",
    "BodyAngularVelocity", "BodyColors", "BodyForce", "BodyGyro", "BodyMover",
    "BodyPosition", "BodyThrust", "BodyVelocity", "Bone", "BoolValue",
    "BoxHandleAdornment", "BrickColorValue", "BubbleChatConfiguration",
    "BuoyancySensor", "CFrameValue", "CSGDictionaryService", "Camera",
    "CanvasGroup", "CatalogSearchParams", "ChangeHistoryService",
    "CharacterMesh", "Chat", "ChatInputBarConfiguration",
    "ChatWindowConfiguration", "ChorusSoundEffect", "ClickDetector",
    "ClientReplicator", "ClimbController", "Clouds", "ClusterPacketCache",
    "CollectionService", "Color3Value", "ColorCorrectionEffect",
    "CommandInstance", "CommandService", "CompressorSoundEffect",
    "ConeHandleAdornment", "Configuration", "Constraint",
    "ContentProvider", "ContextActionService", "Controller",
    "ControllerBase", "ControllerManager", "ControllerService",
    "CookiesService", "CoreGui", "CorePackages", "CoreScript",
    "CornerWedgePart", "CrossDMScriptChangeListener",
    "CurveAnimation", "CustomEvent", "CustomEventReceiver",
    "CylinderHandleAdornment", "CylinderMesh", "CylindricalConstraint",
    "DataModel", "DataModelMesh", "DataModelPatchService",
    "DataModelSession", "DataStore", "DataStoreGetOptions",
    "DataStoreIncrementOptions", "DataStoreInfo", "DataStoreKey",
    "DataStoreKeyInfo", "DataStoreKeyPages", "DataStoreListingPages",
    "DataStoreObjectVersionInfo", "DataStoreOptions", "DataStorePages",
    "DataStoreService", "DataStoreSetOptions", "DataStoreVersionPages",
    "Debris", "DebugSettings", "DebuggerBreakpoint", "DebuggerConnection",
    "DebuggerConnectionManager", "DebuggerLuaResponse", "DebuggerManager",
    "DebuggerUIService", "DebuggerVariable", "DebuggerWatch", "Decal",
    "DepthOfFieldEffect", "Dialog", "DialogChoice", "DistortionSoundEffect",
    "DockWidgetPluginGui", "DockWidgetPluginGuiInfo", "DraftsService",
    "Dragger", "DragDetector", "EchoSoundEffect", "EditableImage",
    "EditableMesh", "EqualizerSoundEffect", "EulerRotationCurve",
    "EventIngestService", "ExperienceAuthService",
    "ExperienceInviteOptions", "ExperienceNotificationService",
    "Explosion", "FaceAnimatorService", "FaceControls", "FaceInstance",
    "Feature", "File", "FileMesh", "Fire", "Flag", "FlagStand",
    "FlagStandService", "FlangeSoundEffect", "FloatCurve", "FloorWire",
    "Fly", "Folder", "ForceField", "FormFactorPart", "Frame",
    "FriendPages", "FriendService", "FunctionalTest", "GamePassService",
    "GameSettings", "GamepadService", "GenericSettings",
    "GetTextBoundsParams", "GlobalDataStore", "GlobalSettings",
    "Glue", "GoogleAnalyticsConfiguration", "GroundController",
    "GroupService", "GuiBase", "GuiBase2d", "GuiBase3d", "GuiButton",
    "GuiLabel", "GuiMain", "GuiObject", "GuiService", "GuidRegistryService",
    "HapticService", "HandleAdornment", "Handles", "HandlesBase",
    "Hat", "HeightmapImporterService", "HiddenSurfaceRemovalAsset",
    "Highlight", "HingeConstraint", "Hole", "Hopper", "HopperBin",
    "HttpRbxApiService", "HttpRequest", "HttpService", "Humanoid",
    "HumanoidController", "HumanoidDescription", "IKControl",
    "ILegacyStudioBridge", "IXPService", "ImageButton", "ImageHandleAdornment",
    "ImageLabel", "IncrementalPatchBuilder", "InputObject",
    "InsertService", "Instance", "InstanceAdornment",
    "InternalContainer", "InternalSyncItem", "InternalSyncService",
    "IntValue", "InventoryPages", "JointInstance", "JointsService",
    "KeyboardService", "Keyframe", "KeyframeMarker", "KeyframeSequence",
    "KeyframeSequenceProvider", "LSPFileSyncService", "LanguageService",
    "LayerCollector", "Light", "Lighting", "LinearVelocity",
    "LineForce", "LineHandleAdornment", "LocalScript",
    "LocalStorageService", "LocalizationService", "LocalizationTable",
    "LodDataEntity", "LodDataService", "LogService", "LoginService",
    "LuaSettings", "LuaSourceContainer", "LuaWebService",
    "LuauScriptAnalyzerService", "MAnnotation", "ManualGlue",
    "ManualSurfaceJointInstance", "ManualWeld", "MarkerCurve",
    "MarketplaceService", "MaterialService", "MaterialVariant",
    "MemStorageConnection", "MemStorageService", "MemoryStoreHashMap",
    "MemoryStoreQueue", "MemoryStoreSortedMap", "MemoryStoreService",
    "Mesh", "MeshContentProvider", "MeshPart", "Message",
    "MessageBusConnection", "MessageBusService", "MessagingService",
    "Model", "ModuleScript", "Motor", "Motor6D", "MotorFeature",
    "Mouse", "MouseService", "MultipleDocumentInterfaceInstance",
    "NegateOperation", "NetworkClient", "NetworkMarker", "NetworkPeer",
    "NetworkReplicator", "NetworkServer", "NetworkSettings",
    "NoCollisionConstraint", "NonReplicatedCSGDictionaryService",
    "NotificationService", "NumberPose", "NumberValue", "ObjectValue",
    "OmniRecommendationsService", "OpenCloudService",
    "OperationGraph", "OrderedDataStore", "OutfitPages",
    "PVAdornment", "PVInstance", "PackageLink", "PackageService",
    "Pages", "Pants", "Part", "PartAdornment", "PartOperation",
    "PartOperationAsset", "ParticleEmitter", "PatchBundlerFileWatch",
    "PatchMapping", "Path", "PathfindingLink", "PathfindingModifier",
    "PathfindingService", "PermissionService", "PhysicsService",
    "PhysicsSettings", "Plane", "PlaneConstraint", "Platform",
    "Player", "PlayerEmulatorService", "PlayerGui", "PlayerMouse",
    "PlayerScripts", "Players", "Plugin", "PluginAction",
    "PluginDebugService", "PluginDragEvent", "PluginGui",
    "PluginGuiService", "PluginManager", "PluginManagerInterface",
    "PluginMenu", "PluginMouse", "PluginPolicyService",
    "PluginToolbar", "PluginToolbarButton", "PointLight",
    "PointsService", "PolicyService", "Pose", "PoseBase",
    "PostEffect", "PrismaticConstraint", "ProcessInstancePhysicsService",
    "ProximityPrompt", "ProximityPromptService",
    "PublishService", "RBXScriptConnection", "RBXScriptSignal",
    "Ragdoll", "RandomAccessMemory", "Ray", "RayValue",
    "RbxAnalyticsService", "ReflectionMetadata",
    "ReflectionMetadataCallbacks", "ReflectionMetadataClass",
    "ReflectionMetadataClasses", "ReflectionMetadataEnum",
    "ReflectionMetadataEnumItem", "ReflectionMetadataEnums",
    "ReflectionMetadataEvents", "ReflectionMetadataFunctions",
    "ReflectionMetadataMember", "ReflectionMetadataProperties",
    "ReflectionMetadataYieldFunctions", "ReflectionService",
    "RemoteEvent", "RemoteFunction", "RenderSettings",
    "RenderingTest", "ReplicatedFirst", "ReplicatedStorage",
    "ReplicatedScriptService", "RobloxPluginGuiService",
    "RobloxReplicatedStorage", "RobloxServerStorage",
    "RocketPropulsion", "RodConstraint", "RopeConstraint",
    "Rotate", "RotateP", "RotateV", "RotationCurve",
    "RtMessagingService", "RunService", "RuntimeScriptService",
    "ScreenGui", "ScreenInsets", "Script", "ScriptChangeService",
    "ScriptCloneWatcher", "ScriptCloneWatcherHelper", "ScriptContext",
    "ScriptDebugger", "ScriptDocument", "ScriptEditorService",
    "ScriptProfilerService", "ScriptRegistrationService",
    "ScriptRuntime", "ScriptService", "ScrollingFrame", "Seat",
    "Selection", "SelectionBox", "SelectionLasso", "SelectionPartLasso",
    "SelectionPointLasso", "SelectionSphere", "ServerReplicator",
    "ServerScriptService", "ServerStorage", "ServiceProvider",
    "SessionService", "SharedTableRegistry", "Shirt",
    "ShirtGraphic", "ShorelineUpgraderService", "SkateboardController",
    "SkateboardPlatform", "Skin", "Sky", "SlidingBallConstraint",
    "Smoke", "Snap", "SocialService", "Sound", "SoundEffect",
    "SoundGroup", "SoundService", "Sparkles", "SpawnLocation",
    "SpawnerService", "SpecialMesh", "SphereHandleAdornment",
    "SpotLight", "SpringConstraint", "StandalonePluginScripts",
    "StandardPages", "StarterCharacterScripts", "StarterGear",
    "StarterGui", "StarterPack", "StarterPlayer",
    "StarterPlayerScripts", "Stats", "StringValue",
    "StudioAssetService", "StudioCallout", "StudioData",
    "StudioDeviceEmulatorService", "StudioHighDpiService",
    "StudioObjectBase", "StudioPublishService", "StudioScriptDebugEventListener",
    "StudioService", "StudioTheme", "StyleBase", "StyleDerive",
    "StyleLink", "StyleRule", "StyleSheet", "SubmeshPart",
    "SunRaysEffect", "SurfaceAppearance", "SurfaceGui",
    "SurfaceLight", "SurfaceSelection", "SwimController",
    "TaskScheduler", "Team", "TeamCreateData", "TeamCreatePublishService",
    "TeamCreateService", "Teams", "TeleportAsyncResult",
    "TeleportOptions", "TeleportService", "Terrain",
    "TerrainDetail", "TerrainRegion", "TestService", "TextBox",
    "TextButton", "TextChannel", "TextChatCommand",
    "TextChatConfigurations", "TextChatMessage",
    "TextChatMessageProperties", "TextChatService", "TextFilterResult",
    "TextFilterTranslatedResult", "TextLabel", "TextService",
    "TextSource", "Texture", "TimerService", "Tool", "Torque",
    "TorsionSpringConstraint", "TouchInputService", "TouchTransmitter",
    "TrackerLodController", "TrackerStreamAnimation", "Trail",
    "Translator", "TremoloSoundEffect", "TriangleMeshPart",
    "TrussPart", "Tween", "TweenBase", "TweenService",
    "UIAspectRatioConstraint", "UIBase", "UIComponent",
    "UIConstraint", "UICorner", "UIDragDetector", "UIFlexItem",
    "UIGradient", "UIGridLayout", "UIGridStyleLayout", "UILayout",
    "UIListLayout", "UIPadding", "UIPageLayout", "UIScale",
    "UISizeConstraint", "UIStroke", "UITableLayout",
    "UITextSizeConstraint", "UnionOperation", "UniverseSettings",
    "UniversalConstraint", "UnreliableRemoteEvent",
    "UserGameSettings", "UserInputService", "UserService",
    "UserSettings", "VRService", "VRStatusService", "ValueBase",
    "Vector3Curve", "Vector3Value", "VectorForce", "VehicleController",
    "VehicleSeat", "VelocityMotor", "VideoFrame", "VideoService",
    "ViewportFrame", "VirtualInputManager", "VirtualUser",
    "VisualizationMode", "VisualizationModeCategory",
    "VisualizationModeService", "VoiceChatInternal",
    "VoiceChatService", "WedgePart", "Weld", "WeldConstraint",
    "Wire", "WireframeHandleAdornment", "Workspace", "WorldModel",
    "WorldRoot", "WrapDeformer", "WrapLayer", "WrapTarget",
])

ROBLOX_KEYWORDS = frozenset([
    "datamodel", "workspace", "players", "lighting", "replicatedstorage",
    "serverstorage", "serverscriptservice", "startergui", "starterpack",
    "starterplayer", "startercharacterscripts", "starterplayerscripts",
    "runservice", "userinputservice", "tweenservice", "contextactionservice",
    "httpservice", "marketplaceservice", "gamepassservice", "badgeservice",
    "datastoreservice", "messagingservice", "memoryservice",
    "physicsservice", "collectionservice", "soundservice", "pathfindingservice",
    "groupservice", "socialservice", "textservice", "localizationservice",
    "policyservice", "animationclipservice",
    "screengui", "billboardgui", "surfacegui", "frame", "textlabel",
    "textbutton", "textbox", "imagelabel", "imagebutton", "scrollingframe",
    "uilistlayout", "uigridlayout", "uipadding", "uicorner", "uistroke",
    "uigradient", "uiaspectratioconstraint", "uisizeconstraint",
    "viewportframe", "canvasgroup",
    "basepart", "meshpart", "unionoperation", "part", "wedgepart",
    "trusspart", "cornerwedgepart", "spawnlocation", "seat", "vehicleseat",
    "model", "folder", "camera", "attachment", "beam", "trail",
    "particleemitter", "pointlight", "spotlight", "surfacelight",
    "fire", "smoke", "sparkles", "explosion", "forcefield",
    "highlight", "selectionbox", "atmosphere", "sky", "terrain",
    "humanoid", "humanoiddescription", "humanoidrootpart", "character",
    "animator", "animate", "bodyposition", "bodyvelocity", "bodygyro",
    "bodyforce", "bodyangularvelocity",
    "localscript", "modulescript", "script", "bindablefunction",
    "bindableevent", "remoteevent", "remotefunction",
    "unreliableremoteevent",
    "classname", "instance", "primarypart", "parent", "children",
    "getchildren", "getdescendants", "findfirstchild", "waitforchild",
    "findfirstchildofclass", "findfirstchildwhichisa",
    "clone", "destroy", "remove",
    "cframe", "vector3", "vector2", "udim2", "udim", "color3",
    "brickcolor", "enum", "ray", "region3", "numberrange",
    "numbersequence", "colorsequence", "tween", "tweeninfo",
    "localplayer", "playeradded", "playerremoving",
    "characteradded", "userid", "displayname", "accountage",
    "datastore", "globaldatastore", "ordereddatastore",
    "getasync", "setasync", "updateasync", "removeasync",
    "incrementasync",
    "networkserver", "networkclient", "replicatedfirst",
    "fireserver", "fireclient", "fireallclients",
    "invokeserver", "invokeclient",
    "coregui", "coreguiservice", "starterguiservice",
    "rbxanalytics", "telemetry", "messagebus", "mlservice",
    "fflag", "dflag", "sflag", "fint", "fstring", "flog",
    "dfflag", "sfflag",
    "rbxasset", "rbxassetid", "rbxthumb", "rbxhttp",
    "robloxstudio", "studio", "commandbar", "outputwindow",
    "explorer", "properties", "toolbox",
    "placeid", "gameid", "universeid", "jobid",
    "game", "placeversion",
])

ROBLOX_CLASSES_LOWER = frozenset(c.lower() for c in ROBLOX_CLASSES)

FFLAG_PATTERN = re.compile(r'^(?:D?F|S)(?:Flag|Int|String|Log)[A-Z][A-Za-z0-9]{2,120}$')
CAMEL_CASE = re.compile(r'^[A-Z][a-z]+(?:[A-Z][a-z0-9]*)+$')
CAMEL_RE = re.compile(r'^[A-Z][a-z]+(?:[A-Z][a-z0-9]*)+')
CLASS_PATTERN = re.compile(r'^[A-Z][a-zA-Z0-9]{2,60}$')
URL_PATTERN = re.compile(r'^https?://[a-zA-Z0-9._\-/]+(?:\?[a-zA-Z0-9._\-&=%]*)?$')
ROBLOX_URL = re.compile(r'roblox\.com|rbxcdn\.com|robloxlabs\.com|rbx\.')
PATH_PATTERN = re.compile(r'^[A-Za-z]:\\[\w\\.\-\s]+$|^/[\w/.\-]+$')
LUA_PATTERN = re.compile(
    r'(?:local\s+\w|function\s+\w|require\s*\(|game\s*[.:]|'
    r'workspace\s*[.:]|script\s*[.:]|Instance\.new|'
    r'return\s+\w|if\s+\w.*then|for\s+\w.*do|while\s+\w.*do)',
    re.IGNORECASE
)
LOG_PATTERN = re.compile(
    r'(?:error|warning|info|debug|fatal|assert|exception|failed|'
    r'success|loaded|initialized|connecting|disconnected)[\s:.]',
    re.IGNORECASE
)
PURE_HEX = re.compile(r'^[0-9A-Fa-f]+$')
REPEATED_CHAR = re.compile(r'(.)\1{4,}')
ASM_GARBAGE = re.compile(
    r'H\[\$|H\\x|SHx|AUAV|AWAT|UAVAW|fff[0-9]|[\x80-\xff]{3}'
)
BASE64_ONLY = re.compile(r'^[A-Za-z0-9+/=]{20,}$')
HASH_LIKE = re.compile(r'^[0-9a-f]{32,}$', re.IGNORECASE)
WEEKDAY_JUNK = re.compile(
    r'^(?:Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday|'
    r'January|February|March|April|May|June|July|August|September|'
    r'October|November|December|AM|PM|UTC|GMT|EST|PST|CST|MST)$',
    re.IGNORECASE
)
CRUNTIME_JUNK = re.compile(
    r'^(?:invalid|assertion|buffer|overflow|underflow|'
    r'abort|terminate|unexpected|bad_alloc|out_of_range|'
    r'length_error|domain_error|range_error|logic_error|'
    r'runtime_error|bad_cast|bad_typeid|ios_base|'
    r'basic_string|allocator|vector|deque|list|map|set|'
    r'unordered_map|unordered_set|mutex|thread|condition_variable|'
    r'std::|__cxx|__gnu|_LIBCPP|_MSC_VER|MSVCRT|msvcrt|'
    r'ntdll|kernel32|user32|advapi|ole32|oleaut|shell32|'
    r'combase|ucrtbase|vcruntime|msvcp|concrt|'
    r'operator|typeid|type_info|bad_exception|'
    r'nothrow|nullptr|size_type|value_type|iterator|'
    r'const_iterator|reverse_iterator|reference|'
    r'pointer|difference_type|result_type)$',
    re.IGNORECASE
)

LUA_SYMBOL = re.compile(r'^[Ll]ua[A-Za-z]?[a-z]*[_][A-Za-z][a-zA-Z0-9_]+$')
LUA_TYPE = re.compile(r'^[Ll]ua[A-Z][a-zA-Z0-9_]+$')
LUAU_SYMBOL = re.compile(r'^[Ll]uau[A-Za-z_][A-Za-z0-9_]+$')
SNAKE_SYMBOL = re.compile(r'^[a-zA-Z][a-zA-Z0-9]*(?:_[a-zA-Z0-9]+){1,}$')
UNDERSCORE_LEADING = re.compile(r'^__?[a-zA-Z][a-zA-Z0-9_]+$')
RBX_SYMBOL = re.compile(r'^[Rr]bx[A-Za-z][a-zA-Z0-9_]+$')

LUA_GLOBALS = frozenset([
    "print", "warn", "error", "assert", "pcall", "xpcall",
    "type", "typeof", "tostring", "tonumber",
    "pairs", "ipairs", "next", "select", "unpack",
    "rawget", "rawset", "rawequal", "rawlen",
    "setmetatable", "getmetatable",
    "require", "loadstring", "load", "loadfile", "dofile",
    "collectgarbage", "gcinfo",
    "newproxy", "newthread",
    "coroutine", "table", "string", "math", "os", "io",
    "debug", "package", "utf8", "bit32", "bit",
    "_G", "_VERSION", "_ENV",
    "task", "delay", "spawn", "wait", "tick", "time",
    "elapsedTime", "ElapsedTime",
    "settings", "UserSettings",
    "plugin", "PluginManager",
    "printidentity", "getfenv", "setfenv",
    "shared",
    "coroutine.create", "coroutine.resume", "coroutine.yield",
    "coroutine.status", "coroutine.wrap", "coroutine.running",
    "coroutine.isyieldable", "coroutine.close",
    "table.insert", "table.remove", "table.sort", "table.concat",
    "table.unpack", "table.pack", "table.move",
    "table.create", "table.find", "table.clear", "table.freeze",
    "table.isfrozen", "table.clone",
    "table.getn", "table.maxn", "table.foreach", "table.foreachi",
    "string.format", "string.len", "string.sub", "string.rep",
    "string.reverse", "string.upper", "string.lower",
    "string.byte", "string.char", "string.find", "string.match",
    "string.gmatch", "string.gsub", "string.dump",
    "string.split", "string.trim",
    "math.abs", "math.ceil", "math.floor", "math.sqrt",
    "math.sin", "math.cos", "math.tan",
    "math.asin", "math.acos", "math.atan", "math.atan2",
    "math.exp", "math.log", "math.log10",
    "math.max", "math.min", "math.fmod", "math.modf",
    "math.pow", "math.random", "math.randomseed",
    "math.huge", "math.pi",
    "math.clamp", "math.sign", "math.round", "math.noise",
    "os.clock", "os.time", "os.date", "os.difftime", "os.exit",
    "io.read", "io.write", "io.open", "io.close",
    "io.lines", "io.flush",
    "debug.traceback", "debug.getinfo", "debug.sethook",
    "debug.getlocal", "debug.setlocal",
    "debug.getupvalue", "debug.setupvalue",
    "debug.getmetatable", "debug.setmetatable",
    "debug.getregistry", "debug.profilebegin", "debug.profileend",
    "debug.dumpcodesize", "debug.resetmemorycategory",
    "debug.setmemorycategory", "debug.info",
    "bit32.band", "bit32.bor", "bit32.bxor", "bit32.bnot",
    "bit32.lshift", "bit32.rshift", "bit32.arshift",
    "bit32.lrotate", "bit32.rrotate",
    "bit32.extract", "bit32.replace", "bit32.countlz", "bit32.countrz",
    "utf8.char", "utf8.codepoint", "utf8.codes", "utf8.len",
    "utf8.offset", "utf8.nfdnormalize", "utf8.nfcnormalize",
    "utf8.charpattern",
    "task.spawn", "task.delay", "task.defer", "task.wait",
    "task.cancel", "task.desynchronize", "task.synchronize",
    "buffer.create", "buffer.fromstring", "buffer.tostring",
    "buffer.len", "buffer.copy", "buffer.fill",
    "buffer.readstring", "buffer.writestring",
    "buffer.readi8", "buffer.readu8",
    "buffer.readi16", "buffer.readu16",
    "buffer.readi32", "buffer.readu32",
    "buffer.readf32", "buffer.readf64",
    "buffer.writei8", "buffer.writeu8",
    "buffer.writei16", "buffer.writeu16",
    "buffer.writei32", "buffer.writeu32",
    "buffer.writef32", "buffer.writef64",
    "Vector3", "Vector2", "Vector3int16", "Vector2int16",
    "CFrame", "Color3", "UDim", "UDim2",
    "Ray", "Region3", "Region3int16",
    "BrickColor", "Axes", "Faces",
    "NumberRange", "NumberSequence", "NumberSequenceKeypoint",
    "ColorSequence", "ColorSequenceKeypoint",
    "Rect", "PhysicalProperties",
    "Random", "TweenInfo",
    "Enum", "EnumItem",
    "Instance", "RBXScriptSignal", "RBXScriptConnection",
    "tick", "time", "wait", "delay", "spawn",
    "workspace", "game", "script", "plugin",
    "Axes", "Faces", "DateTime", "Font",
    "OverlapParams", "RaycastParams", "RaycastResult",
    "PathWaypoint", "FloatCurveKey", "RotationCurveKey",
    "SharedTable",
    "buffer",
])

SYSTEM_JUNK = frozenset([
    "true", "false", "null", "none", "void", "auto", "this",
    "self", "class", "struct", "union", "enum", "typedef",
    "static", "const", "volatile", "extern", "register",
    "inline", "virtual", "override", "final", "explicit",
    "friend", "public", "private", "protected", "namespace",
    "using", "template", "typename", "sizeof", "alignof",
    "noexcept", "throw", "catch", "try", "delete", "default",
    "switch", "case", "break", "continue", "goto", "return",
    "while", "else", "elif", "endif", "ifdef", "ifndef",
    "define", "include", "pragma",
    "monday", "tuesday", "wednesday", "thursday", "friday",
    "saturday", "sunday",
    "january", "february", "march", "april", "june",
    "july", "august", "september", "october", "november", "december",
    "utf-8", "utf-16", "ascii", "unicode", "ansi",
    "succeeded", "failed",
])

SCAN_MODE_CLASS = "class"
SCAN_MODE_FULL = "full"


@dataclass
class ScanResult:
    addr: int
    name: str
    kind: str
    category: str
    score: int
    scan_mode: str = "full"
    refs: int = 0
    module: str = ""


def _is_garbage(s: str) -> bool:
    if not s or len(s) < MIN_STR_LEN or len(s) > MAX_STR_LEN:
        return True
    if REPEATED_CHAR.search(s):
        return True
    if PURE_HEX.match(s) and len(s) > 8:
        return True
    if HASH_LIKE.match(s):
        return True
    if BASE64_ONLY.match(s) and len(s) > 30:
        return True
    if WEEKDAY_JUNK.match(s):
        return True
    if CRUNTIME_JUNK.match(s):
        return True
    low = s.lower().strip()
    if low in SYSTEM_JUNK:
        return True
    printable = sum(1 for c in s if 32 <= ord(c) < 127)
    if len(s) > 0 and printable / len(s) < 0.85:
        return True
    alpha = sum(1 for c in s if c.isalpha())
    if alpha < 2:
        return True
    if ASM_GARBAGE.search(s):
        return True
    return False


def classify_class_only(s: str) -> Optional[Tuple[str, str, int]]:
    if s in LUA_GLOBALS:
        return ("LuaGlobal", "internal", 82)

    if _is_garbage(s):
        return None

    if s in ROBLOX_CLASSES:
        return ("Class", "roblox", 98)

    if FFLAG_PATTERN.match(s):
        return ("FFlag", "internal", 95)

    if s.startswith("rbxasset://") or s.startswith("rbxassetid://"):
        return ("Asset", "roblox", 88)

    if LUA_SYMBOL.match(s) or LUA_TYPE.match(s) or LUAU_SYMBOL.match(s):
        return ("LuaSymbol", "internal", 85)

    low = s.lower()
    if low in ROBLOX_CLASSES_LOWER and CLASS_PATTERN.match(s):
        return ("Class", "roblox", 96)

    if low in ROBLOX_KEYWORDS and CLASS_PATTERN.match(s):
        return ("Service", "roblox", 90)

    return None


def classify_full(s: str) -> Optional[Tuple[str, str, int]]:
    if s in LUA_GLOBALS:
        return ("LuaGlobal", "internal", 82)

    if _is_garbage(s):
        return None

    low = s.lower().strip()
    is_rbx_keyword = low in ROBLOX_KEYWORDS
    has_rbx_keyword = any(k in low for k in ROBLOX_KEYWORDS if len(k) > 4)

    if s in ROBLOX_CLASSES:
        return ("Class", "roblox", 98)

    if FFLAG_PATTERN.match(s):
        return ("FFlag", "internal", 95)

    if URL_PATTERN.match(s) and ROBLOX_URL.search(s):
        return ("URL", "network", 90)

    if LUA_SYMBOL.match(s):
        return ("LuaSymbol", "internal", 88)

    if LUA_TYPE.match(s):
        return ("LuaType", "internal", 86)

    if LUAU_SYMBOL.match(s):
        return ("LuauSymbol", "internal", 87)

    if LUA_PATTERN.search(s):
        return ("Lua", "script", 85)

    if s.startswith("rbxasset://") or s.startswith("rbxassetid://"):
        return ("Asset", "roblox", 88)

    if RBX_SYMBOL.match(s):
        return ("RbxSymbol", "roblox", 80)

    if low in ROBLOX_CLASSES_LOWER and CLASS_PATTERN.match(s):
        return ("Class", "roblox", 96)

    if is_rbx_keyword and CLASS_PATTERN.match(s):
        return ("Service", "roblox", 90)

    if is_rbx_keyword:
        return ("Property", "roblox", 80)

    if CAMEL_RE.match(s) and has_rbx_keyword:
        return ("Identifier", "roblox", 75)

    if CAMEL_CASE.match(s):
        parts = re.findall(r'[A-Z][a-z]+', s)
        if len(parts) >= 2:
            return ("Identifier", "unknown", 50)

    if UNDERSCORE_LEADING.match(s):
        return ("Symbol", "internal", 60)

    if SNAKE_SYMBOL.match(s):
        alpha = sum(1 for c in s if c.isalpha())
        if len(s) > 0 and alpha / len(s) > 0.5:
            if has_rbx_keyword or "lua" in low or "rbx" in low or "rblx" in low:
                return ("Symbol", "roblox", 72)
            return ("Symbol", "unknown", 42)

    if '.' in s and not s.startswith('.') and not s.endswith('.'):
        parts = s.split('.')
        if all(re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', p) for p in parts):
            if has_rbx_keyword:
                return ("Path", "roblox", 82)
            alpha = sum(1 for c in s if c.isalpha())
            if len(parts) >= 2 and len(s) > 0 and alpha / len(s) > 0.7:
                return ("Path", "unknown", 45)

    if ':' in s and not s.startswith(':'):
        parts = s.split(':')
        if len(parts) == 2 and all(
            re.match(r'^[A-Za-z_][A-Za-z0-9_]*$', p) for p in parts
        ):
            if has_rbx_keyword:
                return ("Method", "roblox", 83)
            return ("Method", "unknown", 40)

    if LOG_PATTERN.search(s) and has_rbx_keyword:
        return ("Log", "internal", 55)

    if URL_PATTERN.match(s):
        return ("URL", "network", 60)

    if PATH_PATTERN.match(s):
        if "roblox" in low:
            return ("Path", "roblox", 65)
        return ("Path", "unknown", 30)

    if has_rbx_keyword:
        alpha = sum(1 for c in s if c.isalpha())
        if len(s) > 0 and alpha / len(s) > 0.6 and len(s) > 6:
            words = re.findall(r'[A-Za-z]+', s)
            if words and max(len(w) for w in words) >= 4:
                return ("String", "roblox", 40)

    if CLASS_PATTERN.match(s) and has_rbx_keyword:
        return ("Identifier", "roblox", 55)

    return None


PRINTABLE_BYTES = frozenset(range(0x20, 0x7F))


def extract_strings_fast(data: bytes, base_addr: int) -> List[Tuple[int, str]]:
    results = []
    if HAS_NP and len(data) > 1024:
        arr = np.frombuffer(data, dtype=np.uint8)
        printable = ((arr >= 0x20) & (arr < 0x7F)) | (arr == 0x09)
        padded = np.concatenate(([False], printable, [False]))
        edges = np.diff(padded.astype(np.int8))
        starts = np.where(edges == 1)[0]
        ends = np.where(edges == -1)[0]
        for s_idx, e_idx in zip(starts, ends):
            length = e_idx - s_idx
            if MIN_STR_LEN <= length <= MAX_STR_LEN:
                if e_idx < len(data) and data[e_idx] == 0:
                    try:
                        s = data[int(s_idx):int(e_idx)].decode("ascii")
                        results.append((base_addr + int(s_idx), s))
                    except Exception:
                        pass
    else:
        i = 0
        n = len(data)
        while i < n:
            if data[i] in PRINTABLE_BYTES or data[i] == 0x09:
                j = i + 1
                while j < n and (data[j] in PRINTABLE_BYTES or data[j] == 0x09):
                    j += 1
                length = j - i
                if MIN_STR_LEN <= length <= MAX_STR_LEN:
                    if j < n and data[j] == 0:
                        try:
                            s = data[i:j].decode("ascii")
                            results.append((base_addr + i, s))
                        except Exception:
                            pass
                i = j + 1
            else:
                i += 1
    return results


def extract_wide_strings(data: bytes, base_addr: int) -> List[Tuple[int, str]]:
    results = []
    if HAS_NP and len(data) > 2048:
        trunc = data[:len(data) - (len(data) % 2)] if len(data) % 2 else data
        arr = np.frombuffer(trunc, dtype=np.uint16)
        wide_printable = (arr >= 0x0020) & (arr < 0x007F)
        padded = np.concatenate(([False], wide_printable, [False]))
        edges = np.diff(padded.astype(np.int8))
        starts = np.where(edges == 1)[0]
        ends = np.where(edges == -1)[0]
        for s_idx, e_idx in zip(starts, ends):
            length = e_idx - s_idx
            if MIN_STR_LEN <= length <= MAX_STR_LEN:
                byte_start = int(s_idx) * 2
                byte_end = int(e_idx) * 2
                try:
                    s = trunc[byte_start:byte_end].decode("utf-16-le")
                    results.append((base_addr + byte_start, s))
                except Exception:
                    pass
    else:
        i = 0
        n = len(data) - 1
        while i < n:
            if 0x20 <= data[i] < 0x7F and data[i + 1] == 0:
                j = i + 2
                while j + 1 < n and 0x20 <= data[j] < 0x7F and data[j + 1] == 0:
                    j += 2
                length = (j - i) // 2
                if MIN_STR_LEN <= length <= MAX_STR_LEN:
                    try:
                        s = data[i:j].decode("utf-16-le")
                        results.append((base_addr + i, s))
                    except Exception:
                        pass
                i = j + 2
            else:
                i += 1
    return results


class ModuleMap:
    def __init__(self, modules):
        self._modules = sorted(modules, key=lambda m: m[0])
        self._bases = [m[0] for m in self._modules]
        self._ends = [m[0] + m[1] for m in self._modules]
        self._names = [m[2] for m in self._modules]

    def resolve(self, addr: int) -> str:
        idx = bisect.bisect_right(self._bases, addr) - 1
        if idx >= 0 and addr < self._ends[idx]:
            return self._names[idx]
        return ""


class ScanWorker(QThread):
    sig_progress = pyqtSignal(int, int, int, int)
    sig_status = pyqtSignal(str)
    sig_done = pyqtSignal(int, float, int)

    def __init__(self, pid, limit, result_queue, stop_evt, scan_mode):
        super().__init__()
        self._pid = pid
        self._limit = limit
        self._q = result_queue
        self._stop = stop_evt
        self._mode = scan_mode

    def run(self):
        t0 = time.perf_counter()
        proc = k32.OpenProcess(PROCESS_ALL_ACCESS, False, self._pid)
        if not proc:
            self.sig_status.emit("Failed to open process!")
            self.sig_done.emit(0, 0.0, 0)
            return

        classify_fn = classify_class_only if self._mode == SCAN_MODE_CLASS else classify_full

        try:
            modules = get_modules(self._pid)
            modmap = ModuleMap(modules)
            self.sig_status.emit(f"Found {len(modules)} modules, enumerating regions...")

            regions = get_regions(proc)
            total_regions = len(regions)
            total_bytes = sum(s for _, s in regions)
            self.sig_status.emit(
                f"{total_regions} regions, {total_bytes / 1024 / 1024:.0f} MB to scan "
                f"[{self._mode.upper()} mode]"
            )

            found = 0
            bytes_scanned = 0
            seen_names: Dict[str, ScanResult] = {}
            lock = threading.Lock()
            done_count = [0]

            def process_region(base, size):
                nonlocal found, bytes_scanned
                if self._stop.is_set():
                    return
                offset = 0
                while offset < size and not self._stop.is_set():
                    chunk_sz = min(CHUNK_SIZE, size - offset)
                    raw = read_mem(proc, base + offset, chunk_sz)
                    if raw is None:
                        offset += chunk_sz
                        continue
                    actual_len = len(raw)

                    hits = extract_strings_fast(raw, base + offset)
                    if self._mode == SCAN_MODE_FULL:
                        hits += extract_wide_strings(raw, base + offset)

                    for addr, s in hits:
                        if self._stop.is_set():
                            return
                        result = classify_fn(s)
                        if result is None:
                            continue
                        kind, category, score = result
                        mod = modmap.resolve(addr)

                        if mod.lower() in IGNORED_MODULES_LOWER:
                            continue

                        with lock:
                            key = s
                            if key in seen_names:
                                seen_names[key].refs += 1
                                if score > seen_names[key].score:
                                    seen_names[key].score = score
                                    seen_names[key].addr = addr
                                    seen_names[key].module = mod
                                continue
                            sr = ScanResult(
                                addr=addr, name=s, kind=kind,
                                category=category, score=score,
                                scan_mode=self._mode,
                                refs=1, module=mod
                            )
                            seen_names[key] = sr
                            found += 1
                            self._q.put(sr)
                            if found >= self._limit:
                                self._stop.set()
                                return

                    with lock:
                        bytes_scanned += actual_len
                    offset += chunk_sz

                with lock:
                    done_count[0] += 1
                    d = done_count[0]
                    f = found
                    bs = bytes_scanned
                if d % 3 == 0 or d == total_regions:
                    self.sig_progress.emit(d, total_regions, f, bs)

            with ThreadPoolExecutor(max_workers=WORKER_THREADS) as pool:
                futures = [pool.submit(process_region, b, s) for b, s in regions]
                for fut in as_completed(futures):
                    try:
                        fut.result()
                    except Exception:
                        pass

            self._q.put(None)
            self.sig_done.emit(found, time.perf_counter() - t0, bytes_scanned)
        finally:
            k32.CloseHandle(proc)


class StringTableModel(QAbstractTableModel):
    HEADERS = ["ADDRESS", "TYPE", "CAT", "SCORE", "REFS", "MODULE", "STRING"]
    COL_ADDR = 0
    COL_TYPE = 1
    COL_CAT = 2
    COL_SCORE = 3
    COL_REFS = 4
    COL_MODULE = 5
    COL_NAME = 6

    def __init__(self, parent=None):
        super().__init__(parent)
        self._data: List[ScanResult] = []
        self._lock = threading.Lock()

    def rowCount(self, parent=QModelIndex()):
        return len(self._data)

    def columnCount(self, parent=QModelIndex()):
        return len(self.HEADERS)

    def headerData(self, section, orientation, role=Qt.DisplayRole):
        if role == Qt.DisplayRole and orientation == Qt.Horizontal:
            if 0 <= section < len(self.HEADERS):
                return self.HEADERS[section]
        return QVariant()

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid():
            return QVariant()
        row = index.row()
        col = index.column()
        if row < 0 or row >= len(self._data):
            return QVariant()

        r = self._data[row]

        if role == Qt.DisplayRole:
            if col == self.COL_ADDR:
                return f"0x{r.addr:012X}"
            if col == self.COL_TYPE:
                return r.kind
            if col == self.COL_CAT:
                return r.category
            if col == self.COL_SCORE:
                return str(r.score)
            if col == self.COL_REFS:
                return str(r.refs)
            if col == self.COL_MODULE:
                return r.module
            if col == self.COL_NAME:
                return r.name
            return QVariant()

        if role == Qt.ForegroundRole:
            if col == self.COL_NAME:
                return QBrush(self._name_color(r))
            if col == self.COL_SCORE:
                if r.score >= 80:
                    return QBrush(QColor("#4ade80"))
                if r.score >= 50:
                    return QBrush(QColor("#fbbf24"))
                return QBrush(QColor("#64748b"))
            if col == self.COL_ADDR:
                return QBrush(QColor("#64748b"))
            if col == self.COL_TYPE:
                return QBrush(QColor("#94a3b8"))
            if col == self.COL_CAT:
                colors = {
                    "roblox": QColor("#22d3ee"),
                    "internal": QColor("#a78bfa"),
                    "network": QColor("#f472b6"),
                    "script": QColor("#4ade80"),
                    "unknown": QColor("#64748b"),
                }
                return QBrush(colors.get(r.category, QColor("#64748b")))
            return QVariant()

        if role == Qt.TextAlignmentRole:
            if col in (self.COL_SCORE, self.COL_REFS, self.COL_TYPE):
                return Qt.AlignCenter
            return QVariant()

        if role == Qt.UserRole:
            if col == self.COL_SCORE:
                return r.score
            if col == self.COL_REFS:
                return r.refs
            if col == self.COL_ADDR:
                return r.addr
            return QVariant()

        return QVariant()

    def _name_color(self, r: ScanResult) -> QColor:
        if r.category == "roblox":
            return QColor("#22d3ee")
        if "FFlag" in r.kind:
            return QColor("#a78bfa")
        if "Lua" in r.kind:
            return QColor("#fb923c")
        if r.category == "script":
            return QColor("#4ade80")
        if r.category == "network":
            return QColor("#f472b6")
        if r.category == "internal":
            return QColor("#c084fc")
        return QColor("#e2e8f0")

    def add_results(self, results: List[ScanResult]):
        if not results:
            return
        start = len(self._data)
        self.beginInsertRows(QModelIndex(), start, start + len(results) - 1)
        self._data.extend(results)
        self.endInsertRows()

    def clear(self):
        self.beginResetModel()
        self._data.clear()
        self.endResetModel()

    def get_result(self, row: int) -> Optional[ScanResult]:
        if 0 <= row < len(self._data):
            return self._data[row]
        return None

    def get_all(self) -> List[ScanResult]:
        return list(self._data)

    def get_by_mode(self, mode: str) -> List[ScanResult]:
        return [r for r in self._data if r.scan_mode == mode]


class StringFilterProxy(QSortFilterProxyModel):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._search = ""
        self._type_filter = ""
        self._cat_filter = ""
        self._min_score = 0
        self._mode_filter = ""

    def set_search(self, text: str):
        self._search = text.lower().strip()
        self.invalidateFilter()

    def set_type_filter(self, kind: str):
        self._type_filter = kind.lower()
        self.invalidateFilter()

    def set_cat_filter(self, cat: str):
        self._cat_filter = cat.lower()
        self.invalidateFilter()

    def set_min_score(self, score: int):
        self._min_score = score
        self.invalidateFilter()

    def set_mode_filter(self, mode: str):
        self._mode_filter = mode.lower()
        self.invalidateFilter()

    def filterAcceptsRow(self, source_row, source_parent):
        try:
            model = self.sourceModel()
            if model is None:
                return False
            r = model.get_result(source_row)
            if r is None:
                return False

            if r.score < self._min_score:
                return False

            if self._mode_filter and r.scan_mode != self._mode_filter:
                return False

            if self._type_filter:
                kind_low = r.kind.lower()
                if self._type_filter == "fflag":
                    if "fflag" not in kind_low:
                        return False
                elif self._type_filter == "class":
                    if kind_low not in ("class", "service"):
                        return False
                elif self._type_filter == "lua":
                    if "lua" not in kind_low:
                        return False
                elif self._type_filter == "identifier":
                    if kind_low not in ("identifier", "class", "property", "method", "service", "symbol", "rbxsymbol"):
                        return False
                elif self._type_filter not in kind_low:
                    return False

            if self._cat_filter and self._cat_filter != r.category:
                return False

            if self._search:
                terms = self._search.split()
                name_low = r.name.lower()
                kind_low = r.kind.lower()
                cat_low = r.category.lower()
                mod_low = r.module.lower()
                for term in terms:
                    if (term not in name_low and term not in kind_low
                            and term not in cat_low and term not in mod_low):
                        return False

            return True
        except Exception:
            return False

    def lessThan(self, left, right):
        try:
            l_data = self.sourceModel().data(left, Qt.UserRole)
            r_data = self.sourceModel().data(right, Qt.UserRole)
            if (l_data is not None and r_data is not None
                    and not isinstance(l_data, QVariant)
                    and not isinstance(r_data, QVariant)):
                return l_data < r_data
        except Exception:
            pass
        return super().lessThan(left, right)


ACCENT = "#7c6aff"
ACCENT2 = "#a78bfa"
PINK = "#f472b6"
CYAN = "#22d3ee"
GREEN = "#4ade80"
GOLD = "#fbbf24"
ORANGE = "#fb923c"
FG = "#f1f5f9"
FG_DIM = "#64748b"
FG_MUT = "#1e293b"
BG = "#06080f"

QSS = f"""
* {{ font-family: 'Segoe UI', 'SF Pro Display', sans-serif; }}
QMainWindow, QWidget {{ background: transparent; color: {FG}; }}
QMainWindow {{ background: {BG}; }}
QLabel {{ background: transparent; color: {FG}; }}
QLabel#title {{ font-size:15px; font-weight:700; letter-spacing:3px; color:{FG}; }}
QLabel#subtitle {{ font-size:9px; letter-spacing:2px; color:{FG_DIM}; }}
QLabel#pid_lbl {{ font-size:10px; color:{ACCENT2}; }}
QLabel#spd_lbl {{ font-size:10px; color:{GREEN}; font-weight:600; }}
QLabel#cnt_lbl {{ font-size:10px; color:{FG_DIM}; letter-spacing:1px; }}
QLabel#mode_lbl {{ font-size:10px; color:{GOLD}; font-weight:600; letter-spacing:1px; }}
QPushButton {{
    background:rgba(255,255,255,10); color:{FG};
    border:1px solid rgba(255,255,255,20); border-radius:8px;
    padding:7px 18px; font-size:10px; font-weight:600; letter-spacing:1px;
}}
QPushButton:hover {{
    background:rgba(255,255,255,20); border-color:rgba(255,255,255,40); color:#fff;
}}
QPushButton:pressed {{ background:rgba(255,255,255,6); }}
QPushButton:disabled {{ color:{FG_MUT}; border-color:rgba(255,255,255,6); }}
QPushButton#btn_class {{
    background:rgba(34,211,238,20); border-color:{CYAN};
    color:{CYAN}; font-weight:700;
}}
QPushButton#btn_class:hover {{ background:rgba(34,211,238,42); color:#fff; }}
QPushButton#btn_full {{
    background:rgba(124,106,255,20); border-color:{ACCENT};
    color:{ACCENT2}; font-weight:700;
}}
QPushButton#btn_full:hover {{ background:rgba(124,106,255,42); color:#fff; }}
QPushButton#btn_stop {{
    background:rgba(244,114,182,18); border-color:{PINK}; color:{PINK};
}}
QPushButton#btn_stop:hover {{ background:rgba(244,114,182,36); }}
QPushButton#btn_export_class {{
    background:rgba(34,211,238,15); border-color:{CYAN}; color:{CYAN};
}}
QPushButton#btn_export_class:hover {{ background:rgba(34,211,238,30); }}
QPushButton#btn_export_full {{
    background:rgba(251,191,36,15); border-color:{GOLD}; color:{GOLD};
}}
QPushButton#btn_export_full:hover {{ background:rgba(251,191,36,30); }}
QPushButton#btn_clear {{ color:{FG_DIM}; }}
QPushButton#fb {{
    background:rgba(255,255,255,7); border:1px solid rgba(255,255,255,13);
    border-radius:6px; padding:5px 13px; font-size:9px;
    font-weight:700; letter-spacing:1px; color:{FG_DIM};
}}
QPushButton#fb:checked {{
    background:rgba(124,106,255,28); border-color:{ACCENT}; color:{ACCENT2};
}}
QPushButton#fb:hover {{ background:rgba(255,255,255,14); color:{FG}; }}
QLineEdit {{
    background:rgba(255,255,255,9); border:1px solid rgba(255,255,255,17);
    border-radius:8px; padding:8px 15px; color:{FG}; font-size:11px;
    selection-background-color:{ACCENT}; selection-color:#fff;
}}
QLineEdit:focus {{ border-color:{ACCENT}; background:rgba(124,106,255,12); }}
QSpinBox {{
    background:rgba(255,255,255,9); border:1px solid rgba(255,255,255,17);
    border-radius:8px; padding:6px 10px; color:{FG}; font-size:11px;
}}
QSpinBox:focus {{ border-color:{ACCENT}; }}
QSpinBox::up-button, QSpinBox::down-button {{ width:0; border:none; }}
QTableView {{
    background:transparent; gridline-color:rgba(255,255,255,5);
    border:none; outline:0;
    selection-background-color:rgba(124,106,255,28); selection-color:{FG};
    alternate-background-color:rgba(255,255,255,3);
    font-family:'Consolas','Courier New',monospace; font-size:11px;
}}
QTableView::item {{ padding:3px 10px; border:none; }}
QTableView::item:selected {{ background:rgba(124,106,255,32); }}
QHeaderView::section {{
    background:rgba(255,255,255,7); color:{FG_DIM}; border:none;
    border-bottom:1px solid rgba(255,255,255,10);
    border-right:1px solid rgba(255,255,255,5);
    padding:8px 10px; font-size:9px; font-weight:700;
    letter-spacing:1.5px; font-family:'Segoe UI',sans-serif;
}}
QHeaderView {{ background:transparent; }}
QScrollBar:vertical {{
    background:rgba(255,255,255,4); width:5px; border:none; border-radius:3px;
}}
QScrollBar::handle:vertical {{
    background:rgba(255,255,255,18); border-radius:3px; min-height:20px;
}}
QScrollBar::handle:vertical:hover {{ background:rgba(124,106,255,55); }}
QScrollBar::add-line:vertical, QScrollBar::sub-line:vertical {{ height:0; }}
QScrollBar:horizontal {{
    background:rgba(255,255,255,4); height:5px; border:none; border-radius:3px;
}}
QScrollBar::handle:horizontal {{
    background:rgba(255,255,255,18); border-radius:3px; min-width:20px;
}}
QScrollBar::handle:horizontal:hover {{ background:rgba(124,106,255,55); }}
QScrollBar::add-line:horizontal, QScrollBar::sub-line:horizontal {{ width:0; }}
QProgressBar {{
    background:rgba(255,255,255,7); border:none; border-radius:2px; max-height:3px;
}}
QProgressBar::chunk {{
    background:qlineargradient(x1:0,y1:0,x2:1,y2:0,stop:0 {ACCENT},stop:1 {CYAN});
    border-radius:2px;
}}
QStatusBar {{
    background:rgba(255,255,255,5); color:{FG_DIM}; font-size:10px;
    border-top:1px solid rgba(255,255,255,8);
}}
QStatusBar::item {{ border:none; }}
QMenu {{
    background:rgba(10,12,24,240); border:1px solid rgba(255,255,255,15);
    border-radius:10px; color:{FG}; padding:5px; font-size:11px;
}}
QMenu::item {{ padding:7px 22px; border-radius:5px; }}
QMenu::item:selected {{ background:rgba(124,106,255,32); color:#fff; }}
QMenu::separator {{ height:1px; background:rgba(255,255,255,10); margin:4px 10px; }}
QFrame#accent_bar {{
    background:qlineargradient(x1:0,y1:0,x2:1,y2:0,
        stop:0 {ACCENT},stop:0.5 {PINK},stop:1 {CYAN});
}}
QFrame#hdr {{
    background:rgba(255,255,255,9); border-bottom:1px solid rgba(255,255,255,13);
}}
QFrame#toolbar {{
    background:rgba(255,255,255,5); border-bottom:1px solid rgba(255,255,255,9);
}}
QFrame#tbl_wrap {{
    background:rgba(255,255,255,4); border:1px solid rgba(255,255,255,9);
    border-radius:12px; margin:0 12px 8px 12px;
}}
"""


class BgWidget(QWidget):
    def paintEvent(self, e):
        p = QPainter(self)
        p.setRenderHint(QPainter.Antialiasing)
        g = QLinearGradient(0, 0, 0, self.height())
        g.setColorAt(0, QColor("#06080f"))
        g.setColorAt(0.5, QColor("#080b18"))
        g.setColorAt(1, QColor("#0b0d1c"))
        p.fillRect(self.rect(), g)
        for cx, cy, r, col in [
            (0.1, 0.15, 0.60, QColor(124, 106, 255, 18)),
            (0.9, 0.80, 0.50, QColor(244, 114, 182, 12)),
            (0.5, 0.45, 0.45, QColor(34, 211, 238, 7)),
        ]:
            rg = QRadialGradient(self.width() * cx, self.height() * cy, self.width() * r)
            rg.setColorAt(0, col)
            rg.setColorAt(1, QColor(0, 0, 0, 0))
            p.fillRect(self.rect(), rg)
        super().paintEvent(e)


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("RblxDumper")
        self.resize(1400, 880)
        self.setMinimumSize(900, 560)

        self._q = queue.Queue()
        self._worker = None
        self._scanning = False
        self._stop_evt = threading.Event()
        self._t0 = 0.0
        self._current_mode = ""

        self._drain_timer = QTimer(self)
        self._drain_timer.setInterval(DRAIN_MS)
        self._drain_timer.timeout.connect(self._drain_queue)

        self._speed_timer = QTimer(self)
        self._speed_timer.setInterval(800)
        self._speed_timer.timeout.connect(self._tick_speed)

        self.setStyleSheet(QSS)
        self._build_ui()

    def _build_ui(self):
        bg = BgWidget()
        self.setCentralWidget(bg)
        root = QVBoxLayout(bg)
        root.setContentsMargins(0, 0, 0, 0)
        root.setSpacing(0)

        bar = QFrame()
        bar.setObjectName("accent_bar")
        bar.setFixedHeight(3)
        root.addWidget(bar)

        hdr = QFrame()
        hdr.setObjectName("hdr")
        hdr.setFixedHeight(70)
        hl = QHBoxLayout(hdr)
        hl.setContentsMargins(22, 0, 18, 0)
        hl.setSpacing(12)

        vt = QVBoxLayout()
        vt.setSpacing(1)
        vt.addWidget(self._lbl("RBLXDUMPER", "title"))
        vt.addWidget(self._lbl(
            "CLASS SCAN \u00b7 FULL SCAN \u00b7 LUA SYMBOLS \u00b7 EXPORT",
            "subtitle"
        ))
        hl.addLayout(vt)

        self._pid_lbl = self._lbl("No process", "pid_lbl")
        self._mode_lbl = self._lbl("", "mode_lbl")
        self._spd_lbl = self._lbl("", "spd_lbl")
        hl.addWidget(self._pid_lbl)
        hl.addSpacing(8)
        hl.addWidget(self._mode_lbl)
        hl.addSpacing(8)
        hl.addWidget(self._spd_lbl)
        hl.addStretch()

        self._btn_clear = QPushButton("CLEAR")
        self._btn_clear.setObjectName("btn_clear")

        self._btn_export_class = QPushButton("EXPORT CLASS")
        self._btn_export_class.setObjectName("btn_export_class")

        self._btn_export_full = QPushButton("EXPORT FULL")
        self._btn_export_full.setObjectName("btn_export_full")

        self._btn_stop = QPushButton("\u25a0 STOP")
        self._btn_stop.setObjectName("btn_stop")
        self._btn_stop.setEnabled(False)

        self._btn_class = QPushButton("\u25b6 CLASS SCAN")
        self._btn_class.setObjectName("btn_class")
        self._btn_class.setToolTip(
            "Scans for exact Roblox class names, services, FFlags, and Lua symbols."
        )

        self._btn_full = QPushButton("\u25b6 FULL SCAN")
        self._btn_full.setObjectName("btn_full")
        self._btn_full.setToolTip(
            "Scans everything: classes, FFlags, Lua VM internals, identifiers, URLs, paths."
        )

        for b in (self._btn_clear, self._btn_export_class, self._btn_export_full,
                  self._btn_stop, self._btn_class, self._btn_full):
            hl.addWidget(b)

        self._btn_class.clicked.connect(lambda: self._do_scan(SCAN_MODE_CLASS))
        self._btn_full.clicked.connect(lambda: self._do_scan(SCAN_MODE_FULL))
        self._btn_stop.clicked.connect(self._do_stop)
        self._btn_clear.clicked.connect(self._do_clear)
        self._btn_export_class.clicked.connect(lambda: self._do_export(SCAN_MODE_CLASS))
        self._btn_export_full.clicked.connect(lambda: self._do_export(SCAN_MODE_FULL))
        root.addWidget(hdr)

        tb = QFrame()
        tb.setObjectName("toolbar")
        tb.setFixedHeight(54)
        tl = QHBoxLayout(tb)
        tl.setContentsMargins(18, 0, 18, 0)
        tl.setSpacing(10)

        tl.addWidget(self._lbl(
            "SEARCH", None,
            f"color:{FG_DIM};font-size:9px;font-weight:700;letter-spacing:1px;"
        ))
        self._search = QLineEdit()
        self._search.setPlaceholderText("filter by name, type, module...")
        self._search.setMinimumWidth(300)
        self._search.textChanged.connect(self._apply_filters)
        tl.addWidget(self._search)

        self._f_all = self._fbtn("ALL", True)
        self._f_class = self._fbtn("CLASS", False)
        self._f_flag = self._fbtn("FFLAG", False)
        self._f_lua = self._fbtn("LUA", False)
        self._f_id = self._fbtn("IDENT", False)
        self._f_rbx = self._fbtn("ROBLOX", False)

        self._fgrp = QButtonGroup(self)
        self._fgrp.setExclusive(True)
        for b in (self._f_all, self._f_class, self._f_flag, self._f_lua, self._f_id, self._f_rbx):
            self._fgrp.addButton(b)
            tl.addWidget(b)
            b.clicked.connect(self._apply_filters)

        tl.addSpacing(6)

        tl.addWidget(self._lbl(
            "SHOW", None,
            f"color:{FG_DIM};font-size:9px;font-weight:700;letter-spacing:1px;"
        ))
        self._f_show_all = self._fbtn("BOTH", True)
        self._f_show_class = self._fbtn("CLASS ONLY", False)
        self._f_show_full = self._fbtn("FULL ONLY", False)

        self._show_grp = QButtonGroup(self)
        self._show_grp.setExclusive(True)
        for b in (self._f_show_all, self._f_show_class, self._f_show_full):
            self._show_grp.addButton(b)
            tl.addWidget(b)
            b.clicked.connect(self._apply_filters)

        tl.addSpacing(6)

        tl.addWidget(self._lbl(
            "MIN", None,
            f"color:{FG_DIM};font-size:9px;font-weight:700;letter-spacing:1px;"
        ))
        self._min_score = QSpinBox()
        self._min_score.setRange(0, 100)
        self._min_score.setValue(0)
        self._min_score.setSingleStep(10)
        self._min_score.setFixedWidth(55)
        self._min_score.valueChanged.connect(self._apply_filters)
        tl.addWidget(self._min_score)

        tl.addWidget(self._lbl(
            "LIMIT", None,
            f"color:{FG_DIM};font-size:9px;font-weight:700;letter-spacing:1px;"
        ))
        self._limit = QSpinBox()
        self._limit.setRange(1000, 9999999)
        self._limit.setValue(500000)
        self._limit.setSingleStep(50000)
        self._limit.setFixedWidth(90)
        tl.addWidget(self._limit)

        tl.addStretch()
        self._cnt = self._lbl("0 / 0", "cnt_lbl")
        tl.addWidget(self._cnt)
        root.addWidget(tb)

        wrap = QFrame()
        wrap.setObjectName("tbl_wrap")
        wl = QVBoxLayout(wrap)
        wl.setContentsMargins(0, 0, 0, 0)

        self._model = StringTableModel()
        self._proxy = StringFilterProxy()
        self._proxy.setSourceModel(self._model)
        self._proxy.setDynamicSortFilter(True)

        self._tbl = QTableView()
        self._tbl.setModel(self._proxy)
        self._tbl.setSortingEnabled(True)
        self._tbl.setAlternatingRowColors(True)
        self._tbl.setSelectionBehavior(QAbstractItemView.SelectRows)
        self._tbl.setSelectionMode(QAbstractItemView.ExtendedSelection)
        self._tbl.verticalHeader().setVisible(False)
        self._tbl.verticalHeader().setDefaultSectionSize(23)

        h = self._tbl.horizontalHeader()
        for i in range(6):
            h.setSectionResizeMode(i, QHeaderView.Interactive)
        h.setSectionResizeMode(6, QHeaderView.Stretch)
        self._tbl.setColumnWidth(0, 130)
        self._tbl.setColumnWidth(1, 90)
        self._tbl.setColumnWidth(2, 65)
        self._tbl.setColumnWidth(3, 50)
        self._tbl.setColumnWidth(4, 45)
        self._tbl.setColumnWidth(5, 135)

        self._tbl.setContextMenuPolicy(Qt.CustomContextMenu)
        self._tbl.customContextMenuRequested.connect(self._ctx_menu)

        wl.addWidget(self._tbl)
        root.addWidget(wrap, 1)

        sb = QStatusBar()
        self.setStatusBar(sb)
        self._status = QLabel("Ready — open Roblox Studio then hit scan.")
        sb.addWidget(self._status)
        self._prog = QProgressBar()
        self._prog.setFixedWidth(200)
        self._prog.setValue(0)
        sb.addPermanentWidget(self._prog)

    def _lbl(self, text, obj=None, style=None):
        la = QLabel(text)
        if obj:
            la.setObjectName(obj)
        if style:
            la.setStyleSheet(style)
        return la

    def _fbtn(self, text, checked):
        b = QPushButton(text)
        b.setObjectName("fb")
        b.setCheckable(True)
        b.setChecked(checked)
        return b

    def _do_scan(self, mode: str):
        if self._scanning:
            return

        procs = find_roblox_processes()
        if not procs:
            QMessageBox.critical(
                self, "Not Found",
                "No Roblox process found.\n\nOpen Roblox Studio, then click scan."
            )
            return

        pid, exe = procs[0]
        self._pid_lbl.setText(f" PID {pid} \u00b7 {exe}")
        self._current_mode = mode
        self._mode_lbl.setText(f" [{mode.upper()} MODE]")

        self._scanning = True
        self._stop_evt.clear()
        self._t0 = time.perf_counter()

        self._btn_class.setEnabled(False)
        self._btn_full.setEnabled(False)
        self._btn_stop.setEnabled(True)

        mode_label = "CLASS" if mode == SCAN_MODE_CLASS else "FULL"
        self._status.setText(f"{mode_label} scan on PID {pid} ({WORKER_THREADS} threads)...")

        self._drain_timer.start()
        self._speed_timer.start()

        self._worker = ScanWorker(
            pid, self._limit.value(), self._q, self._stop_evt, mode
        )
        self._worker.sig_progress.connect(self._on_progress, Qt.QueuedConnection)
        self._worker.sig_status.connect(self._on_worker_status, Qt.QueuedConnection)
        self._worker.sig_done.connect(self._on_done, Qt.QueuedConnection)
        self._worker.start()

    def _do_stop(self):
        self._stop_evt.set()
        self._status.setText("Stopping...")

    def _on_progress(self, done, total, found, bytes_scanned):
        pct = int(done / max(total, 1) * 100)
        self._prog.setValue(pct)
        mb = bytes_scanned / 1024 / 1024
        mode_label = self._current_mode.upper()
        self._status.setText(
            f"[{mode_label}] Region {done}/{total} \u00b7 "
            f"{found:,} unique \u00b7 {mb:.0f} MB"
        )

    def _on_worker_status(self, msg):
        self._status.setText(msg)

    def _drain_queue(self):
        batch = []
        try:
            for _ in range(DRAIN_BATCH):
                item = self._q.get_nowait()
                if item is None:
                    self._drain_timer.stop()
                    break
                batch.append(item)
        except queue.Empty:
            pass
        if batch:
            self._model.add_results(batch)
            self._upd_count()

    def _on_done(self, total, elapsed, bytes_total):
        self._scanning = False
        self._drain_timer.stop()
        self._speed_timer.stop()
        self._drain_queue()

        self._btn_class.setEnabled(True)
        self._btn_full.setEnabled(True)
        self._btn_stop.setEnabled(False)
        self._prog.setValue(100)

        rate = int(total / max(elapsed, 0.01))
        mb = bytes_total / 1024 / 1024
        mode_label = self._current_mode.upper()

        all_data = self._model.get_all()
        class_count = sum(1 for r in all_data if r.scan_mode == SCAN_MODE_CLASS)
        full_count = sum(1 for r in all_data if r.scan_mode == SCAN_MODE_FULL)

        cats = defaultdict(int)
        for r in all_data:
            if r.scan_mode == self._current_mode:
                cats[r.category] += 1
        cat_str = " \u00b7 ".join(
            f"{v:,} {k}" for k, v in sorted(cats.items(), key=lambda x: -x[1])
        )

        self._spd_lbl.setText(f" {rate:,}/s")
        self._status.setText(
            f"[{mode_label}] Done {elapsed:.1f}s \u00b7 +{total:,} unique \u00b7 "
            f"{mb:.0f} MB \u00b7 {cat_str} "
            f"| Total: {class_count:,} class + {full_count:,} full"
        )
        self._upd_count()

    def _tick_speed(self):
        if not self._scanning:
            return
        elapsed = max(time.perf_counter() - self._t0, 0.01)
        n = self._model.rowCount()
        self._spd_lbl.setText(f" {int(n / elapsed):,}/s")

    def _apply_filters(self, *_):
        try:
            search = self._search.text()

            type_filter = ""
            if self._f_class.isChecked():
                type_filter = "class"
            elif self._f_flag.isChecked():
                type_filter = "fflag"
            elif self._f_lua.isChecked():
                type_filter = "lua"
            elif self._f_id.isChecked():
                type_filter = "identifier"

            cat_filter = ""
            if self._f_rbx.isChecked():
                cat_filter = "roblox"

            mode_filter = ""
            if self._f_show_class.isChecked():
                mode_filter = SCAN_MODE_CLASS
            elif self._f_show_full.isChecked():
                mode_filter = SCAN_MODE_FULL

            self._proxy.set_search(search)
            self._proxy.set_type_filter(type_filter)
            self._proxy.set_cat_filter(cat_filter)
            self._proxy.set_min_score(self._min_score.value())
            self._proxy.set_mode_filter(mode_filter)
            self._upd_count()
        except Exception:
            pass

    def _upd_count(self):
        try:
            shown = self._proxy.rowCount()
            total = self._model.rowCount()
            class_count = len(self._model.get_by_mode(SCAN_MODE_CLASS))
            full_count = len(self._model.get_by_mode(SCAN_MODE_FULL))
            self._cnt.setText(
                f"{shown:,} shown / {total:,} total "
                f"(C:{class_count:,} F:{full_count:,})"
            )
        except Exception:
            pass

    def _do_clear(self):
        self._model.clear()
        self._prog.setValue(0)
        self._spd_lbl.setText("")
        self._mode_lbl.setText("")
        self._current_mode = ""
        self._upd_count()
        self._status.setText("Cleared.")

    def _do_export(self, mode: str):
        data = self._model.get_by_mode(mode)
        if not data:
            mode_label = mode.upper()
            QMessageBox.information(
                self, "Nothing to export",
                f"No {mode_label} results to export. Run a scan first."
            )
            return

        mode_label = mode.upper()
        default_name = f"rblxdumper_{mode}.json"
        path, _ = QFileDialog.getSaveFileName(
            self, f"Export {mode_label} Results",
            default_name,
            "JSON (*.json);;TSV (*.txt);;All (*)"
        )
        if not path:
            return

        if path.endswith(".json"):
            export = []
            for r in data:
                export.append({
                    "address": f"0x{r.addr:012X}",
                    "address_dec": r.addr,
                    "name": r.name,
                    "type": r.kind,
                    "category": r.category,
                    "score": r.score,
                    "refs": r.refs,
                    "module": r.module,
                    "scan_mode": r.scan_mode,
                })
            with open(path, "w", encoding="utf-8") as f:
                json.dump(export, f, indent=2, ensure_ascii=False)
        else:
            with open(path, "w", encoding="utf-8") as f:
                f.write("ADDRESS\tTYPE\tCATEGORY\tSCORE\tREFS\tMODULE\tMODE\tSTRING\n")
                for r in data:
                    f.write(
                        f"0x{r.addr:012X}\t{r.kind}\t{r.category}\t"
                        f"{r.score}\t{r.refs}\t{r.module}\t{r.scan_mode}\t{r.name}\n"
                    )

        QMessageBox.information(
            self, "Done",
            f"Saved {len(data):,} {mode_label} results to:\n{path}"
        )

    def _ctx_menu(self, pos):
        try:
            idx = self._tbl.indexAt(pos)
            if not idx.isValid():
                return

            source_idx = self._proxy.mapToSource(idx)
            if not source_idx.isValid():
                return

            r = self._model.get_result(source_idx.row())
            if r is None:
                return

            addr_str = f"0x{r.addr:012X}"

            m = QMenu(self)
            m.addAction(
                f"Copy address: {addr_str}",
                lambda: QApplication.clipboard().setText(addr_str)
            )
            display = r.name[:60] + ("..." if len(r.name) > 60 else "")
            m.addAction(
                f"Copy string: {display}",
                lambda: QApplication.clipboard().setText(r.name)
            )
            m.addSeparator()
            m.addAction("Copy as JSON", lambda: QApplication.clipboard().setText(
                json.dumps({
                    "address": addr_str,
                    "address_dec": r.addr,
                    "name": r.name,
                    "type": r.kind,
                    "category": r.category,
                    "score": r.score,
                    "refs": r.refs,
                    "module": r.module,
                    "scan_mode": r.scan_mode,
                }, indent=2)
            ))
            m.addAction(
                "Copy address (decimal)",
                lambda: QApplication.clipboard().setText(str(r.addr))
            )
            m.addSeparator()
            m.addAction("Filter by this string", lambda: self._search.setText(r.name))
            m.addAction(f"Filter by type: {r.kind}", lambda: self._search.setText(r.kind))
            if r.module:
                m.addAction(
                    f"Filter by module: {r.module}",
                    lambda: self._search.setText(r.module)
                )

            m.exec_(self._tbl.viewport().mapToGlobal(pos))
        except Exception:
            pass


if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setStyle("Fusion")
    pal = app.palette()
    pal.setColor(QPalette.Window, QColor(BG))
    app.setPalette(pal)
    win = MainWindow()
    win.show()
    sys.exit(app.exec_())