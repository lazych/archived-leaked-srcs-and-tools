shared.Cider = {

	['Globals'] = {
		['Key'] = "CIDER",
		['Config Mode'] = "File", --.// Ignore this
	},

	['Main'] = {
		['Silent Aim'] = {
			['Selection'] = 'Target', --// Automatic / Target
		},
		['Triggerbot'] = {
			['Selection'] = 'Target',
		},

		['Brand'] = { --// AKA 'Show Hotkeys'
			['Enabled'] = true, 
			['Feature'] = Color3.fromRGB(255, 255, 255),
			['Accent'] = Color3.fromRGB(100, 180, 255),
			['Position'] = 'Low Center',
		},

		['Checks'] = {
			['Targeting'] = {
				['Knocked'] = true, --// Used for target selection for "Target" Mode
				['Grabbed'] = true,
				['Vehicle'] = true,
				['Visible'] = false,
				['Tool'] = false,
				['Self Knocked'] = false,
				['Crew'] = true,
			},
			['Aimbot'] = {
				['Knocked'] = true,
				['Grabbed'] = true,
				['Vehicle'] = true,
				['Visible'] = true,
				['Tool'] = false,
				['Self Knocked'] = false,
				['Crew'] = true,
			},
			['Silent Aim'] = {
				['Knocked'] = true,
				['Grabbed'] = true,
				['Vehicle'] = true,
				['Visible'] = true,
				['Tool'] = false,
				['Self Knocked'] = false,
				['Crew'] = true,
			},
			['Triggerbot'] = {
				['Knocked'] = true,
				['Grabbed'] = true,
				['Vehicle'] = true,
				['Visible'] = true,
				['Tool'] = false,
				['Self Knocked'] = false,
				['Crew'] = true,
			},
		},

		['Binds'] = {
			['Target'] = 'C',
			['Aimbot'] = 'C',
			['ESP'] = 'B',
			['Walk Speed'] = 'V',
			['Jump Power'] = 'Z',
			['Double Tap'] = 'Y',
			['Sorter'] = 'U',
			['Anti Future'] = 'N',
			['Panic Ground'] = 'X',
		},

		['Gun Whitelist'] = {
			['Silent'] = {'[Double-Barrel SG]', '[Revolver]', '[TacticalShotgun]'},
			['Aimbot'] = {'[Double-Barrel SG]', '[Revolver]', '[TacticalShotgun]'},
			['Triggerbot'] = {'[Double-Barrel SG]', '[Revolver]', '[TacticalShotgun]'},
		},

		['FOV'] = {
			['Silent'] = {
				['Options'] = '2D',
				['Width'] = {1, 1},
				['Height'] = {1, 1},
				['3D'] = {
					['Width'] = 6,
					['Height'] = 6,
					['Depth'] = 10,
				},
				['Visualize'] = {
					['Enabled'] = false,
					['Color'] = Color3.fromRGB(255, 255, 255),
				},
			},
			['Aimbot'] = {
				['Options'] = '2D',
				['Width'] = {1, 1},
				['Height'] = {1, 1},
				['3D'] = {
					['Width'] = 6,
					['Height'] = 6,
					['Depth'] = 10,
				},
				['Visualize'] = {
					['Enabled'] = false,
					['Color'] = Color3.fromRGB(255, 255, 255),
				},
			},
			['Triggerbot'] = {
				['Options'] = '2D',
				['Width'] = {1, 1},
				['Height'] = {1, 1},
				['3D'] = {
					['Width'] = 6,
					['Height'] = 6,
					['Depth'] = 10,
				},
				['Visualize'] = {
					['Enabled'] = false,
					['Color'] = Color3.fromRGB(255, 255, 255),
				},
			},
		},
	},

	['Silent Aim'] = {
		['Enabled'] = true,
		['Max Range'] = math.huge,

		['Closest Point'] = {
			['Enabled'] = true,
			['Mode'] = 'Scaled',
			['Scale'] = 3,
		},

		['Target Tracer'] = {
			['Enabled'] = false,
			['Color'] = Color3.fromRGB(255, 85, 85),
			['Thickness'] = 0.5,
		},

		['Target Part'] = {
			['Part'] = 'Head',
		},

		['Prediction'] = {
			['Enabled'] = false,
			['Values'] = {
				['X'] = 0.13,
				['Y'] = 0.13,
				['Z'] = 0.13,
			},
		},

		['Auto Shoot'] = {
			['Enabled'] = true,
			['Wall Check'] = true,
			['Limit To Weapon Range'] = true,
		},

		['Offscreen Targeting'] = {
			['Enabled'] = true,
		},

		['Future'] = {
			['Enabled'] = true,
			['Lure'] = true,

			['Pistols'] = {
				['Values'] = {
					['X'] = 0.023,
					['Y'] = 0.023,
					['Z'] = 0.023,
				},
			},

			['Shotguns'] = {
				['Values'] = {
					['X'] = 0.018,
					['Y'] = 0.018,
					['Z'] = 0.018,
				},
			},

			['Others'] = {
				['Values'] = {
					['X'] = 0.013,
					['Y'] = 0.013,
					['Z'] = 0.013,
				},
			},
		},
	},

	['Aimbot'] = {
		['Enabled'] = true,
		['Mode'] = 'Toggle',
		['Max Range'] = math.huge,

		['Target Part'] = {
			['Part'] = 'Head',
		},

		['Closest Point'] = {
			['Enabled'] = true,
			['Mode'] = 'Scaled',
			['Scale'] = 3,
		},

		['Smoothing'] = {
			['Enabled'] = true,
			['X'] = 0.1,
			['Y'] = 0.1,
			['Z'] = 0.1,
			['Easing'] = {
				['In'] = 'Linear',
				['Out'] = 'InOut',
			},
		},

		['Prediction'] = {
			['Enabled'] = false,
			['Values'] = {
				['X'] = 0.13,
				['Y'] = 0.13,
				['Z'] = 0.13,
			},
		},
	},

	['Triggerbot'] = {
		['Enabled'] = false,
		['Max Range'] = math.huge,
		['Limit To Weapon Range'] = true,
		['Delay'] = 0,

		['Bind'] = {
			['Key'] = 'MouseButton1', --// 'MouseButton2' (if ur using mouse)
			['Mode'] = 'Keybind', --// 'Keybind' or 'Mouse'
			['Type'] = 'Hold', --// 'Hold' / 'Toggle' 
		},

		['Trigger Mode'] = 'FOV', --// FOV - Raycast

		['Prediction'] = {
			['Enabled'] = false,
			['Values'] = {
				['X'] = 0.13,
				['Y'] = 0.13,
				['Z'] = 0.13,
			},
		},

		['Offscreen Targeting'] = {
			['Enabled'] = true,
		},
	},

	['Name ESP'] = {
		['Enabled'] = true,

		['Color'] = Color3.fromRGB(255, 255, 255),
		['Target Color'] = Color3.fromRGB(100, 180, 255),
		['Text Size'] = 13,
		['Font'] = 'SourceSansBold',
	},

	['Health Bar'] = {
		['Enabled'] = true,
		['Position'] = 'Bottom', --// 'Bottom' or 'Top'
		['Show Armor'] = true, 
		['Health Color'] = Color3.fromRGB(90, 255, 90),
		['Armor Color'] = Color3.fromRGB(115, 115, 255),
	},

	['Modifications'] = {

		['Double Tap'] = {
			['Enabled'] = true,
			['Mode'] = 'Toggle', --// 'Toggle' or 'Always'

			['Weapon Configs'] = {
				['Enabled'] = true,
				['Shotguns'] = {
					['Enabled'] = true,
				},
				['Pistols'] = {
					['Enabled'] = true,
				},
				['Others'] = {
					['Enabled'] = false,
				},
			},
		},

		['Spread Modifications'] = {
			['Enabled'] = true,
			['Value'] = 0.2,

			['Randomizer'] = {
				['Enabled'] = false,
				['Min'] = 0.3,
				['Max'] = 0.5,
			},

			['Spread Angles'] = {
				['Enabled'] = false,
				['Game'] = 'zee',
			},
		},

		['Misc Gun Modifications'] = {
			['No Recoil'] = true,

			['Range Enhancer'] = {
				['Enabled'] = true,
				['Value'] = 16,
				['Use Hooks'] = true,
			},
		},

		['Das Hood'] = {
			['Inf Range'] = {
				['Enabled'] = false,
			},

			['Wallbang'] = {
				['Enabled'] = false,
			},

			['Damage Modifier'] = {
				['Enabled'] = true,
				['Weapons'] = {
					['Shotguns'] = {
						['Enabled'] = true,
						['Mode'] = 'full', --// "full", "half", "min".
					},
					['Pistols'] = {
						['Enabled'] = true,
						['Mode'] = 'full',
					},
					['Others'] = {
						['Enabled'] = true,
						['Mode'] = 'full',
					},
				},
			},
		},

		['Delay Changer'] = {
			['Enabled'] = true,
			['Delay'] = 0,

			['Weapon Configs'] = {
				['Enabled'] = false,
				['Shotguns'] = {
					['Delay'] = 0.05,
				},
				['Pistols'] = {
					['Delay'] = 0.01,
				},
				['Others'] = {
					['Delay'] = 0.02,
				},
			},
		},
	},

	['Movement'] = {
		['Anti Trip'] = true,
		['No Jump Cooldown'] = true,

		['Speed Modifications'] = {
			['Enabled'] = true,
			['Mode'] = 'Number',

			['Values'] = {
				['Number'] = 600,
				['Multiplier'] = 6.2,
			},

			['Conditions'] = {
				['Normal'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Knife'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Reload'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Shooting'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Low Health'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
			},
		},

		['Jump Modifications'] = {
			['Enabled'] = true,
			['Spiderman Mode'] = false,
			['Mode'] = 'Number',

			['Values'] = {
				['Number'] = 300,
				['Multiplier'] = 4,
			},

			['Conditions'] = {
				['Normal'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Knife'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Reload'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Shooting'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
				['Low Health'] = {
					['Enabled'] = true,
					['Multiplier'] = 1,
				},
			},
		},
	},

	['Utilities'] = {

		['Inventory Sorter'] = {
			['Enabled'] = true,

			['Order'] = {
				[1] = '[Knife]',
				[2] = '[Revolver]',
				[3] = '[Double-Barrel SG]',
				[4] = '[Tactical-Shotgun]',
			},
		},

		['Skin Changer'] = {
			['Enabled'] = true,

			['Skins'] = {
				['[Double-Barrel SG]'] = 'Galaxy',
				['[Revolver]'] = 'Galaxy',
				['[TacticalShotgun]'] = 'Galaxy',
				['[Knife]'] = 'Golden Age Tanto',
                ['[AUG]'] = 'GPOII',
			},
		},

		['Animation Changer'] = {
			['Enabled'] = true,

			['Animations'] = {
				['Idle'] = 'Zombie',
				['Run'] = 'Zombie',
				['Walk'] = 'Zombie',
				['Jump'] = 'Ninja',
				['Fall'] = 'Ninja',
				['Climb'] = 'Ninja',
				['Swim'] = 'Default',
				['SwimIdle'] = 'Default',
			},
		},

		['Hitbox Expander'] = {
			['Enabled'] = true,
			['Size'] = 15,
			['Target Only'] = true,
			['Visualize'] = false,
		},
	},

	['Anti Stomp'] = {
		['Enabled'] = false,
	},

	['Panic Ground'] = {
		['Enabled'] = true,
		['Auto'] = {
			['Enabled'] = false,
			['Health Amount'] = 25, --// Amount to automatically panic ground
		},
	},

	['Anti Future'] = {
		['Enabled'] = true, --// going way too high WILL get you banned, i reccomend around 10-150, 500+ for full rage.
        --// I reccomend you increase the strength higher the ping.
		['Options'] = {
			['Strength'] = 75, --// Going too high makes the jitter way too visible to the server
			['Randomness'] = 3,
			['Spoof Chance'] = 100,
			['Air Only'] = true,
			['Vertical'] = true,
		},
		['Visualize Server'] = true,
		['Direction'] = 'Kinematic', --// 'Random', 'Vertical', 'Behind' or 'Kinematic'.
		['Adjust Dynamically'] = { --// Boosts the next spoof when an incoming shot's ray passes near you.
			['Enabled'] = true,
			['Multiplier'] = 3,
		},
	},

	['Char'] = {
		['Enabled'] = false,
		['Target'] = 'richoffluau',
		['Override Animation'] = false,

		['Accessories'] = {
			['Enabled'] = true,
			['Headless'] = true,
			['Korblox'] = true,
		},

		['Body Size'] = {
			['Enabled'] = true,
			['Mode'] = 'Skinny', --// 'Skinny', 'Normal' or 'Fat'.
		},
	},
}

--[[ 
rolled cant code shit, indeded cant code shit, "xaii" is a alt of either indeded or rolled.
i had to do nothing with the ai dogshit inside this  scirpt indeded used claude for this dogshit
proof:
https://cdn.discordapp.com/attachments/1529081577710026773/1530238731771052192/image.png?ex=6a64d960&is=6a6387e0&hm=7802d535dfbd8daaf488e2f49c31d89a52681093ffb7e7371bbcef9d42f9db7d&0uZ107WE
proof of me coding (somewhat):
https://youtu.be/8OvU-0vxiEs

i never got paid for this, yes the skin changer and couple other stuff is pasted or poorly made but dont complain at me its indededs src
everything is a result of indeded being too poor to not pay me (rdk) and beefing with random people, i never got paid a single dollar
]]

if getgenv().cidercc_cleanup then
	getgenv().cidercc_cleanup();
	getgenv().cidercc_cleanup = nil;
end;

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera
local Inset = GuiService:GetGuiInset().Y


local function GetConfig()
	return shared.Cider;
end
local Config = GetConfig();

local LastAppliedSkins = {};
local ApplySkinToTool = nil;
local ReapplyAllSkins = nil;
local WatchCharacter = nil;
local WatchBackpack = nil;

local function UpdateConfig(newConfig)
	shared.Cider = newConfig;
	Config = newConfig;
	if ReapplyAllSkins then
		ReapplyAllSkins();
	end
end
_Conns = {};
_Draws = {};

function TrackConn(c) _Conns[#_Conns + 1] = c; return c; end;

MathRandom, MathFloor, MathCeil, MathClamp, MathAbs, MathSqrt, MathAtan2 = math.random, math.floor, math.ceil, math.clamp, math.abs, math.sqrt, math.atan2;
MathHuge, MathMin, MathMax, MathRad, MathDeg, MathPi, MathNoise = math.huge, math.min, math.max, math.rad, math.deg, math.pi, math.noise;

Vector2New, Vector3New, Vector3Zero = Vector2.new, Vector3.new, Vector3.zero;
CFrameNew, CFrameAngles, CFrameIdentity = CFrame.new, CFrame.Angles, CFrame.identity;
Color3RGB, Color3HSV, UDim2New = Color3.fromRGB, Color3.fromHSV, UDim2.new;
RayNew, RaycastParamsNew = Ray.new, RaycastParams.new;

Spawn, Defer, Delay, Wait, Cancel = task.spawn, task.defer, task.delay, task.wait, task.cancel;

Tick, Clock, Typeof, Unpack, Select = tick, os.clock, typeof, unpack, select;
Tonumber, Tostring, Pcall, Xpcall = tonumber, tostring, pcall, xpcall;

function ErrHandler(err)
	warn('nigger heres an error:', tostring(err));
	return err;
end;

local PreviousState = shared.__cider_state;

State = {
	Connections = {},
	Targets = {
		Silent = PreviousState and PreviousState.Targets and PreviousState.Targets.Silent or nil,
		Aimbot = PreviousState and PreviousState.Targets and PreviousState.Targets.Aimbot or nil,
		Triggerbot = PreviousState and PreviousState.Targets and PreviousState.Targets.Triggerbot or nil,
	},
	Toggles = {
		SilentAim = PreviousState and PreviousState.Toggles and PreviousState.Toggles.SilentAim ~= nil and PreviousState.Toggles.SilentAim or true,
		Aimbot = PreviousState and PreviousState.Toggles and PreviousState.Toggles.Aimbot ~= nil and PreviousState.Toggles.Aimbot or true,
		Triggerbot = PreviousState and PreviousState.Toggles and PreviousState.Toggles.Triggerbot ~= nil and PreviousState.Toggles.Triggerbot or true,
	},
	Cache = {
		Previous = {},
		Tracked = {},
	},
	Ticks = {
		Triggerbot = 0,
		Rage = {},
	},
	AutoShootStatus = 'Idle',
	TriggerState = false,
	CanTriggerbotShoot = true,
	LastTriggerShot = 0,
	SpeedModificationsActive = false,
	SpeedModificationHumanoid = nil,
	OriginalWalkSpeed = nil,
	JumpModificationsActive = false,
	IsShooting = false,
	SorterActive = false,
	DoubleTapActive = false,
	Future = {
		LastNetworkSample = 0,
		Ping = 0,
		Jitter = 0,
		LastTarget = nil,
		LastWeaponClass = nil,
		CurrentValues = nil,
	},
	AntiFuture = {
		Active = false,
		Connection = nil,
		LastSpoofedVelocity = nil,
		LastServerPosition = nil,
		LastSpoofTime = nil,
		BoostPending = false,
	},
	PanicGround = {
		AutoTriggered = false,
	},

};
shared.__cider_state = State;

local function RestoreWalkSpeedState(TargetState)
	if not TargetState then return end;
	local Humanoid = TargetState.SpeedModificationHumanoid;
	local OriginalWalkSpeed = TargetState.OriginalWalkSpeed;
	if Humanoid and Humanoid.Parent and OriginalWalkSpeed ~= nil then
		Pcall(function()
			Humanoid.WalkSpeed = OriginalWalkSpeed;
		end);
	end;
	TargetState.SpeedModificationHumanoid = nil;
	TargetState.OriginalWalkSpeed = nil;
end;

CachedIgnored = Workspace:FindFirstChild('Ignored');
CachedBush = Workspace:FindFirstChild('Bush');
CachedSkinAssets = ReplicatedStorage:FindFirstChild('SkinAssets');
CachedAnimations = ReplicatedStorage:FindFirstChild('Animations') or ReplicatedStorage:FindFirstChild('ClientAnimations');

ShootFilter = {};
RageFilter = {};

EnumExclude = Enum.RaycastFilterType.Exclude;
EnumJumping = Enum.HumanoidStateType.Jumping;
EnumFreefall = Enum.HumanoidStateType.Freefall;
EnumLanded = Enum.HumanoidStateType.Landed;
EnumAir = Enum.Material.Air;
EnumDead = Enum.HumanoidStateType.Dead;
EnumFallingDown = Enum.HumanoidStateType.FallingDown;
EnumRagdoll = Enum.HumanoidStateType.Ragdoll;
EnumGettingUp = Enum.HumanoidStateType.GettingUp;

function BuildFilter(Tbl, Character)
	local Idx = 0;
	if Character then Idx = Idx + 1; Tbl[Idx] = Character end;
	if CachedIgnored then Idx = Idx + 1; Tbl[Idx] = CachedIgnored end;
	if CachedBush then Idx = Idx + 1; Tbl[Idx] = CachedBush end;
	for i = Idx + 1, #Tbl do Tbl[i] = nil end;
	return Tbl;
end;

function ResolveBodyEffect(Player, Effect)
	local Object = Player and Player.Character;
	local Body = Object and Object:FindFirstChild('BodyEffects');
	return Body and Body:FindFirstChild(Effect) and Body[Effect].Value or false;
end;

function ResolveConstraint(Player, Tag)
	local Object = Player and Player.Character;
	return Object and Object:FindFirstChild(Tag) ~= nil or false;
end;

function ResolveRemote(Name)
	return function() return ReplicatedStorage:FindFirstChild(Name) end;
end;

Stub = function() return false end;

Games = {
	[1008451066] = {
		Name = 'Da Hood',
		Updater = 'UpdateMousePosI2',
		Knocked = function(P)
			return ResolveBodyEffect(P, 'K.O') end,
		Grabbed = function(P)
			return ResolveConstraint(P, 'GRABBING_CONSTRAINT') end,
		Remote = ResolveRemote('MainEvent'),
		Args = {"Handle", "MuzzlePos", "HitPosition", "HitInstance", "HitNormal"},
		Method = "Emulate",
		Hooks = nil,
	},
	['sixseveeen'] = {
		Name = 'Das Hood',
		Updater = "UpdateMousePos",
		Knocked = function(P)
			return ResolveBodyEffect(P, 'K.O') end,
		Grabbed = function(P)
			return ResolveConstraint(P, 'GRABBING_CONSTRAINT') end,
		Remote = ResolveRemote('MainEvent'),
		Args = {"Handle", "MuzzlePos", "HitInstance", "MuzzlePos", "HitPosition"},
		Method = "Mouse.Hit",
		Hooks = nil,
	},
	['Universal'] = {
		Name = 'Universal',
		Updater = nil,
		Knocked = function(P)
			return ResolveBodyEffect(P, 'K.O') end,
		Grabbed = function(P)
			return ResolveConstraint(P, 'GRABBING_CONSTRAINT') end,
		Remote = ResolveRemote('MainEvent'),
		Args = nil,
		Method = "Hooks",
		Hooks = "Raycast",
	},
};

Fallback = { Name = 'Universal', Updater = 'UpdateMousePos', Knocked = Stub, Grabbed = Stub, Remote = ResolveRemote('MainEvent') };
CurrentGame = Games[game.GameId] or Games['Universal'] or Fallback;

function CleanScripts(Tool)
	if not Tool then return end;
	for _, Descendant in next, Tool:GetDescendants() do
		if Descendant:IsA('LocalScript') then
			Descendant:Destroy();
		end;
	end;
	TrackConn(Tool.DescendantAdded:Connect(function(Desc)
		if Desc:IsA('LocalScript') then
			Desc:Destroy();
		end;
	end));
end;

if CurrentGame.Name == 'Da Hood' then
	function ApplySkinToTool(Tool, Force)
		if not Tool then return end;
		local Config = GetConfig();
		local SkinChangerCfg = Config['Utilities']['Skin Changer'];
		if not SkinChangerCfg or not SkinChangerCfg['Enabled'] then return end;
		local DesiredSkin = SkinChangerCfg['Skins'] and SkinChangerCfg['Skins'][Tool.Name];



		if not Force and LastAppliedSkins[Tool] == DesiredSkin then return end;
		LastAppliedSkins[Tool] = DesiredSkin;

		local SkinAssets = CachedSkinAssets;
		if not SkinAssets then return end;
		
		local SkinFolder;
		if Tool.Name == '[Knife]' then
			SkinFolder = SkinAssets:FindFirstChild('KnifeSkins') and SkinAssets.KnifeSkins:FindFirstChild(DesiredSkin);
		else
			SkinFolder = SkinAssets:FindFirstChild('GunSkins') and SkinAssets.GunSkins:FindFirstChild(DesiredSkin);
		end
		
		local Default = Tool:FindFirstChild('Default');
		if not Default then return end;
		

		local ExistingMesh = Default:FindFirstChild('Mesh');
		if ExistingMesh then ExistingMesh:Destroy() end;
		

		if SkinFolder then
			local SkinMesh = SkinFolder:FindFirstChildWhichIsA('BasePart') or SkinFolder:FindFirstChild('Mesh');
			if SkinMesh then
				local ClonedMesh = SkinMesh:Clone();
				ClonedMesh.Parent = Default;
				ClonedMesh.Name = 'Mesh';
			end
		end
		

		local Handle = Tool:FindFirstChild('Handle');
		if Handle then
			Handle:SetAttribute('SkinName', DesiredSkin or '');
		end
	end;

	function ReapplyAllSkins()
		local Character = LocalPlayer.Character;
		if Character then
			for _, Child in next, Character:GetChildren() do
				if Child:IsA('Tool') then
					ApplySkinToTool(Child);
				end
			end
		end
		local Backpack = LocalPlayer:FindFirstChild('Backpack');
		if Backpack then
			for _, Child in next, Backpack:GetChildren() do
				if Child:IsA('Tool') then
					ApplySkinToTool(Child);
				end
			end
		end
	end

	function WatchCharacter(Character)
		if not Character then return end;
		for _, Child in next, Character:GetChildren() do
			if Child:IsA('Tool') then 
				CleanScripts(Child);
				ApplySkinToTool(Child);
			end;
		end;
		TrackConn(Character.ChildAdded:Connect(function(Child)
			if Child:IsA('Tool') then
				CleanScripts(Child);
				Defer(CleanScripts, Child);
				Defer(ApplySkinToTool, Child);
			end;
		end));
	end;
	
	function WatchBackpack(Backpack)
		if not Backpack then return end;
		for _, Child in next, Backpack:GetChildren() do
			if Child:IsA('Tool') then
				ApplySkinToTool(Child);
			end;
		end;
		TrackConn(Backpack.ChildAdded:Connect(function(Child)
			if Child:IsA('Tool') then
				Defer(ApplySkinToTool, Child);
			end;
		end));
	end;
	
	if LocalPlayer.Character then WatchCharacter(LocalPlayer.Character) end;
	if LocalPlayer:FindFirstChild('Backpack') then WatchBackpack(LocalPlayer.Backpack) end;
	TrackConn(LocalPlayer.CharacterAdded:Connect(WatchCharacter));
	TrackConn(LocalPlayer.ChildAdded:Connect(function(Child)
		if Child:IsA('Backpack') then
			WatchBackpack(Child);
		end
	end));
end;

PositionCache = {};
PositionHistorySize = 8;
PositionSampleInterval = 0.03;
LastPositionCacheUpdate = 0;

PositionEntryPool = {};
PositionPoolSize = 0;

function AcquireEntry(Pos, Time)
	local E;
	if PositionPoolSize > 0 then
		E = PositionEntryPool[PositionPoolSize];
		PositionEntryPool[PositionPoolSize] = nil;
		PositionPoolSize = PositionPoolSize - 1;
		E.Position = Pos;
		E.Time = Time;
	else
		E = { Position = Pos, Time = Time };
	end;
	return E;
end;

function ReleaseEntry(E)
	PositionPoolSize = PositionPoolSize + 1;
	PositionEntryPool[PositionPoolSize] = E;
end;

UpdatePositionCache = function()
	local Now = Clock();
	if (Now - LastPositionCacheUpdate) < PositionSampleInterval then return end;
	LastPositionCacheUpdate = Now;
	for _, Player in next, Players:GetPlayers() do
		if Player ~= LocalPlayer and Player.Character then
			local RootPart = Player.Character:FindFirstChild('HumanoidRootPart');
			if RootPart then
				if not PositionCache[Player] then
					PositionCache[Player] = {};
				end;
				local Cache = PositionCache[Player];
				local LastEntry = Cache[1];
				if not LastEntry or (Now - LastEntry.Time) >= PositionSampleInterval then
					table.insert(Cache, 1, AcquireEntry(RootPart.Position, Now));
					if #Cache > PositionHistorySize then
						ReleaseEntry(Cache[#Cache]);
						Cache[#Cache] = nil;
					end;
				end;
			end;
		end;
	end;
	for Player in next, PositionCache do
		if not Player.Parent then
			PositionCache[Player] = nil;
		end;
	end;
end;

GetDeltaVelocity = function(Player)
	local Velocity = GetSmoothedTargetMotion(Player);
	return Velocity;
end;

GetSmoothedTargetMotion = function(Player)
	local Cache = PositionCache[Player];
	if not Cache or #Cache < 2 then return Vector3Zero, Vector3Zero end;
	local Newest = Cache[1];
	local SampleIdx = MathMin(#Cache, 4);
	local Oldest = Cache[SampleIdx];
	local DeltaTime = Newest.Time - Oldest.Time;
	if DeltaTime <= 0.001 then return Vector3Zero, Vector3Zero end;

	local Velocity = (Newest.Position - Oldest.Position) / DeltaTime;
	local Acceleration = Vector3Zero;
	if #Cache >= 4 then
		local RecentTime = Cache[1].Time - Cache[2].Time;
		local OlderTime = Cache[3].Time - Cache[4].Time;
		local BetweenTime = ((Cache[1].Time + Cache[2].Time) - (Cache[3].Time + Cache[4].Time)) * 0.5;
		if RecentTime > 0.001 and OlderTime > 0.001 and BetweenTime > 0.001 then
			local RecentVelocity = (Cache[1].Position - Cache[2].Position) / RecentTime;
			local OlderVelocity = (Cache[3].Position - Cache[4].Position) / OlderTime;
			Acceleration = (RecentVelocity - OlderVelocity) / BetweenTime;
		end;
	end;

	if Velocity.Magnitude > 350 then Velocity = Vector3Zero end;
	if Acceleration.Magnitude > 1500 then Acceleration = Vector3Zero end;
	return Velocity, Acceleration;
end;

LureFutureBaselines = {
	Shotguns = 0.018,
	Pistols = 0.023,
	Others = 0.013,
};

UpdateFutureNetwork = function()
	local FutureState = State.Future;
	local Now = Clock();
	if (Now - (FutureState.LastNetworkSample or 0)) < 0.10 then return end;
	FutureState.LastNetworkSample = Now;

	local Ping;
	local Ok, Result = Pcall(function()
		return LocalPlayer:GetNetworkPing();
	end);
	if Ok and type(Result) == 'number' and Result >= 0 then
		Ping = Result > 1 and Result / 1000 or Result;
	end;
	if not Ping then return end;

	local Alpha = 0.15;
	if FutureState.Ping <= 0 then
		FutureState.Ping = Ping;
		FutureState.Jitter = 0;
	else
		FutureState.Jitter = FutureState.Jitter + (MathAbs(Ping - FutureState.Ping) - FutureState.Jitter) * Alpha;
		FutureState.Ping = FutureState.Ping + (Ping - FutureState.Ping) * Alpha;
	end;
end;

GetLureFutureValues = function(Target, ToolName, ClassCfg)
	UpdateFutureNetwork();
	local FutureState = State.Future;
	local WeaponClass = GetWeaponClass(ToolName or '');
	if FutureState.LastTarget ~= Target or FutureState.LastWeaponClass ~= WeaponClass then
		FutureState.LastTarget = Target;
		FutureState.LastWeaponClass = WeaponClass;
		FutureState.CurrentValues = nil;
	end;

	local ConfigValues = ClassCfg and ClassCfg['Values'] or nil;
	local BaseX = ConfigValues and tonumber(ConfigValues['X']) or LureFutureBaselines[WeaponClass] or LureFutureBaselines.Others;
	local BaseY = ConfigValues and tonumber(ConfigValues['Y']) or BaseX;
	local BaseZ = ConfigValues and tonumber(ConfigValues['Z']) or BaseX;
	local NetworkOffset = (FutureState.Ping or 0) * 0.5 + 0.01 + (FutureState.Jitter or 0) * 0.5;
	local Minimum = 0.01;
	local Maximum = 0.20;
	local Alpha = 0.15;
	local Current = FutureState.CurrentValues;
	local Desired = Vector3New(
		MathClamp(BaseX + NetworkOffset, Minimum, Maximum),
		MathClamp(BaseY + NetworkOffset, Minimum, Maximum),
		MathClamp(BaseZ + NetworkOffset, Minimum, Maximum)
	);
	if Current then
		Current = Current + (Desired - Current) * Alpha;
	else
		Current = Desired;
	end;
	FutureState.CurrentValues = Current;

	local Velocity, Acceleration = GetSmoothedTargetMotion(Target);
	if Velocity.Magnitude < 2 then
		Velocity = Vector3Zero;
		Acceleration = Vector3Zero;
	end;
	return Current, Velocity, Acceleration;
end;

ApplyPrediction = function(Position, Target, FeatureCfg)
	local Character = Target.Character;
	if not Character then return Position end;
	local RootPart = Character:FindFirstChild('HumanoidRootPart');
	if not RootPart then return Position end;

	local PredCfg = FeatureCfg['Prediction'];
	if not PredCfg or PredCfg['Enabled'] ~= true then return Position end;

	local Vel = GetDeltaVelocity(Target);
	local Values = PredCfg['Values'] or {};
	local PredX = Values['X'] or 0.13;
	local PredY = Values['Y'] or 0.13;
	local PredZ = Values['Z'] or 0.13;

	return Position + Vel * Vector3New(PredX, PredY, PredZ);
end;

ApplyFuture = function(Position, Target, ToolName, FutureCfg)
	local Character = Target and Target.Character;
	if not Character then return Position end;
	local RootPart = Character:FindFirstChild('HumanoidRootPart');
	if not RootPart then return Position end;
	if not FutureCfg then return Position end;
	if FutureCfg['Enabled'] == false then return Position end;

	local WeaponClass = GetWeaponClass(ToolName or '');
	local ClassCfg = FutureCfg[WeaponClass] or FutureCfg['Others'];
	local UseLure = FutureCfg['Lure'] == true;

	if not UseLure then
		local ManualValues = ClassCfg and ClassCfg['Values'] or {};
		local Velocity = GetDeltaVelocity(Target);
		return Position + Velocity * Vector3New(
			ManualValues['X'] or 0.02301,
			ManualValues['Y'] or 0.08002,
			ManualValues['Z'] or 0.013005
		);
	end;

	local Values, Velocity, Acceleration = GetLureFutureValues(Target, ToolName, ClassCfg);

	local Predicted = Position + Velocity * Values;
	local AccelerationScale = Vector3New(Values.X * Values.X, Values.Y * Values.Y, Values.Z * Values.Z) * 0.5;
	Predicted = Predicted + Vector3New(
		Acceleration.X * AccelerationScale.X,
		Acceleration.Y * AccelerationScale.Y,
		Acceleration.Z * AccelerationScale.Z
	);
	return Predicted;
end;

VisibilityParams = RaycastParamsNew();
VisibilityParams.FilterType = EnumExclude;
VisibilityParams.IgnoreWater = true;

function IsTyping()
	return UserInputService:GetFocusedTextBox() ~= nil;
end;

function IsCrew(Player)
	local PlayerCrew = Player and Player:GetAttribute('CrewID');
	local ClientCrew = LocalPlayer:GetAttribute('CrewID');
	return PlayerCrew and ClientCrew and PlayerCrew == ClientCrew or false;
end;

VisibilityFilter = {};
VisibilityCache = {};
VisibilityCacheFrame = 0;

IsVisible = function(TargetPos, Player)
	local FrameNow = MathFloor(Clock() * 60 + 0.5);
	if FrameNow ~= VisibilityCacheFrame then
		VisibilityCacheFrame = FrameNow;
		table.clear(VisibilityCache);
	end;
	if Player and VisibilityCache[Player] ~= nil then
		return VisibilityCache[Player];
	end;
	local Origin = Camera.CFrame.Position;
	local Direction = TargetPos - Origin;
	local Character = LocalPlayer.Character;
	local Idx = 0;
	if Character then Idx = Idx + 1; VisibilityFilter[Idx] = Character end;
	if CachedIgnored then Idx = Idx + 1; VisibilityFilter[Idx] = CachedIgnored end;
	if CachedBush then Idx = Idx + 1; VisibilityFilter[Idx] = CachedBush end;
	for i = Idx + 1, #VisibilityFilter do VisibilityFilter[i] = nil end;
	VisibilityParams.FilterDescendantsInstances = VisibilityFilter;
	local Result = Workspace:Raycast(Origin, Direction, VisibilityParams);
	local Visible = true;
	if Result then
		local Hit = Result.Instance;
		if Hit then
			local Model = Hit:FindFirstAncestorOfClass('Model');
			if not Model or not Model:FindFirstChildOfClass('Humanoid') then Visible = false end;
		else
			Visible = false;
		end;
	end;
	if Player then VisibilityCache[Player] = Visible end;
	return Visible;
end;

function GetGroundPosition(Position, ExcludeInstances)
	local Params = RaycastParams.new();
	Params.FilterType = EnumExclude;
	Params.FilterDescendantsInstances = ExcludeInstances or {};
	local Result = Workspace:Raycast(Position, Vector3New(0, -2000, 0), Params);
	return Result and Result.Position or nil;
end;

function RunPanicGround()
	local Character = LocalPlayer.Character;
	local HRP = Character and Character:FindFirstChild('HumanoidRootPart');
	local Humanoid = Character and Character:FindFirstChildOfClass('Humanoid');
	if not HRP then return end;

	local GroundPos = GetGroundPosition(HRP.Position, {Character});
	if not GroundPos then return end;

	HRP.CFrame = CFrameNew(GroundPos.X, GroundPos.Y + 3, GroundPos.Z) * (HRP.CFrame - HRP.CFrame.Position);
	HRP.AssemblyLinearVelocity = Vector3Zero;
	HRP.AssemblyAngularVelocity = Vector3Zero;

	if Humanoid then
		Humanoid.Jump = false;
		Humanoid:ChangeState(EnumLanded);
	end;
end;

function GetAntiFutureBoostMultiplier(cfg)
	local AdjustCfg = cfg['Adjust Dynamically'];
	if not AdjustCfg or not AdjustCfg['Enabled'] or not State.AntiFuture.BoostPending then
		return 1;
	end;

	State.AntiFuture.BoostPending = false;
	return AdjustCfg['Multiplier'] or 3;
end;

function TriggerAntiFutureBoost()
	local cfg = GetConfig()['Anti Future'];
	local AdjustCfg = cfg['Adjust Dynamically'];
	if not cfg['Enabled'] or not State.AntiFuture.Active or not AdjustCfg or not AdjustCfg['Enabled'] then return end;
	State.AntiFuture.BoostPending = true;
end;

function DistancePointToSegment(Point, SegStart, SegEnd)
	local SegVector = SegEnd - SegStart;
	local Len2 = SegVector:Dot(SegVector);
	if Len2 <= 1e-6 then
		return (Point - SegStart).Magnitude;
	end;
	local t = MathClamp((Point - SegStart):Dot(SegVector) / Len2, 0, 1);
	local Closest = SegStart + SegVector * t;
	return (Point - Closest).Magnitude;
end;

function RunAntiFutureToggle()
	local cfg = GetConfig()['Anti Future'];
	if not cfg['Enabled'] then return end;

	if State.AntiFuture.Active then
		State.AntiFuture.Active = false;
		State.AntiFuture.LastSpoofedVelocity = nil;
		State.AntiFuture.LastServerPosition = nil;
		State.AntiFuture.LastSpoofTime = nil;
		State.AntiFuture.BoostPending = false;
		if State.AntiFuture.Connection then
			State.AntiFuture.Connection:Disconnect();
			State.AntiFuture.Connection = nil;
		end;
		return;
	end;

	State.AntiFuture.Active = true;
	State.AntiFuture.BoostPending = false;

	local function RandSigned(minV, maxV)
		local v = MathRandom(minV, maxV);
		if MathRandom(0, 1) == 0 then v = -v end;
		return v;
	end;

	State.AntiFuture.Connection = TrackConn(RunService.Heartbeat:Connect(function()
		local live_cfg = GetConfig()['Anti Future'];
		local options = live_cfg['Options'] or {};
		local live_character = LocalPlayer.Character;
		local live_hrp = live_character and live_character:FindFirstChild('HumanoidRootPart');
		local live_hum = live_character and live_character:FindFirstChildOfClass('Humanoid');

		if not State.AntiFuture.Active then
			State.AntiFuture.LastSpoofedVelocity = nil;
			State.AntiFuture.LastServerPosition = nil;
			State.AntiFuture.LastSpoofTime = nil;
			State.AntiFuture.BoostPending = false;
			if State.AntiFuture.Connection then
				State.AntiFuture.Connection:Disconnect();
				State.AntiFuture.Connection = nil;
			end;
			return;
		end;

		if not live_hrp then return end;

		if options['Air Only'] and live_hum then
			local st = live_hum:GetState();
			if st ~= EnumJumping and st ~= EnumFreefall then
				State.AntiFuture.LastServerPosition = live_hrp.Position;
				State.AntiFuture.LastSpoofedVelocity = nil;
				State.AntiFuture.LastSpoofTime = nil;
				return;
			end;
		end;

		local chance = options['Spoof Chance'] or 100;
		if chance < 100 and MathRandom(1, 100) > chance then
			State.AntiFuture.LastServerPosition = live_hrp.Position;
			State.AntiFuture.LastSpoofedVelocity = nil;
			State.AntiFuture.LastSpoofTime = nil;
			return;
		end;

		local strength = (options['Strength'] or 400) * GetAntiFutureBoostMultiplier(live_cfg);
		local randomness = options['Randomness'] or 3;
		if randomness < 1 then randomness = 1 end;
		local vertical = options['Vertical'] ~= false;
		local real_velocity = live_hrp.AssemblyLinearVelocity;

		local spoofed;
		if live_cfg['Direction'] == 'Vertical' then
			spoofed = Vector3New(0, vertical and RandSigned(strength, strength * randomness) or 0, 0);
		elseif live_cfg['Direction'] == 'Behind' then
			local HorizontalReal = Vector3New(real_velocity.X, 0, real_velocity.Z);
			local BehindDir = (HorizontalReal.Magnitude > 1) and -HorizontalReal.Unit or -live_hrp.CFrame.LookVector;
			local Mag = MathRandom(strength, strength * randomness);
			local SpoofY = vertical and RandSigned(strength, strength * randomness) or 0;
			spoofed = Vector3New(BehindDir.X * Mag, SpoofY, BehindDir.Z * Mag);
		elseif live_cfg['Direction'] == 'Kinematic' then
			local Gravity = Workspace.Gravity or 196.2;
			local Scale = strength / MathMax(real_velocity.Magnitude, 16);
			local KinematicVel = -real_velocity * Scale;
			local SpoofY = vertical and (KinematicVel.Y - Gravity * MathRandom(strength, strength * randomness) / 100) or 0;
			spoofed = Vector3New(KinematicVel.X, SpoofY, KinematicVel.Z);
		else
			spoofed = Vector3New(
				RandSigned(strength, strength * randomness),
				vertical and RandSigned(strength, strength * randomness) or 0,
				RandSigned(strength, strength * randomness)
			);
		end;
		State.AntiFuture.LastSpoofedVelocity = spoofed;
		State.AntiFuture.LastServerPosition = live_hrp.Position;
		State.AntiFuture.LastSpoofTime = Clock();

		live_hrp.AssemblyLinearVelocity = spoofed;
		RunService.RenderStepped:Wait();
		live_hrp.AssemblyLinearVelocity = real_velocity;
	end));
end;

PassesConditions = function(Player, ChecksKey)
	local AllChecks = GetConfig()['Main']['Checks'];
	local Conds = (ChecksKey and AllChecks[ChecksKey]) or {};
	local Character = Player and Player.Character;
	if not Character then return false end;
	local Humanoid = Character:FindFirstChildOfClass('Humanoid');

	if Conds['Knocked'] then
		if not Humanoid or Humanoid.Health <= 0 or Humanoid:GetState() == EnumDead then
			return false;
		end;
		if CurrentGame.Knocked(Player) then
			return false;
		end;
	end;

	if Conds['Grabbed'] then
		if CurrentGame.Grabbed(Player) then
			return false;
		end;
	end;

	if Conds['Vehicle'] then
		if Humanoid and Humanoid.Sit then
			return false;
		end;
	end;

	if Conds['Visible'] then
		local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart');
		if HumanoidRootPart and not IsVisible(HumanoidRootPart.Position, Player) then
			return false;
		end;
	end;

	if Conds['Tool'] then
		local MyChar = LocalPlayer.Character;
		if MyChar and not MyChar:FindFirstChildOfClass('Tool') then
			return false;
		end;
	end;

	if Conds['Self Knocked'] then
		if CurrentGame.Knocked(LocalPlayer) then
			return false;
		end;
	end;

	if Conds['Crew'] then
		if IsCrew(Player) then
			return false;
		end;
	end;

	return true;
end;

MuzzleOffsets = { 
	['[Deagle]'] = CFrameNew(0, 0.382, -1.568),
	['[Revolver]'] = CFrameNew(-0.1, 0.4, 1.8),
	['[Double-Barrel SG]'] = CFrameNew(0, 0.25, -2.5),
	['[TacticalShotgun]'] = CFrameNew(0, 0.7, -3.8),
	['[Silencer]'] = CFrameNew(0, 0.4, 1.3),
	['[SMG]'] = CFrameNew(2.5, 0.35, 0),
	['[Rifle]'] = CFrameNew(0, 0.2, -1.7),
	['[Shotgun]'] = CFrameNew(0, 0.4, 2.4),
	['[Flintlock]'] = CFrameNew(0, 0.25, 2.5),
	['[AK47]'] = CFrameNew(0.6, 0.25, 0),
	['[Glock]'] = CFrameNew(0, 0.4, 1.5),
	['[AR]'] = CFrameNew(0, 0.3, -2.0),
	['[AUG]'] = CFrameNew(0, 0.3, -2.5),
	['[Drum-Shotgun]'] = CFrameNew(0, 0.4, -2.0),
	['[DrumGun]'] = CFrameNew(0, 0.3, -1.5),
	['[LMG]'] = CFrameNew(0, 0.3, -2.5),
	['[P90]'] = CFrameNew(0, 0.3, -1.8),
	['[SilencerAR]'] = CFrameNew(0, 0.3, -2.0),
};

ShotgunWeapons = {
	['[Double-Barrel SG]'] = true,
	['[TacticalShotgun]'] = true,
	['[Tactical Shotgun]'] = true,
	['[Tactical-Shotgun]'] = true,
	['[Shotgun]'] = true,
	['[Drum-Shotgun]'] = true,
};

PistolWeapons = {
	['[Revolver]'] = true,
	['[Silencer]'] = true,
	['[Glock]'] = true,
	['[Deagle]'] = true,
};

local GetWeaponClass = function(name)
	if ShotgunWeapons[name] then return 'Shotguns' end;
	if PistolWeapons[name] then return 'Pistols' end;
	return 'Others';
end;

local GetToolFireDelay = function(Tool)
	local DefaultCooldown = 0.3;
	local CD = Tool and Tool:FindFirstChild('ShootingCooldown');
	if CD then DefaultCooldown = CD.Value end;
	local DelayCfg = GetConfig()['Modifications']['Delay Changer'];
	if not DelayCfg['Enabled'] then return DefaultCooldown end;
	local WeaponDelay = DelayCfg['Delay'];
	local WCfg = DelayCfg['Weapon Configs'];
	if WCfg and WCfg['Enabled'] and Tool then
		local WClass = GetWeaponClass(Tool.Name);
		WeaponDelay = WCfg[WClass]['Delay'] or WeaponDelay;
	end;
	return WeaponDelay;
end;

local EmulatedGunHandler = nil;
local EmulatedGunHandlerAttempted = false;
local GunhandlerSource = [=[

local t = {
	"[Shotgun]",
	"[Drum-Shotgun]",
	"[Rifle]",
	"[TacticalShotgun]",
	"[AR]",
	"[AUG]",
	"[AK47]",
	"[LMG]",
	"[SilencerAR]"
}
local t2 = {
	Brainrot = "All"
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CurrentCamera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")

game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local v1 = LocalPlayer:GetMouse()
local SkinAssets = ReplicatedStorage.SkinAssets
local v2 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local v3 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage:WaitForChild("Animations"):WaitForChild("GunCombat"):WaitForChild("Shoot"))
local v4 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage:WaitForChild("Animations"):WaitForChild("GunCombat"):WaitForChild("ShootLeft"))
local v5 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Animations.GunCombat.ShootRight)
local v6 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage:WaitForChild("Animations"):WaitForChild("GunCombat"):WaitForChild("AimShoot"))
local v7 = workspace:GetServerTimeNow()
local isPlaceId = game.PlaceId == 88976059384565
local GunSoundPlay = require(ReplicatedStorage:WaitForChild("GunSoundPlay"))

local function evalColorSequence(p1, p2)
	if p2 == 0 then
		return p1.Keypoints[1].Value
	end

	if p2 == 1 then
		return p1.Keypoints[#p1.Keypoints].Value
	end

	for i = 1, #p1.Keypoints - 1 do
		local v1 = p1.Keypoints[i]
		local v2 = p1.Keypoints[i + 1]

		if v1.Time <= p2 and p2 < v2.Time then
			local v3 = (p2 - v1.Time) / (v2.Time - v1.Time)

			return Color3.new((v2.Value.R - v1.Value.R) * v3 + v1.Value.R, (v2.Value.G - v1.Value.G) * v3 + v1.Value.G, (v2.Value.B - v1.Value.B) * v3 + v1.Value.B)
		end
	end
end

local function playerShot(p1)
	if v2 ~= LocalPlayer.Character then
		v3 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Animations.GunCombat.Shoot)
		v4 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Animations.GunCombat.ShootLeft)
		v5 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Animations.GunCombat.ShootRight)
		v6 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Animations.GunCombat.AimShoot)
	end

	if _G.Aimed or (_G.MobleAimingIn or table.find(t, p1.Parent.Name)) then
		v6:Play()

		return
	end

	if p1:GetAttribute("DualWield") then
		v4:Play()
		v5:Play()
	else
		v3:Play()
	end
end

shared.playerShot = playerShot

local t3 = {
	getCanShoot = require(script.CanShoot),
	getAim = function(p1, p2)
		local v12 = RaycastParams.new()
		local t = { LocalPlayer.Character }
		local v2 = p2 or 200

		for v3, v4 in workspace.Ignored:GetChildren() do
			table.insert(t, v4)
		end

		v12.FilterDescendantsInstances = t
		v12.FilterType = Enum.RaycastFilterType.Exclude
		v12.IgnoreWater = true

		local v5

		if _G.MobileShiftLock or _G.MobleAimingIn then
			local Position = CurrentCamera.CFrame.Position
			local v6 = CurrentCamera.CFrame.LookVector * v2
			local v7 = workspace:Raycast(Position, v6, v12)

			v5 = if v7 then v7.Position else Position + v6
		else
			local v8 = CurrentCamera:ScreenPointToRay(v1.X, v1.Y)
			local v9 = workspace:Raycast(v8.Origin, v8.Direction * v2, v12)

			if v9 then
				v5 = v9.Position
			else
				local v10 = CurrentCamera.CFrame
				local LookVector = v10.LookVector
				local Origin = v8.Origin
				local Direction = v8.Direction

				v5 = Origin + Direction * ((v10.Position + v10.LookVector * v2 - Origin):Dot(LookVector) / Direction:Dot(LookVector))
			end
		end

		local v122 = v5 - p1

		return v122.Unit, v122.Magnitude
	end
}
local t4 = {}

function t3.shoot(p1)
	local Shooter = p1.Shooter
	local Handle = p1.Handle
	local BeamColor = p1.BeamColor
	local isReflecting = p1.isReflecting
	local Hit = p1.Hit
	local v1 = p1.Range or 200
	local v2 = Handle and Handle:GetAttribute("SkinName")
	local IsLeftHand = p1.IsLeftHand
	local v3 = Players:GetPlayerFromCharacter(Shooter)
	local v4 = v3 and v3:GetAttribute("GunFX") == true
	local _, v5 = t3.getAim(Handle.Position, v1)

	if Shooter ~= LocalPlayer.Character then
		v5 = v1
	end

	local v6 = p1.ForcedOrigin or Handle.Muzzle.WorldPosition
	local Unit = (p1.AimPosition - v6).Unit
	local v72 = RaycastParams.new()
	local t = {}
	local Ignored = require(game.ReplicatedStorage.MainModule).Ignored

	t[1] = Shooter
	t[2] = unpack(Ignored)
	v72.FilterDescendantsInstances = t
	v72.FilterType = Enum.RaycastFilterType.Exclude
	v72.IgnoreWater = true

	local v8, v9, v10

	if Hit then
		v8 = p1.Hit
		v9 = p1.AimPosition
		v10 = p1.Normal
	else
		local v11 = workspace:Raycast(v6, Unit * v1, v72)

		if v11 then
			v8 = v11.Instance
			v9 = v11.Position
			v10 = v11.Normal
		else
			v9 = v6 + Unit * math.min(v5, v1)
			v8 = nil
			v10 = nil
		end
	end

	if v8 then
		local isName = v8.Name == "Head"
	end

	if Shooter ~= LocalPlayer.Character then
		local BoostChar = LocalPlayer.Character;
		local BoostHRP = BoostChar and BoostChar:FindFirstChild('HumanoidRootPart');
		if BoostHRP then
			local RayTouchingMe = (v8 and v8:IsDescendantOf(BoostChar)) or DistancePointToSegment(BoostHRP.Position, v6, v9) <= 4;
			if RayTouchingMe then
				TriggerAntiFutureBoost();
			end;
		end;
	end;

	local BULLET_RAYS = Instance.new("Part")

	BULLET_RAYS:SetAttribute("OwnerCharacter", Shooter.Name)
	BULLET_RAYS.Name = "BULLET_RAYS"
	BULLET_RAYS.Anchored = true
	BULLET_RAYS.CanCollide = false
	BULLET_RAYS.Size = Vector3.new(0, 0, 0)
	BULLET_RAYS.Transparency = 1
	game.Debris:AddItem(BULLET_RAYS, 1)
	BULLET_RAYS.CFrame = CFrame.new(v6, v9)
	BULLET_RAYS.Material = Enum.Material.SmoothPlastic
	BULLET_RAYS.Parent = workspace.Ignored.Siren.Radius

	local Attachment = Instance.new("Attachment")

	Attachment.Position = Vector3.new(0, 0, 0)
	Attachment.Parent = BULLET_RAYS

	local Attachment2 = Instance.new("Attachment")
	local v12 = -(v9 - v6).magnitude

	Attachment2.Position = Vector3.new(0, 0, v12)
	Attachment2.Parent = BULLET_RAYS

	local v13 = false
	local v14 = nil
	local NewGunBeam

	if Handle then
		local v15 = Handle.Parent and Handle.Parent.Name

		if v15 and not v4 and (v2 and v2 ~= "" or SkinAssets.GunSkinMuzzleParticle:FindFirstChild(v15)) then
			v2 = v2 ~= "" and v2 or v15

			local v19 = if IsLeftHand then "LeftMuzzle" else "Muzzle"

			if SkinAssets.GunSkinMuzzleParticle:FindFirstChild(v2) then
				if not isReflecting and (SkinAssets.GunSkinMuzzleParticle[v2]:FindFirstChild(v19) or IsLeftHand) then
					local v20 = Handle.Parent:FindFirstChild("Default") and Handle.Parent.Default:FindFirstChild("Mesh") and Handle.Parent.Default.Mesh:FindFirstChild(v19) or Handle:FindFirstChild(v19)
					local v21

					if IsLeftHand then
						local v22 = Handle.Parent:FindFirstChild("Default") and Handle.Parent.Default:FindFirstChild("Mesh") and Handle.Parent.Default.Mesh.DualWieldLeftHandMesh:FindFirstChild(v19) or v20

						v21 = if v22 == v20 then false else true

						if v21 then
							v20 = v22
						end
					else
						v21 = false
					end

					if v20 then
						for v24, v25 in (if v21 then v20 elseif SkinAssets.GunSkinMuzzleParticle[v2].Muzzle:FindFirstChild("Different_GunMuzzle") then SkinAssets.GunSkinMuzzleParticle[v2][v19].Different_GunMuzzle[v15] else SkinAssets.GunSkinMuzzleParticle[v2][v19]):GetChildren() do
							local v26 = v25:GetAttribute("EmitCount") or 1
							local v27 = IsLeftHand and v25 or v25:Clone()

							v27.Parent = v20
							v27:Emit(v26)

							if not v21 then
								task.delay(v27.Lifetime.Max, function()
									v27:Destroy()
								end)
							end
						end
					end
				elseif not isReflecting then
					local v28 = SkinAssets.GunSkinMuzzleParticle[v2]:GetChildren()
					local v29 = v28[math.random(#v28)]:Clone()

					v29.Parent = Attachment
					v29:Emit(v29.Rate)
				end

				v13 = true
			end

			if SkinAssets.GunBeam:FindFirstChild(v2) then
				local v30 = SkinAssets.GunBeam[v2]
				local v31 = if IsLeftHand then "LeftGunBeam" else "GunBeam"
				local v32 = v30:FindFirstChild(v31) or v30.GunBeam
				local _2 = IsLeftHand and (v32:IsA("BasePart") and v32:FindFirstChild("LeftHandBeam"))

				if v32:IsA("BasePart") then
					local t5 = {
						Parent = nil,
						Attachment0 = nil,
						Attachment1 = nil
					}
					local Different_GunBeam = v32:FindFirstChild("Different_GunBeam")

					if Different_GunBeam and Different_GunBeam:FindFirstChild(v15) then
						local v33 = Different_GunBeam[v15][v31]

						if v33 and v33:IsA("BasePart") then
							v14 = v33:Clone()
							NewGunBeam = t5
						else
							NewGunBeam = v33 and v33:Clone() or t5
						end
					else
						v14 = v32:Clone()
						NewGunBeam = t5
					end
				else
					NewGunBeam = v32:Clone()
				end
			else
				local v36 = game.ReplicatedStorage.GunBeam:Clone()

				NewGunBeam = v36
				v36.Color = BeamColor and ColorSequence.new(BeamColor) or v36.Color
			end
		else
			local v16, v17

			v16 = game.ReplicatedStorage.GunBeam:Clone()
			v17 = BeamColor and ColorSequence.new(BeamColor) or v16.Color
			NewGunBeam = v16
			v16.Color = v17
		end
	else
		NewGunBeam = nil
	end

	task.spawn(function()
		if v14 then
			local magnitude = (v9 - v6).magnitude
			local v1 = magnitude / 725

			v14.Anchored = true
			v14.CanCollide = false
			v14.CanQuery = false
			v14.CFrame = CFrame.new(v6, v9)

			local v22 = v14.CFrame * CFrame.new(0, 0, -magnitude)

			v14.Parent = workspace.Ignored.Siren.Radius
			task.delay(v1 + 5, function()
				v14:Destroy()
				v14 = nil
			end)

			if v14:GetAttribute("SpecialEffects") then
				for k, v in pairs(v14:GetDescendants()) do
					if v:IsA("Trail") and v:GetAttribute("ColorRandom") then
						v.Color = ColorSequence.new(evalColorSequence(v:GetAttribute("ColorRandom"), math.random()))
					end
				end
			end

			local v42 = game:GetService("TweenService"):Create(v14, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
				CFrame = v14.CFrame * CFrame.new(0, 0, -0.1)
			})

			v42:Play()
			task.wait(0.05)

			if v42.PlaybackState ~= Enum.PlaybackState.Completed then
				v42:Pause()
			end

			local v5 = nil

			if _G.Reduce_Lag and not v14:GetAttribute("NoSlow") or v14:GetAttribute("LOWGFX") then
				v14.CFrame = v22
			else
				local v62 = game:GetService("TweenService"):Create(v14, TweenInfo.new(v1, Enum.EasingStyle.Linear), {
					CFrame = v22
				})

				v62:Play()
				task.wait(v1)
				v5 = v62
			end

			if v14:FindFirstChild("Impact") and (v8 and (v10 and not v8.Parent:FindFirstChild("Humanoid"))) then
				if v5 and v5.PlaybackState ~= Enum.PlaybackState.Completed then
					task.wait(0.05)
				end

				if not v14:FindFirstChild("NoNormal") then
					v14.CFrame = CFrame.new(v9, v9 - v10)
				end

				for k, v in pairs(v14.Impact:GetChildren()) do
					if v:IsA("ParticleEmitter") then
						v:Emit(v:GetAttribute("EmitCount") or 1)
					end
				end
			else
				for k, v in pairs(v14:GetChildren()) do
					if v:IsA("BasePart") then
						v.Transparency = 1
					end
				end
			end

			if v14 then
				for k, v in pairs(v14:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v.Enabled = false
					end
				end
			end
		elseif v8 and (v8:IsDescendantOf(workspace.MAP) and (not v4 and (v2 and (SkinAssets.GunBeam:FindFirstChild(v2) and SkinAssets.GunBeam[v2]:FindFirstChild("Impact"))))) then
			local v7 = SkinAssets.GunBeam[v2].Impact:Clone()

			v7.Parent = workspace.Ignored
			v7:PivotTo(CFrame.new(v9, v9 + v10 * 5) * CFrame.Angles(-1.5707963267948966, 0, 0))

			for k, v in pairs(v7:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount") or 1)
				end
			end

			task.delay(1.5, function()
				v7:Destroy()
				v7 = nil
			end)
		end

		local PointLight = Instance.new("PointLight")

		PointLight.Brightness = 0.5
		PointLight.Range = 15
		PointLight.Shadows = true
		PointLight.Color = Color3.new(255 / 255, 255 / 255, 255 / 255)
		PointLight.Parent = BULLET_RAYS

		local ShootBBGUI = Handle:FindFirstChild("ShootBBGUI")

		if not ShootBBGUI or v13 then
			return
		end

		local Shoot = ShootBBGUI:FindFirstChild("Shoot")

		if not Shoot then
			return
		end

		Shoot.Size = UDim2.new(0, 0, 0, 0)
		Shoot.ImageTransparency = 1
		Shoot.Visible = true
		TweenService:Create(Shoot, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.In, 0, false, 0), {
			ImageTransparency = 0.4,
			Size = UDim2.new(1, 0, 1, 0)
		}):Play()
		TweenService:Create(PointLight, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.In, 0, false, 0), {
			Range = 0
		}):Play()
		wait(0.4)
		BULLET_RAYS:Destroy()
		TweenService:Create(Shoot, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.In, 0, false, 0), {
			ImageTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}):Play()
		wait(0.2)
		Shoot.Visible = false
	end)
	NewGunBeam.Attachment0 = Attachment
	NewGunBeam.Attachment1 = Attachment2
	NewGunBeam.Name = "NewGunBeam"
	NewGunBeam.Parent = BULLET_RAYS

	if Shooter == LocalPlayer.Character and workspace:GetServerTimeNow() - v7 > 0.95 then
		playerShot(Handle)
	end

	if not t4[Handle] then
		local v39 = v2 or "None"

		task.spawn(GunSoundPlay.SoundPlay, Handle, t2[v39] ~= "All" and not (t2[v39] and t2[v39][Handle.Parent.Name]), v4)
		t4[Handle] = true
		task.delay(0.021, function()
			t4[Handle] = nil
		end)
	end

	task.spawn(function()
		if not Handle:GetAttribute("DualWield") or IsLeftHand then
			return
		end

		t3.shoot({
			IsLeftHand = true,
			Shooter = Shooter,
			Handle = Handle,
			ForcedOrigin = Handle.Parent.Default.Mesh.DualWieldLeftHandMesh.LeftMuzzle.WorldPosition,
			AimPosition = v9,
			BeamColor = BeamColor,
			Hit = Hit,
			Range = v1
		})
	end)

	return v9, v8, v10
end

return t3
]=]

local function TryLoadEmulatedGunHandler()
	if EmulatedGunHandlerAttempted then
		return EmulatedGunHandler;
	end;
	EmulatedGunHandlerAttempted = true;

	if type(loadstring) ~= 'function' then
		return nil;
	end;

	if type(GunhandlerSource) ~= 'string' or GunhandlerSource == '' then
		return nil;
	end;

	local chunk, compileErr = loadstring(GunhandlerSource, '@embedded dumped gunhandler.lua');
	if not chunk then
		warn('cider error: gunhandler emulation failed;', compileErr);
		return nil;
	end;

	local fakeScript = {
		CanShoot = function()
			return CanShoot;
		end,
	};

	local fakeEnv = setmetatable({
		script = fakeScript,
		require = function(target)
			if target == fakeScript.CanShoot then
				return CanShoot;
			end;
			return require(target);
		end,
	}, {
		__index = function(_, key)
			return getfenv()[key];
		end,
		__newindex = function(_, key, value)
			getfenv()[key] = value;
		end,
	});

	setfenv(chunk, fakeEnv);

	local okExec, result = pcall(chunk);
	if not okExec or type(result) ~= 'table' or type(result.shoot) ~= 'function' or type(result.getAim) ~= 'function' then
		warn('cider error: gunhandler emulation failed;', result);
		return nil;
	end;

	EmulatedGunHandler = result;
	shared.__cider_emulated_gunhandler = true;
	return EmulatedGunHandler;
end;

do
	local hookFn = hookfunction or (getgenv and getgenv().hookfunction);
	if hookFn and not shared.__cider_require_gunhandler_hooked then
		local oldRequire;
		oldRequire = hookFn(require, function(target)
			local ModulesFolder = ReplicatedStorage:FindFirstChild('Modules');
			local GunHandlerModule = ModulesFolder and ModulesFolder:FindFirstChild('GunHandler');
			if GunHandlerModule and target == GunHandlerModule then
				local Emu = TryLoadEmulatedGunHandler();
				if Emu then
					shared.__cider_require_gunhandler_source = 'emulated';
					return Emu;
				end;
			end;
			return oldRequire(target);
		end);
		shared.__cider_require_gunhandler_hooked = true;
	end;
end;

AutoWeapons = {
	['[SMG]'] = true,
	['[Rifle]'] = true,
	['[Shotgun]'] = true, 
	['[AK47]'] = true,
	['[AR]'] = true,
	['[Drum-Shotgun]'] = true,
	['[DrumGun]'] = true,
	['[LMG]'] = true,
	['[P90]'] = true,
	['[SilencerAR]'] = true,
};

BurstWeapons = {
	['[AUG]'] = true,
};

ShootRayParams = RaycastParamsNew();
ShootRayParams.FilterType = EnumExclude;
ShootRayParams.IgnoreWater = true;

CanShootCheck = function(Character, IsAutoShoot)
	if not Character then return false end;
	local Humanoid = Character:FindFirstChild('Humanoid');
	if not Humanoid or Humanoid.Health <= 0 or Humanoid:GetState() == EnumDead then return false end;
	local BodyEffects = Character:FindFirstChild('BodyEffects');
	if not BodyEffects then return false end;
	local Tool = Character:FindFirstChildOfClass('Tool');
	if not Tool or not Tool:FindFirstChild('Handle') or not Tool:FindFirstChild('Ammo') then return false end;
	if Tool.Ammo.Value <= 0 then return false end;
	if Character:FindFirstChild('FULLY_LOADED_CHAR') == nil then return false end;
	if Character:FindFirstChild('FORCEFIELD') then return false end;
	if Character:FindFirstChild('GRABBING_CONSTRAINT') then return false end;
	if Character:FindFirstChild('Christmas_Sock') then return false end;
	if BodyEffects:FindFirstChild('Cuff') and BodyEffects.Cuff.Value then return false end;
	if BodyEffects:FindFirstChild('Attacking') and BodyEffects.Attacking.Value then return false end;
	if BodyEffects:FindFirstChild('K.O') and BodyEffects['K.O'].Value then return false end;
	if BodyEffects:FindFirstChild('Grabbed') and BodyEffects.Grabbed.Value then return false end;
	if BodyEffects:FindFirstChild('Reload') and BodyEffects.Reload.Value then return false end;
	if BodyEffects:FindFirstChild('Dead') and BodyEffects.Dead.Value then return false end;
	if BodyEffects:FindFirstChild('Block') then return false end;
	if not IsAutoShoot and Tool:GetAttribute('Cooldown') then return false end;
	local LastShot = Character:GetAttribute('LastGunShot');
	local IsShotgun = Tool.Name == '[Shotgun]' or Tool.Name == '[Double-Barrel SG]' or Tool.Name == 'TacticalShotgun' or Tool.Name == 'Drum-Shotgun';
	if LastShot ~= Tool.Name and Character:GetAttribute('ShotgunDebounce') then return false end;
	return true;
end;

CanShoot = function(Character)
	if not CanShootCheck(Character) then return false end;
	local Tool = Character:FindFirstChildOfClass('Tool');
	local IsShotgun = Tool.Name == '[Shotgun]' or Tool.Name == '[Double-Barrel SG]' or Tool.Name == 'TacticalShotgun' or Tool.Name == 'Drum-Shotgun';
	if IsShotgun and not Character:GetAttribute('ShotgunDebounce') then
		Character:SetAttribute('ShotgunDebounce', true);
		task.delay(0.65, function()
			Character:SetAttribute('ShotgunDebounce', nil);
		end);
	end;
	Character:SetAttribute('LastGunShot', Tool.Name);
	return true;
end;

GetMuzzlePosition = function(Tool)
	local Handle = Tool:FindFirstChild('Handle');
	if not Handle then return nil end;
	local Offset = MuzzleOffsets[Tool.Name] or CFrameNew(0, 0.4, 1.8);
	local FallbackPos = (Handle.CFrame * Offset).Position;
	local Default = Tool:FindFirstChild('Default');
	if Default then
		local Mesh = Default:FindFirstChild('Mesh');
		if Mesh then
			local Muzzle = Mesh:FindFirstChild('Muzzle');
			if Muzzle then return Muzzle.WorldPosition end;
		end;
	end;

	local HandleMuzzle = Handle:FindFirstChild('Muzzle');
	if HandleMuzzle then return HandleMuzzle.WorldPosition end;

	return FallbackPos;
end;

local GetCursorViewportPosition = function()
	local TopLeftInset = GuiService:GetGuiInset();
	return UserInputService:GetMouseLocation() - TopLeftInset;
end;

GetClosestPointOnPart = function(Part, Scale, MousePos)
	local CurrentCamera = Workspace.CurrentCamera;
	MousePos = MousePos or GetCursorViewportPosition();
	local Ray = CurrentCamera:ViewportPointToRay(MousePos.X, MousePos.Y);
	local DirectionLengthSquared = Ray.Direction:Dot(Ray.Direction);
	local RayDistance = DirectionLengthSquared > 0 and Ray.Direction:Dot(Part.Position - Ray.Origin) / DirectionLengthSquared or 0;
	local Intersection = Ray.Origin + Ray.Direction * MathMax(RayDistance, 0);
	local LocalPos = Part.CFrame:PointToObjectSpace(Intersection);
	local Half = (Part.Size * (Scale or 1)) / 2;
	return Part.CFrame * Vector3New(
		MathClamp(LocalPos.X, -Half.X, Half.X),
		MathClamp(LocalPos.Y, -Half.Y, Half.Y),
		MathClamp(LocalPos.Z, -Half.Z, Half.Z)
	);
end;

GetClosestPartToCursor = function(Character, UseClosestPoint, PointScale)
	local CurrentCamera = Workspace.CurrentCamera;
	local MousePosition = GetCursorViewportPosition();
	local Closest = nil;
	local ClosestPosition = nil;
	local BestDist = MathHuge;
	for _, Part in next, Character:GetChildren() do
		if not Part:IsA('BasePart') then continue end;
		local WorldPosition = UseClosestPoint and GetClosestPointOnPart(Part, PointScale, MousePosition) or Part.Position;
		local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(WorldPosition);
		if not OnScreen or ScreenPos.Z <= 0 then continue end;
		local Dist = (MousePosition - Vector2New(ScreenPos.X, ScreenPos.Y)).Magnitude;
		if Dist < BestDist then
			BestDist = Dist;
			Closest = Part;
			ClosestPosition = WorldPosition;
		end;
	end;
	return Closest, ClosestPosition;
end;

local ResolveHitPosition = function(TargetChar, FeatureCfg)
	local HitPartCfg = FeatureCfg['Target Part'];
	local PartName = (type(HitPartCfg) == 'table' and HitPartCfg['Part']) or HitPartCfg or 'HumanoidRootPart';
	local ClosestPointCfg = (type(HitPartCfg) == 'table' and HitPartCfg['Closest Point']) or FeatureCfg['Closest Point'];
	local ClosestPoint = type(ClosestPointCfg) == 'table' and ClosestPointCfg['Enabled'] == true;
	local PointScale = nil;
	local NormalizedPartName = string.lower(tostring(PartName));

	if type(ClosestPointCfg) == 'table' and string.lower(tostring(ClosestPointCfg['Mode'])) == 'scaled' then
		PointScale = 1 - (MathClamp(ClosestPointCfg['Scale'] or 0, 0, 100) / 100);
	end;

	if NormalizedPartName == 'closest point' then
		ClosestPoint = true;
		PartName = 'Head';
	elseif NormalizedPartName == 'closest part' then
		ClosestPoint = false;
		PartName = 'Closest';
	end;

	local Part;
	local Pos;
	if PartName == 'Closest' then
		Part, Pos = GetClosestPartToCursor(TargetChar, ClosestPoint, PointScale);
	else
		Part = TargetChar:FindFirstChild(PartName);
	end;

	if Part then
		Pos = Pos or (ClosestPoint and GetClosestPointOnPart(Part, PointScale) or Part.Position);
		return Pos, Part;
	end;

	local Fallback = TargetChar:FindFirstChild('HumanoidRootPart');
	if Fallback then
		local Pos = ClosestPoint and GetClosestPointOnPart(Fallback, PointScale) or Fallback.Position;
		return Pos, Fallback;
	end;
	return nil, nil;
end;

local IsInside3DFOV = nil;

local GetAimPosition = function(MuzzlePos, Range)
	local SilentCfg = GetConfig()['Silent Aim'];
	if SilentCfg['Enabled'] and State.Targets.Silent and PassesConditions(State.Targets.Silent, 'Silent Aim') then
		local Target = State.Targets.Silent;
		local TargetChar = Target.Character;
		if TargetChar then
			local HumanoidRootPart = TargetChar:FindFirstChild('HumanoidRootPart');
			if HumanoidRootPart then
				local CurrentCamera = Workspace.CurrentCamera;
				local MaxRange = SilentCfg['Max Range'];
				if MaxRange and MaxRange < MathHuge then
					local WorldDist = (CurrentCamera.CFrame.Position - HumanoidRootPart.Position).Magnitude;
					if WorldDist > MaxRange then return Mouse.Hit.Position end;
				end;
				local OffscreenCfg = SilentCfg['Offscreen Targeting'];
				local AllowOffscreen = OffscreenCfg and OffscreenCfg['Enabled'];
				local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position);
				local IsUsable = AllowOffscreen or (OnScreen and ScreenPos.Z > 1);
				if IsInside3DFOV and not IsInside3DFOV(HumanoidRootPart.Position, 'Silent Aim') then
					IsUsable = false;
				end;
				if IsUsable then
					local PassFOV = AllowOffscreen;
					if not AllowOffscreen then
						local SilentFOVCfg = GetConfig()['Main']['FOV']['Silent'];
						if string.lower(tostring(SilentFOVCfg['Options'] or '2D')) == '3d' then
							PassFOV = true;
						elseif not SilentFOVCfg['Visualize']['Enabled'] then
							PassFOV = true;
						else
							local MousePosition = UserInputService:GetMouseLocation();
							local ViewportY = CurrentCamera.ViewportSize.Y;
							local CamFOV = CurrentCamera.FieldOfView;
							local ScaleFactor = (HumanoidRootPart.Size.Y * ViewportY) / (ScreenPos.Z * 2) * 80 / CamFOV;
							local W = (SilentFOVCfg['Width'] and (SilentFOVCfg['Width'][1] or 150) or 150) * ScaleFactor;
							local H = (SilentFOVCfg['Height'] and (SilentFOVCfg['Height'][1] or 150) or 150) * ScaleFactor;
							local Delta = Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition;
							PassFOV = MathAbs(Delta.X) <= W / 2 and MathAbs(Delta.Y) <= H / 2;
						end;
					end;

					if PassFOV then
						local TargetPos, _ = ResolveHitPosition(TargetChar, SilentCfg);
						if not TargetPos then TargetPos = HumanoidRootPart.Position end;

						local CharacterTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Tool');
						local FutureCfg = SilentCfg['Future'];
						if FutureCfg and FutureCfg['Enabled'] ~= false then
							TargetPos = ApplyFuture(TargetPos, Target, CharacterTool and CharacterTool.Name, FutureCfg);
						else
							TargetPos = ApplyPrediction(TargetPos, Target, SilentCfg);
						end;
						return TargetPos;
					end;
				end;
			end;
		end;
	end;
	return Mouse.Hit.Position;
end;

local DefaultBeamColor = Color3.new(1, 0.545098, 0.14902);

local SoundsPlaying = {};
local IsAimed = false;

ScopedWeapons = {
	'[Shotgun]', '[Drum-Shotgun]', '[Rifle]', '[TacticalShotgun]',
	'[AR]', '[AUG]', '[AK47]', '[LMG]', '[SilencerAR]',
};

CustomBulletHoleRotations = {
	['SoulII'] = Vector3New(-90, 0, 0),
	['Sushi'] = 'Position',
	['XMAS'] = Vector3New(180, 0, 0),
	['Gift'] = Vector3New(180, 0, 0),
	['Jellyfish'] = Vector3New(180, 0, 0),
	['Halloween23'] = Vector3New(180, 0, 0),
	['Wild West'] = Vector3New(180, 0, 0),
	['Cat'] = Vector3New(180, 0, 0),
	['Ninja'] = Vector3New(180, 0, 0),
	['Void'] = Vector3New(180, 0, 0),
	['Ice'] = Vector3New(180, 0, 0),
	['Beary'] = { CFrameNew(0, 0, -0.45), Vector3New(180, 0, 0) },
	['XMAS24'] = Vector3New(-90, 0, 0),
	['Heartbreak'] = 'Position',
	['Blaze'] = 'Position',
	['Short Cake'] = 'Position',
	['Shrimp'] = Vector3New(-90, 0, 0),
	['Arcane'] = Vector3New(-90, 0, 0),
	['PrestigeCandyCane'] = 'Position',
	['Duck'] = 'Position',
	['Flower'] = Vector3New(180, 0, 0),
	['Car'] = Vector3New(180, 0, 0),
	['Music'] = Vector3New(180, 0, 0),
	['Brainrot'] = { CFrameNew(0, 0, -0.25), Vector3New(0, 0, 0) },
};

UndeadBeamColors = {
	Color3.fromRGB(248, 147, 255),
	Color3.fromRGB(255, 160, 64),
	Color3.fromRGB(76, 255, 82),
	Color3.fromRGB(110, 149, 255),
};

function DoMuzzleEmit(MuzzleSource, ShooterCharacter)
	Spawn(function()
		Xpcall(function()
			if not ShooterCharacter then return end;
			local Tool = ShooterCharacter:FindFirstChildOfClass('Tool');
			if not Tool then return end;
			local ToolHandle = Tool:FindFirstChild('Handle');
			if not ToolHandle then return end;
			local MuzzleAtt = (Tool:FindFirstChild('Default') and Tool.Default:FindFirstChild('Mesh') and Tool.Default.Mesh:FindFirstChild('Muzzle')) or ToolHandle:FindFirstChild('Muzzle');
			if not MuzzleAtt then return end;
			if ToolHandle:GetAttribute('Emitted') then return end;
			ToolHandle:SetAttribute('Emitted', true);
			Delay(0.05, function()
				if ToolHandle then ToolHandle:SetAttribute('Emitted', nil) end;
			end);
			for _, Emitter in next, MuzzleSource:GetChildren() do
				if Emitter:IsA('ParticleEmitter') then
					local Clone = Emitter:Clone();
					Clone.Parent = MuzzleAtt;
					Clone.Enabled = true;
					Clone:Emit(Clone:GetAttribute('EmitCount') or 1);
					Clone.Enabled = false;
					game.Debris:AddItem(Clone, 2);
				end;
			end;
		end, ErrHandler);
	end);
end;

CachedGunBeam = ReplicatedStorage:FindFirstChild('GunBeam');
CachedAnimChar = nil;
CachedShootAnim = nil;
CachedAimShootAnim = nil;

function Animate(Gun)
	if not Gun then return end;
	local Character = LocalPlayer.Character;
	if not Character or not Character:FindFirstChild('Humanoid') or not Character.Humanoid:FindFirstChild('Animator') then return end;
	if not CachedAnimations then CachedAnimations = ReplicatedStorage:FindFirstChild('Animations') or ReplicatedStorage:FindFirstChild('ClientAnimations') end;
	if not CachedAnimations then return end;
	local GunCombat = CachedAnimations:FindFirstChild('GunCombat');
	if not GunCombat then return end;
	local Animator = Character.Humanoid.Animator;
	if CachedAnimChar ~= Character then
		CachedAnimChar = Character;
		CachedShootAnim = Animator:LoadAnimation(GunCombat.Shoot);
		CachedAimShootAnim = Animator:LoadAnimation(GunCombat.AimShoot);
	end;
	if CachedShootAnim then CachedShootAnim:Stop(0) end;
	if CachedAimShootAnim then CachedAimShootAnim:Stop(0) end;
	if IsAimed or table.find(ScopedWeapons, Gun.Name) then
		CachedAimShootAnim:Play();
	else
		CachedShootAnim:Play();
	end;
end;

ShowPellet = function(Shooter, Handle, ForcedOrigin, AimPosition, Range, BeamColor, SkipVisual)
	BeamColor = BeamColor or DefaultBeamColor;
	local Direction = (AimPosition - ForcedOrigin).Unit;

	ShootRayParams.FilterDescendantsInstances = BuildFilter(ShootFilter, Shooter);

	local RayResult = Workspace:Raycast(ForcedOrigin, Direction * Range, ShootRayParams);
	local HitPosition = RayResult and RayResult.Position or (ForcedOrigin + Direction * Range);
	local HitNormal = RayResult and RayResult.Normal or nil;
	local HitInstance = RayResult and RayResult.Instance or nil;

	if SkipVisual then
		return HitPosition, HitInstance, HitNormal;
	end;

	local ToolName = Handle and Handle.Parent and Handle.Parent.Name or '';
	local SkinName = nil;
	Pcall(function()
		SkinName = Handle:GetAttribute('SkinName');
	end);
	if not SkinName or SkinName == '' then
		Pcall(function()
			local Decoded = HttpService:JSONDecode(LocalPlayer.DataFolder.Information.EquipSkins.Value);
			SkinName = Decoded and Decoded[ToolName] or nil;
		end);
	end;
	if not SkinName or SkinName == '' then
		SkinName = 'Default';
	end;

	local SkinAssets = CachedSkinAssets;
	local BulletPart = Instance.new('Part');
	BulletPart.Name = 'BULLET_RAYS';
	BulletPart.Anchored = true;
	BulletPart.CanCollide = false;
	BulletPart.CanTouch = false;
	BulletPart.CanQuery = false;
	BulletPart.Size = Vector3New(0, 0, 0);
	BulletPart.Transparency = 1;
	BulletPart.CFrame = CFrameNew(ForcedOrigin, HitPosition);
	BulletPart.Parent = (CachedIgnored and CachedIgnored:FindFirstChild('Siren') and CachedIgnored.Siren:FindFirstChild('Radius') and CachedIgnored.Siren.Radius) or CachedIgnored or Workspace;

	local GunBeamTemplate = CachedGunBeam;
	local LeftBeamTemplate = nil;
	local ImpactTemplate = nil;
	local IsDefaultBeam = false;

	if SkinAssets and SkinAssets:FindFirstChild('GunBeam') and SkinAssets.GunBeam:FindFirstChild(SkinName) then
		local SkinBeamFolder = SkinAssets.GunBeam[SkinName];
		if SkinBeamFolder:FindFirstChildOfClass('Beam') then
			if SkinBeamFolder:FindFirstChild('GunBeam') and SkinBeamFolder:FindFirstChild('LeftGunBeam') then
				GunBeamTemplate = SkinBeamFolder:FindFirstChild('GunBeam');
				LeftBeamTemplate = SkinBeamFolder:FindFirstChild('LeftGunBeam');
			else
				GunBeamTemplate = SkinBeamFolder:FindFirstChildOfClass('Beam');
			end;
			if SkinBeamFolder:FindFirstChild('Impact') then
				ImpactTemplate = SkinBeamFolder.Impact;
			end;
		elseif SkinBeamFolder:FindFirstChildWhichIsA('BasePart') then
			local PartBeam = SkinBeamFolder:FindFirstChildWhichIsA('BasePart');
			if PartBeam:FindFirstChild('Different_GunBeam') then
				local DiffFolder = PartBeam.Different_GunBeam;
				if DiffFolder:FindFirstChild(ToolName) then
					local WeaponBeam = DiffFolder[ToolName];
					if WeaponBeam:FindFirstChildWhichIsA('BasePart') then
						GunBeamTemplate = WeaponBeam:FindFirstChildWhichIsA('BasePart');
						if GunBeamTemplate:FindFirstChild('Impact') then
							ImpactTemplate = GunBeamTemplate.Impact;
						end;
					elseif WeaponBeam:FindFirstChildOfClass('Beam') then
						GunBeamTemplate = WeaponBeam:FindFirstChildOfClass('Beam');
						if WeaponBeam:FindFirstChild('Impact') then
							ImpactTemplate = WeaponBeam.Impact;
						end;
					else
						GunBeamTemplate = CachedGunBeam;
						IsDefaultBeam = true;
					end;
				end;
			else
				GunBeamTemplate = PartBeam;
				if PartBeam:FindFirstChild('Impact') then
					ImpactTemplate = PartBeam.Impact;
				end;
			end;
		else
			GunBeamTemplate = CachedGunBeam;
			IsDefaultBeam = true;
		end;
	else
		if not GunBeamTemplate and SkinAssets then
			local GunBeamFolder = SkinAssets:FindFirstChild('GunBeam');
			if GunBeamFolder then
				local DefaultFolder = GunBeamFolder:FindFirstChild('Default');
				if DefaultFolder then
					local BeamObj = DefaultFolder:FindFirstChildOfClass('Beam');
					if BeamObj then GunBeamTemplate = BeamObj end;
				end;
			end;
		end;
		IsDefaultBeam = true;
	end;

	local ClonedBeam = GunBeamTemplate and GunBeamTemplate:Clone() or nil;
	local BeamDistance = (HitPosition - ForcedOrigin).Magnitude;
	local TravelTime = BeamDistance / 725;
	if not ClonedBeam then
		game.Debris:AddItem(BulletPart, 0.5);
	elseif ClonedBeam:IsA('Beam') then
		game.Debris:AddItem(BulletPart, 0.5);
	else
		game.Debris:AddItem(BulletPart, TravelTime + 5);
	end;

	if ClonedBeam then
		local StartAttachment = Instance.new('Attachment');
		StartAttachment.Position = Vector3New(0, 0, 0);
		StartAttachment.Parent = BulletPart;
		local EndAttachment = Instance.new('Attachment');
		EndAttachment.Position = Vector3New(0, 0, -BeamDistance);
		EndAttachment.Parent = BulletPart;

		if ClonedBeam:IsA('Beam') then
			if IsDefaultBeam and BeamColor then
				ClonedBeam.Color = ColorSequence.new(BeamColor);
			end;
			ClonedBeam.Attachment0 = StartAttachment;
			ClonedBeam.Attachment1 = EndAttachment;
			ClonedBeam.Parent = BulletPart;
		elseif ClonedBeam:IsA('BasePart') then
			ClonedBeam.Anchored = true;
			ClonedBeam.CanCollide = false;
			ClonedBeam.CanQuery = false;
			ClonedBeam.CFrame = CFrameNew(ForcedOrigin, HitPosition);
			local BeamEndCFrame = ClonedBeam.CFrame * CFrameNew(0, 0, -BeamDistance);
			ClonedBeam.Parent = BulletPart.Parent;
			if ClonedBeam:GetAttribute('SpecialEffects') then
				for _, BeamDescendant in next, ClonedBeam:GetDescendants() do
					if BeamDescendant:IsA('Trail') and BeamDescendant:GetAttribute('ColorRandom') then
						local RandomColorSeq = BeamDescendant:GetAttribute('ColorRandom');
						BeamDescendant.Color = ColorSequence.new(Color3.new(RandomColorSeq.X, RandomColorSeq.Y, RandomColorSeq.Z):Lerp(Color3.new(1, 1, 1), MathRandom()));
					end;
				end;
			end;
			if SkinName == 'Undead' and ToolName == '[Revolver]' then
				local RandColor = UndeadBeamColors[MathRandom(1, #UndeadBeamColors)];
				local Trail = ClonedBeam:FindFirstChildOfClass('Trail');
				if Trail then
					Trail.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, RandColor), ColorSequenceKeypoint.new(1, RandColor) });
				end;
			end;
			Spawn(function()
				local InitialTween = TweenService:Create(ClonedBeam, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
					['CFrame'] = ClonedBeam.CFrame * CFrameNew(0, 0, -0.1),
				});
				InitialTween:Play();
				Wait(0.05);
				if InitialTween.PlaybackState ~= Enum.PlaybackState.Completed then
					InitialTween:Pause();
				end;
				local TravelTween = TweenService:Create(ClonedBeam, TweenInfo.new(TravelTime, Enum.EasingStyle.Linear), {
					['CFrame'] = BeamEndCFrame,
				});
				TravelTween:Play();
				Wait(TravelTime);
				if ClonedBeam:FindFirstChild('Impact') and (HitInstance and HitNormal and not HitInstance.Parent:FindFirstChild('Humanoid')) then
					if TravelTween.PlaybackState ~= Enum.PlaybackState.Completed then
						Wait(0.05);
					end;
					if not ClonedBeam:FindFirstChild('NoNormal') then
						ClonedBeam.CFrame = CFrameNew(HitPosition, HitPosition - HitNormal);
					end;
					for _, ImpactChild in next, ClonedBeam.Impact:GetChildren() do
						if ImpactChild:IsA('ParticleEmitter') then
							ImpactChild:Emit(ImpactChild:GetAttribute('EmitCount') or 1);
						end;
					end;
				else
					for _, BeamChild in next, ClonedBeam:GetChildren() do
						if BeamChild:IsA('BasePart') then
							BeamChild.Transparency = 1;
						end;
					end;
				end;
				if ClonedBeam then
					for _, Desc in next, ClonedBeam:GetDescendants() do
						if Desc:IsA('ParticleEmitter') then Desc.Enabled = false end;
					end;
				end;
			end);
		end;

		if LeftBeamTemplate then
			local SecondaryMesh = nil;
			local ToolModel = Handle and Handle.Parent;
			if ToolModel then
				local Default = ToolModel:FindFirstChild('Default');
				if Default then
					local Mesh = Default:FindFirstChild('Mesh');
					if Mesh then
						for _, Child in next, Mesh:GetChildren() do
							if Child:IsA('BasePart') and Child:GetAttribute('SecondaryMesh') then
								SecondaryMesh = Child;
							end;
						end;
					end;
				end;
			end;
			if SecondaryMesh then
				local LeftMuzzle = SecondaryMesh:FindFirstChild('LeftMuzzle') or SecondaryMesh:FindFirstChildOfClass('Attachment');
				if LeftMuzzle then
					local LeftMuzzlePos = LeftMuzzle.WorldPosition;
					local LeftBeamDist = (HitPosition - LeftMuzzlePos).Magnitude;
					local LeftTravelTime = LeftBeamDist / 725;
					local LeftPart = Instance.new('Part');
					LeftPart.Name = 'BULLET_RAYS';
					LeftPart.Size = Vector3New(0, 0, 0);
					LeftPart.Transparency = 1;
					LeftPart.CanCollide = false;
					LeftPart.CanTouch = false;
					LeftPart.CanQuery = false;
					LeftPart.Anchored = true;
					LeftPart.CFrame = CFrameNew(LeftMuzzlePos, HitPosition);
					LeftPart.Parent = BulletPart.Parent;
					local LeftClone = LeftBeamTemplate:Clone();
					if LeftClone:IsA('Beam') then
						local LAtt0 = Instance.new('Attachment');
						LAtt0.Position = Vector3New(0, 0, 0);
						LAtt0.Parent = LeftPart;
						local LAtt1 = Instance.new('Attachment');
						LAtt1.Position = Vector3New(0, 0, -LeftBeamDist);
						LAtt1.Parent = LeftPart;
						if IsDefaultBeam and BeamColor then
							LeftClone.Color = ColorSequence.new(BeamColor);
						end;
						LeftClone.Attachment0 = LAtt0;
						LeftClone.Attachment1 = LAtt1;
						LeftClone.Parent = LeftPart;
						game.Debris:AddItem(LeftPart, 0.5);
					elseif LeftClone:IsA('BasePart') then
						LeftClone.Anchored = true;
						LeftClone.CanCollide = false;
						LeftClone.CanQuery = false;
						LeftClone.CFrame = CFrameNew(LeftMuzzlePos, HitPosition);
						local LeftEndCFrame = LeftClone.CFrame * CFrameNew(0, 0, -LeftBeamDist);
						LeftClone.Parent = LeftPart.Parent;
						game.Debris:AddItem(LeftPart, LeftTravelTime + 5);
						Spawn(function()
							local LTw = TweenService:Create(LeftClone, TweenInfo.new(LeftTravelTime, Enum.EasingStyle.Linear), {
								['CFrame'] = LeftEndCFrame,
							});
							LTw:Play();
							Wait(LeftTravelTime);
							if LeftClone then
								for _, Desc in next, LeftClone:GetDescendants() do
									if Desc:IsA('ParticleEmitter') then Desc.Enabled = false end;
								end;
							end;
						end);
					end;
					Spawn(function()
						for _, Child in next, LeftMuzzle:GetChildren() do
							if Child:IsA('ParticleEmitter') then
								Child:Emit(Child:GetAttribute('EmitCount') or 1);
							end;
						end;
					end);
				end;
			end;
		end;

		Spawn(function()
			if RayResult and ImpactTemplate then
				Xpcall(function()
					if HitInstance and not HitInstance.Parent:FindFirstChildOfClass('Humanoid') then
						local BulletHole = Instance.new('Part');
						Delay(5, function() if BulletHole then BulletHole:Destroy() end end);
						BulletHole.Transparency = 1;
						BulletHole.Name = 'BULLETHOLE';
						BulletHole.Size = Vector3New(0.83, 0.731, 0.001);
						BulletHole.Anchored = true;
						BulletHole.CanCollide = false;
						BulletHole.CanTouch = false;
						BulletHole.CanQuery = false;
						local ImpactClone = ImpactTemplate:Clone();
						ImpactClone.Parent = BulletHole;
						local NormalOffset = HitNormal and (HitNormal * 0.1) or Vector3New(0, 0, 0);
						BulletHole.Position = HitPosition + NormalOffset;
						BulletHole.CFrame = CFrameNew(HitPosition + NormalOffset, HitPosition + (HitNormal or Vector3New(0, 1, 0)));
						local CustomRot = CustomBulletHoleRotations[SkinName];
						if CustomRot then
							if typeof(CustomRot) == 'string' then
								if CustomRot == 'Position' then
									ImpactClone.Position = BulletHole.Position;
								else
									ImpactClone.CFrame = BulletHole.CFrame;
								end;
							elseif typeof(CustomRot) == 'table' then
								ImpactClone.CFrame = ImpactClone.CFrame * CustomRot[1] * CFrame.Angles(MathRad(CustomRot[2].X), MathRad(CustomRot[2].Y), MathRad(CustomRot[2].Z));
							else
								ImpactClone.CFrame = ImpactClone.CFrame * CFrame.Angles(MathRad(CustomRot.X), MathRad(CustomRot.Y), MathRad(CustomRot.Z));
							end;
						elseif ImpactClone:IsA('Part') then
							ImpactClone.CFrame = BulletHole.CFrame;
						end;
						BulletHole.Parent = BulletPart.Parent;
						for _, Desc in next, BulletHole:GetDescendants() do
							if Desc:IsA('ParticleEmitter') then
								Desc:Emit(Desc:GetAttribute('EmitCount') or 1);
							end;
						end;
					end;
				end, ErrHandler);
			end;
		end);
	end;

	local function PlayGunSound(SoundHandle, ShouldClone)
		local ShootSound = SoundHandle:FindFirstChild('ShootSound');
		if not ShootSound then return end;
		if SkinName and SkinName ~= 'Default' and SkinAssets then
			local GunShootSounds = SkinAssets:FindFirstChild('GunShootSounds');
			if GunShootSounds then
				local WeaponFolder = GunShootSounds:FindFirstChild(ToolName);
				if WeaponFolder then
					local SoundValue = WeaponFolder:FindFirstChild(SkinName);
					if SoundValue and SoundValue:IsA('StringValue') and SoundValue.Value ~= '' then
						ShootSound.SoundId = SoundValue.Value;
					end;
				end;
			end;
		end;
		local SeqSFX = ShootSound:GetAttribute('SequenceSFX');
		if SeqSFX then
			if ShootSound:GetAttribute('CurrentSequence') == nil then
				ShootSound:SetAttribute('CurrentSequence', 1);
			else
				ShootSound:SetAttribute('CurrentSequence', ShootSound:GetAttribute('CurrentSequence') + 1);
			end;
			local Seq = ShootSound:GetAttribute('CurrentSequence');
			local Ids = {};
			for Id in string.gmatch(SeqSFX, '%d+') do
				table.insert(Ids, Id);
			end;
			if #Ids > 0 then
				ShootSound.SoundId = 'rbxassetid://' .. Ids[Seq % #Ids + 1];
			end;
		end;
		if ShouldClone then
			local Clone = ShootSound:Clone();
			Clone.Name = '\0';
			Clone.Parent = SoundHandle;
			Clone:Play();
			Clone.Ended:Once(function()
				if Clone and Clone.Parent then Clone:Destroy() end;
			end);
		else
			ShootSound:Play();
		end;
	end;

	local IsShotgunType = ShotgunWeapons[ToolName] or false;
	if IsShotgunType then
		if not Handle:GetAttribute('PlayingSound') then
			Handle:SetAttribute('PlayingSound', true);
			Delay(0.075, function()
				if Handle and Handle.Parent then Handle:SetAttribute('PlayingSound', nil) end;
			end);
			Spawn(function()
				if not SoundsPlaying[Handle] then
					PlayGunSound(Handle, true);
					SoundsPlaying[Handle] = true;
					Delay(0.021, function() SoundsPlaying[Handle] = nil end);
				end;
			end);
		end;
	elseif SkinName == 'Toilet' then
		local ToiletSounds = { 125391056005695, 132466522418892, 129999172684348 };
		local SoundObj = Instance.new('Sound');
		SoundObj.Name = 'ShootSound';
		SoundObj.SoundId = 'rbxassetid://' .. ToiletSounds[MathRandom(1, #ToiletSounds)];
		SoundObj.Parent = Handle;
		SoundObj.Ended:Once(function() SoundObj:Destroy() end);
		SoundObj:Play();
	else
		Spawn(function()
			if not SoundsPlaying[Handle] then
				PlayGunSound(Handle, true);
				SoundsPlaying[Handle] = true;
				Delay(0.021, function() SoundsPlaying[Handle] = nil end);
			end;
		end);
	end;

	local SkinMuzzleUsed = false;
	Spawn(function()
		if not SkinAssets then return end;
		local MuzzleParticles = SkinAssets:FindFirstChild('GunSkinMuzzleParticle');
		if not MuzzleParticles then return end;
		local WeaponMuzzle = MuzzleParticles:FindFirstChild(ToolName);
		if WeaponMuzzle then
			local MuzzleFolder = WeaponMuzzle:FindFirstChild('Muzzle');
			if MuzzleFolder then
				DoMuzzleEmit(MuzzleFolder, Shooter);
			else
				DoMuzzleEmit(WeaponMuzzle, Shooter);
			end;
			SkinMuzzleUsed = true;
		else
			local SkinMuzzle = MuzzleParticles:FindFirstChild(SkinName);
			if SkinMuzzle then
				local MuzzleFolder = SkinMuzzle:FindFirstChild('Muzzle');
				if MuzzleFolder then
					local DiffGunMuzzle = MuzzleFolder:FindFirstChild('Different_GunMuzzle');
					if DiffGunMuzzle and DiffGunMuzzle:FindFirstChild(ToolName) then
						DoMuzzleEmit(DiffGunMuzzle[ToolName], Shooter);
					else
						DoMuzzleEmit(MuzzleFolder, Shooter);
					end;
					SkinMuzzleUsed = true;
				else
					local SingleEmitter = SkinMuzzle:FindFirstChildOfClass('ParticleEmitter');
					if SingleEmitter then
						local MuzzleAtt = nil;
						local ToolModel = Handle.Parent;
						if ToolModel then
							local Default = ToolModel:FindFirstChild('Default');
							if Default then
								local Mesh = Default:FindFirstChild('Mesh');
								if Mesh then MuzzleAtt = Mesh:FindFirstChild('Muzzle') end;
							end;
						end;
						if not MuzzleAtt then MuzzleAtt = Handle:FindFirstChild('Muzzle') end;
						if MuzzleAtt then
							local Clone = SingleEmitter:Clone();
							Clone.Rotation = NumberRange.new(MathRandom(-180, 180));
							Clone.RotSpeed = NumberRange.new(MathRandom(-90, 90));
							Clone.Parent = MuzzleAtt;
							Clone:Emit(1);
							SkinMuzzleUsed = true;
						end;
					end;
				end;
			end;
		end;
	end);

	Xpcall(function()
		local ShootBBGUI = Handle.Parent.Handle:FindFirstChild('ShootBBGUI');
		if ShootBBGUI then
			ShootBBGUI.Enabled = not SkinMuzzleUsed;
		end;
	end, ErrHandler);

	local Light = Instance.new('PointLight');
	Light.Brightness = 0.5;
	Light.Range = 15;
	Light.Shadows = false;
	Light.Color = Color3.new(1, 1, 1);
	Light.Parent = BulletPart;
	local LightTween = TweenService:Create(Light, TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), { Range = 0 });
	LightTween:Play();
	local LightConn;
	LightConn = LightTween.Completed:Connect(function()
		if Light then Light:Destroy() end;
		LightConn:Disconnect();
	end);

	local BodyEffects = Shooter:FindFirstChild('BodyEffects');
	if BodyEffects then
		local Movement = BodyEffects:FindFirstChild('Movement');
		if Movement then
			local ReduceWalk = Instance.new('IntValue');
			ReduceWalk.Name = 'ReduceWalk';
			ReduceWalk.Value = 5;
			ReduceWalk.Parent = Movement;
			local ShootCooldown = Handle.Parent and Handle.Parent:FindFirstChild('ShootingCooldown');
			local Duration = ShootCooldown and tonumber(ShootCooldown.Value) or 0.3;
			Delay(Duration, function()
				if ReduceWalk and ReduceWalk.Parent then ReduceWalk:Destroy() end;
			end);
		end;
	end;

	Spawn(function()
		Animate(Handle.Parent);
	end);

	return HitPosition, HitInstance, HitNormal;
end;

function GetDoubleTapCount(ToolName)
	local DTCfg = GetConfig()['Modifications']['Double Tap'];
	if not DTCfg['Enabled'] then return 1 end;
	if DTCfg['Mode'] ~= 'Always' and not State.DoubleTapActive then return 1 end;

	local WeaponConfigs = DTCfg['Weapon Configs'];
	if WeaponConfigs and WeaponConfigs['Enabled'] then
		local WClass = GetWeaponClass(ToolName);
		local WConfig = WeaponConfigs[WClass];
		if WConfig and not WConfig['Enabled'] then
			return 1;
		end;
	end;

	return 2; 
end;

local DamageModifierLib = nil;
do
	local DamageModifier = {}

	DamageModifier.DefaultConfig = {
		Enabled = true,
		Weapons = {
			Shotguns = {
				Enabled = true,
				Mode = 'half',
			},
			Pistols = {
				Enabled = true,
				Mode = 'full',
			},
			Others = {
				Enabled = true,
				Mode = 'full',
			},
		},
	}

	DamageModifier.ShotgunWeapons = {
		['[Double-Barrel SG]'] = true,
		['[TacticalShotgun]'] = true,
		['[Tactical Shotgun]'] = true,
		['[Tactical-Shotgun]'] = true,
		['[Shotgun]'] = true,
		['[Drum-Shotgun]'] = true,
	}

	DamageModifier.PistolWeapons = {
		['[Revolver]'] = true,
		['[Silencer]'] = true,
		['[Glock]'] = true,
		['[Deagle]'] = true,
	}

	function DamageModifier.GetWeaponClass(toolName)
		if DamageModifier.ShotgunWeapons[toolName] then
			return 'Shotguns'
		end

		if DamageModifier.PistolWeapons[toolName] then
			return 'Pistols'
		end

		return 'Others'
	end

	function DamageModifier.GetOverridePart(character, mode)
		if not character then
			return nil
		end

		if mode == 'full' then
			return character:FindFirstChild('Head')
		end

		if mode == 'half' then
			return character:FindFirstChild('HumanoidRootPart')
		end
		
		if mode == 'min' then
			return character:FindFirstChild('Right Leg') or character:FindFirstChild('RightLeg')
		end

		return nil
	end

	function DamageModifier.GetConfig(config)
		return config or DamageModifier.DefaultConfig
	end

	function DamageModifier.Apply(toolName, hitPosition, hitInstance, hitNormal, config, getWeaponClass)
		config = DamageModifier.GetConfig(config)

		if not config or not config.Enabled or not hitInstance or not hitInstance.Parent then
			return hitPosition, hitInstance, hitNormal
		end

		local weapons = config.Weapons
		if not weapons then
			return hitPosition, hitInstance, hitNormal
		end

		local resolveWeaponClass = getWeaponClass or DamageModifier.GetWeaponClass
		local weaponClass = resolveWeaponClass(toolName)
		local weaponConfig = weapons and weapons[weaponClass]
		if not weaponConfig or not weaponConfig.Enabled then
			return hitPosition, hitInstance, hitNormal
		end

		local character = hitInstance:FindFirstAncestorOfClass('Model')
		if not character or not character:FindFirstChildOfClass('Humanoid') then
			return hitPosition, hitInstance, hitNormal
		end

		local override = DamageModifier.GetOverridePart(character, weaponConfig.Mode)
		if not override then
			return hitPosition, hitInstance, hitNormal
		end

		return hitPosition, override, hitNormal
	end

	DamageModifierLib = DamageModifier
end;

function ApplyDamageModifierHit(ToolName, HitPosition, HitInstance, HitNormal)
	local DmgCfg = GetConfig()['Modifications']['Das Hood']['Damage Modifier'];
	if DamageModifierLib and type(DamageModifierLib.Apply) == 'function' then
		return DamageModifierLib.Apply(ToolName, HitPosition, HitInstance, HitNormal, DmgCfg, GetWeaponClass);
	end;

	if not DmgCfg or not DmgCfg['Enabled'] or not HitInstance or not HitInstance.Parent then
		return HitPosition, HitInstance, HitNormal;
	end;

	local Weapons = DmgCfg['Weapons'];
	if not Weapons then
		return HitPosition, HitInstance, HitNormal;
	end;

	local WeaponClass = GetWeaponClass(ToolName);
	local WeaponCfg = Weapons[WeaponClass];
	if not WeaponCfg or not WeaponCfg['Enabled'] then
		return HitPosition, HitInstance, HitNormal;
	end;

	local Character = HitInstance:FindFirstAncestorOfClass('Model');
	if not Character or not Character:FindFirstChildOfClass('Humanoid') then
		return HitPosition, HitInstance, HitNormal;
	end;

	local Override = nil;
	if WeaponCfg['Mode'] == 'full' then
		Override = Character:FindFirstChild('Head');
	elseif WeaponCfg['Mode'] == 'half' then
		Override = Character:FindFirstChild('HumanoidRootPart');
	elseif WeaponCfg['Mode'] == 'min' then
		Override = Character:FindFirstChild('Right Leg') or Character:FindFirstChild('RightLeg');
	end;

	if not Override then
		return HitPosition, HitInstance, HitNormal;
	end;

	return HitPosition, Override, HitNormal;
end;

EmulateGunFire = function(Tool)
	local Character = LocalPlayer.Character;
	if not Character then return end;
	if _G.GUN_COMBAT_TOGGLE then return end;
	if not CanShoot(Character) then return end;

	local Handle = Tool:FindFirstChild('Handle');
	if not Handle then return end;
	local Ammo = Tool:FindFirstChild('Ammo');
	if not Ammo or Ammo.Value <= 0 then
		local NoAmmo = Handle:FindFirstChild('NoAmmo');
		if NoAmmo then NoAmmo:Play() end;
		return;
	end;
	local Range = Tool:FindFirstChild('Range');
	local RangeValue = Range and Range.Value or 200;

	local RemoteEvent = Tool:FindFirstChild('RemoteEvent');
	local ToolRemote = RemoteEvent or { FireServer = function() end };

	local MuzzlePos = GetMuzzlePosition(Tool);
	if not MuzzlePos then return end;
	local IsShotgun = ShotgunWeapons[Tool.Name] or false;

		ShootRayParams.FilterDescendantsInstances = BuildFilter(ShootFilter, Character);

		ToolRemote:FireServer('Shoot');

		local DoubleTapCount = GetDoubleTapCount(Tool.Name);
		for _dt = 1, DoubleTapCount do
			if IsShotgun then
				local ServerTime = Workspace:GetServerTimeNow();
				local SpreadMult = 1;
				local SpreadCfg = GetConfig()['Modifications']['Spread Modifications'];
				if SpreadCfg['Enabled'] then
					SpreadMult = SpreadCfg['Value'] or 1;
					local Rand = SpreadCfg['Randomizer'];
					if Rand and Rand['Enabled'] then
						local Min = Rand['Min'] or 1;
						local Max = Rand['Max'] or 1;
						local Alpha = MathRandom();
						SpreadMult = SpreadMult * (Min + (Max - Min) * Alpha);
					end;
				end;
				for PelletIndex = 1, 5 do
					local SpreadX = (MathRandom() > 0.5 and MathRandom() * 0.05 or -MathRandom() * 0.05) * SpreadMult;
					local SpreadY = (MathRandom() > 0.5 and MathRandom() * 0.1 or -MathRandom() * 0.1) * SpreadMult;
					local SpreadZ = (MathRandom() > 0.5 and MathRandom() * 0.05 or -MathRandom() * 0.05) * SpreadMult;
					local Spread = Vector3New(SpreadX, SpreadY, SpreadZ);

					local AimPos = GetAimPosition(MuzzlePos, RangeValue);
					local AimDir = (AimPos - MuzzlePos).Unit + Spread;
					local AimPosition = MuzzlePos + AimDir * RangeValue;

					local HitPosition, HitInstance, HitNormal;
					if _dt == 1 then
						HitPosition, HitInstance, HitNormal = ShowPellet(Character, Handle, MuzzlePos, AimPosition, RangeValue);
					end;
					if not HitPosition then
						local Direction = AimDir * RangeValue;
						local RayResult = Workspace:Raycast(MuzzlePos, Direction, ShootRayParams);
						HitPosition = RayResult and RayResult.Position or (MuzzlePos + Direction);
						HitInstance = RayResult and RayResult.Instance or nil;
						HitNormal = RayResult and RayResult.Normal or Vector3New(0, 1, 0);
					end;
					HitPosition, HitInstance, HitNormal = ApplyDamageModifierHit(Tool.Name, HitPosition, HitInstance, HitNormal);

					ReplicatedStorage.MainEvent:FireServer('ShootGun', Handle, MuzzlePos, HitPosition, HitInstance, HitNormal, ServerTime);
				end;
			else
				local AimPos = GetAimPosition(MuzzlePos, RangeValue);
				local AimPosition = MuzzlePos + (AimPos - MuzzlePos).Unit * RangeValue;

				local HitPosition, HitInstance, HitNormal;
				if _dt == 1 then
					HitPosition, HitInstance, HitNormal = ShowPellet(Character, Handle, MuzzlePos, AimPosition, RangeValue);
				end;
				if not HitPosition then
					local Direction = (AimPos - MuzzlePos).Unit * RangeValue;
					local RayResult = Workspace:Raycast(MuzzlePos, Direction, ShootRayParams);
					HitPosition = RayResult and RayResult.Position or (MuzzlePos + Direction);
					HitInstance = RayResult and RayResult.Instance or nil;
					HitNormal = RayResult and RayResult.Normal or Vector3New(0, 1, 0);
				end;
				HitPosition, HitInstance, HitNormal = ApplyDamageModifierHit(Tool.Name, HitPosition, HitInstance, HitNormal);

				ReplicatedStorage.MainEvent:FireServer('ShootGun', Handle, MuzzlePos, HitPosition, HitInstance, HitNormal);
			end;
		end;

		ToolRemote:FireServer();
end;

CachedMainEvent = nil;

HookedTools = {};
function HookGunActivation(Character)
	if not Character then return end;
	Character.ChildAdded:Connect(function(Child)
		if not Child:IsA('Tool') then return end;
		if not MuzzleOffsets[Child.Name] then return end;
		if HookedTools[Child] then return end;
		HookedTools[Child] = true;
		local LastFire = 0;

		local function GetCooldown()
			return GetToolFireDelay(Child);
		end;
		local IsAuto = AutoWeapons[Child.Name] or false;
		local IsBurst = BurstWeapons[Child.Name] or false;

		Child.Activated:Connect(function()
			State.IsShooting = true;
			local Cooldown = GetCooldown();
			if IsAuto then
				if Tick() - LastFire < Cooldown + 0.0095 then return end;
				LastFire = Tick();
				local Firing = true;
				Spawn(function()
					while Firing and Child.Parent == Character do
						EmulateGunFire(Child);
						Wait(Cooldown + 0.0095);
						LastFire = Tick();
					end;
				end);
				Child.Deactivated:Wait();
				Firing = false;
				State.IsShooting = false;
			elseif IsBurst then
				if GetConfig()['Modifications']['Delay Changer']['Enabled'] then
					if Tick() - LastFire < Cooldown + 0.0095 then return end;
					LastFire = Tick();
					local Firing = true;
					Spawn(function()
						while Firing and Child.Parent == Character do
							EmulateGunFire(Child);
							Wait(Cooldown + 0.0095);
							LastFire = Tick();
						end;
					end);
					Child.Deactivated:Wait();
					Firing = false;
					State.IsShooting = false;
				else
					local Tolerance = 0.3;
					Pcall(function()
						local TC = Child:FindFirstChild('ToleranceCooldown');
						if TC then Tolerance = TC.Value end;
					end);
					if Tick() - LastFire < Tolerance then return end;
					LastFire = Tick();
					local BurstCount = 3;
					Xpcall(function()
						local Ammo = Child:FindFirstChild('Ammo');
						if Ammo then BurstCount = MathMin(BurstCount, Ammo.Value) end;
					end, ErrHandler);
					Spawn(function()
						for _ = 1, BurstCount do
							EmulateGunFire(Child);
							Wait(Cooldown + 0.0095);
						end;
					end);
				end;
			else
				if Tick() - LastFire < Cooldown + 0.0095 then return end;
				LastFire = Tick();
				EmulateGunFire(Child);
				State.IsShooting = false;
			end;
		end);
		Child.Deactivated:Connect(function()
			State.IsShooting = false;
		end);
	end);
end;

IsInside3DFOV = function(Position, FeatureName)
	local FOVRoot = GetConfig()['Main']['FOV'];
	local FOVKey = FeatureName == 'Silent Aim' and 'Silent' or FeatureName;
	local FeatureFOV = FOVRoot and FOVRoot[FOVKey];
	local FOV3D = FeatureFOV and FeatureFOV['3D'];
	if not FeatureFOV or string.lower(tostring(FeatureFOV['Options'] or '2D')) ~= '3d' or not FOV3D then return true end;

	local CurrentCamera = Workspace.CurrentCamera;
	local MousePosition = GetCursorViewportPosition();
	local Ray = CurrentCamera:ViewportPointToRay(MousePosition.X, MousePosition.Y);
	local AlongRay = (Position - Ray.Origin):Dot(Ray.Direction);
	local Depth = MathMax(tonumber(FOV3D['Depth']) or 10, 0);
	if AlongRay <= 0 or AlongRay > Depth then return false end;

	local ClosestOnRay = Ray.Origin + Ray.Direction * AlongRay;
	local Delta = CurrentCamera.CFrame:VectorToObjectSpace(Position - ClosestOnRay);
	local Width = MathMax(tonumber(FOV3D['Width']) or 6, 0);
	local Height = MathMax(tonumber(FOV3D['Height']) or 6, 0);
	return MathAbs(Delta.X) <= Width / 2 and MathAbs(Delta.Y) <= Height / 2;
end;

GetClosestPlayerToCursor = function(MaxRange, AllowOffscreen, ChecksKey, FeatureName)
	local CurrentCamera = Workspace.CurrentCamera;
	local MousePosition = GetCursorViewportPosition();
	local CamPos = CurrentCamera.CFrame.Position;
	local CamLook = CurrentCamera.CFrame.LookVector;
	local Closest = nil;
	local ClosestDist = MathHuge;

	for _, Player in next, Players:GetPlayers() do
		if Player == LocalPlayer then continue end;
		if not PassesConditions(Player, ChecksKey) then continue end;

		local Character = Player.Character;
		if not Character then continue end;
		local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart');
		if not HumanoidRootPart then continue end;
		if FeatureName and not IsInside3DFOV(HumanoidRootPart.Position, FeatureName) then continue end;

		if MaxRange and MaxRange < MathHuge then
			local WorldDist = (CamPos - HumanoidRootPart.Position).Magnitude;
			if WorldDist > MaxRange then continue end;
		end;

		local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position);

		if AllowOffscreen then
			local ToTarget = (HumanoidRootPart.Position - CamPos).Unit;
			local Dot = CamLook:Dot(ToTarget);
			if Dot <= 0 then continue end;
			local Magnitude;
			if OnScreen and ScreenPos.Z > 0 then
				Magnitude = (Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition).Magnitude;
			else
				Magnitude = (1 - Dot) * 10000;
			end;
			if Magnitude < ClosestDist then
				Closest = Player;
				ClosestDist = Magnitude;
			end;
		else
			if not OnScreen then continue end;
			if ScreenPos.Z <= 0 then continue end;
			local Magnitude = (Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition).Magnitude;
			if Magnitude < ClosestDist then
				Closest = Player;
				ClosestDist = Magnitude;
			end;
		end;
	end;
	return Closest;
end;

function ActivateTool()
	local Character = LocalPlayer.Character;
	if not Character then return end;
	local Tool = Character:FindFirstChildOfClass('Tool');
	if Tool and Tool:IsDescendantOf(Character) and Tool.Name ~= '[Knife]' then
		Tool:Activate();
	end;
end;

local RageFire;

function TriggerShot(Cooldown, Tool, Handle, ToolName, Origin, AimPosition, GunRange)
	local Now = DateTime.now().UnixTimestampMillis;
	if Now - State.LastTriggerShot >= Cooldown * 1000 then
		State.LastTriggerShot = Now;
		local AimOffset = AimPosition - Origin;
		local AimDistance = AimOffset.Magnitude;
		if AimDistance <= 0 then return end;
		local Direction = AimOffset / AimDistance;
		local SpreadCfg = GetConfig()['Modifications']['Spread Modifications'];
		local SpreadConfig = SpreadCfg['Enabled'] and SpreadCfg or nil;
		local DoubleTapCount = GetDoubleTapCount(ToolName);
		for _ = 1, DoubleTapCount do
			RageFire(Tool, Handle, ToolName, Origin, Direction, GunRange, SpreadConfig);
		end;
	end;
end;

RunTriggerbot = function()
	local TriggerCfg = GetConfig()['Triggerbot'];
	if not TriggerCfg['Enabled'] then return end;
	if not State.TriggerState then return end;

	local Target = State.Targets.Triggerbot;
	local TargetChar = Target and Target.Character;
	if not TargetChar then return end;

	local Character = LocalPlayer.Character;
	if not Character then return end;
	local Tool = Character:FindFirstChildOfClass('Tool');
	if not Tool or not Tool:FindFirstChild('Ammo') or Tool.Name == '[Knife]' then return end;
	if not State.CanTriggerbotShoot then return end;

	local Humanoid = Character:FindFirstChild('Humanoid');
	if not Humanoid or Humanoid.Health <= 0 then return end;
	local BodyEffects = Character:FindFirstChild('BodyEffects');
	if not BodyEffects then return end;
	if BodyEffects:FindFirstChild('K.O') and BodyEffects['K.O'].Value then return end;
	if BodyEffects:FindFirstChild('Reload') and BodyEffects.Reload.Value then return end;
	if BodyEffects:FindFirstChild('Dead') and BodyEffects.Dead.Value then return end;

	if not PassesConditions(Target, 'Triggerbot') then return end;

	local SelfHRP = Character:FindFirstChild('HumanoidRootPart');
	local TargetHRP = TargetChar:FindFirstChild('HumanoidRootPart');
	if not SelfHRP or not TargetHRP then return end;

	local TargetDist = (SelfHRP.Position - TargetHRP.Position).Magnitude;
	local TrigMaxRange = TriggerCfg['Max Range'] or MathHuge;
	if TargetDist > TrigMaxRange then return end;

	local Handle = Tool:FindFirstChild('Handle');
	if not Handle then return end;
	local ToolName = Tool.Name;

	local RangeChild = Tool:FindFirstChild('Range');
	local GunRange = RangeChild and RangeChild.Value or 200;

	if TriggerCfg['Limit To Weapon Range'] then
		local RangeOrigin = GetMuzzlePosition(Tool) or SelfHRP.Position;
		if (RangeOrigin - TargetHRP.Position).Magnitude > GunRange then return end;
	end;

	local CurrentCamera = Workspace.CurrentCamera;
	local ViewportY = CurrentCamera.ViewportSize.Y;
	local CamFOV = CurrentCamera.FieldOfView;

	local AimPos = TargetHRP.Position;
	local PredCfg = TriggerCfg['Prediction'];
	if PredCfg and PredCfg['Enabled'] == true then
		local Vel = GetDeltaVelocity(TargetHRP);
		AimPos = AimPos + Vector3New(Vel.X * (PredCfg['X'] or 0.13), Vel.Y * (PredCfg['Y'] or 0.13), Vel.Z * (PredCfg['Z'] or 0.13));
	end;

	local OffscreenTrigCfg = TriggerCfg['Offscreen Targeting'];
	local TrigAllowOffscreen = OffscreenTrigCfg and OffscreenTrigCfg['Enabled'];

	local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(AimPos);
	if not OnScreen and not TrigAllowOffscreen then return end;
	if not IsInside3DFOV(AimPos, 'Triggerbot') then return end;

	local HitCheck = TriggerCfg['Trigger Mode'] or 'FOV';
	local ShouldFire = false;

	local TrigFOV = GetConfig()['Main']['FOV']['Triggerbot'];
	if string.lower(tostring(TrigFOV['Options'] or '2D')) == '3d' then
		ShouldFire = true;
	elseif TrigAllowOffscreen then
		ShouldFire = true;
	elseif HitCheck == 'Player' then
		local Mouse = LocalPlayer:GetMouse();
		local MouseTarget = Mouse.Target;
		ShouldFire = MouseTarget and MouseTarget:IsDescendantOf(TargetChar);
	else
		local MouseLoc = UserInputService:GetMouseLocation();
		local Delta = Vector2New(ScreenPos.X, ScreenPos.Y) - MouseLoc;
		local Depth = ScreenPos.Z;
		if Depth <= 1 then return end;
		local ScaleFactor = (TargetHRP.Size.Y * ViewportY) / (Depth * 2) * 80 / CamFOV;
		local TrigShape = false;
		if TrigShape == 'Circle' then
			local R = 9e9 * ScaleFactor;
			ShouldFire = not TrigFOV['Visualize']['Enabled'] or (Delta.X * Delta.X + Delta.Y * Delta.Y <= R * R);
		else
			local ScaledW = (TrigFOV['Width'] and (TrigFOV['Width'][1] or 9e9) or 9e9) * ScaleFactor;
			local ScaledH = (TrigFOV['Height'] and (TrigFOV['Height'][1] or 9e9) or 9e9) * ScaleFactor;
			ShouldFire = not TrigFOV['Visualize']['Enabled'] or (MathAbs(Delta.X) <= ScaledW / 2 and MathAbs(Delta.Y) <= ScaledH / 2);
		end;
	end;

	if ShouldFire then
		local Origin = GetMuzzlePosition(Tool) or SelfHRP.Position;
		if not CachedMainEvent then CachedMainEvent = ReplicatedStorage:FindFirstChild('MainEvent') end;
		if not CachedMainEvent then return end;
		local TriggerDelay = TriggerCfg['Delay'] or 0;
		local WeaponDelay = GetToolFireDelay(Tool);
		local EffectiveDelay = MathMax(TriggerDelay, WeaponDelay);
		TriggerShot(EffectiveDelay, Tool, Handle, ToolName, Origin, AimPos, GunRange);
	end;
end;

SilentTargetLocked = false;

UtilityUI = Instance.new('ScreenGui');
UtilityUI.Name = 'ciderui';
UtilityUI.IgnoreGuiInset = true;
UtilityUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
UtilityUI.Parent = CoreGui;

function CreateSquare()
	local Obj = {
		_Size = Vector2New(0, 0),
		_Position = Vector2New(0, 0),
		_Color = Color3.new(1, 1, 1),
		_Visible = false,
		_Filled = false,
		_Thickness = 1,
		_Transparency = 1,
	};
	local Frame = Instance.new('Frame');
	Frame.BorderSizePixel = 0;
	Frame.BackgroundTransparency = 1;
	Frame.BackgroundColor3 = Obj._Color;
	Frame.Visible = Obj._Visible;
	Frame.Parent = UtilityUI;
	local Stroke = Instance.new('UIStroke');
	Stroke.Thickness = Obj._Thickness;
	Stroke.Enabled = true;
	Stroke.LineJoinMode = Enum.LineJoinMode.Miter;
	Stroke.Parent = Frame;
	local Corner = Instance.new('UICorner');
	Corner.CornerRadius = UDim.new(0, 0);
	Corner.Parent = Frame;
	local Proxy = {};
	local Meta = {
		__newindex = function(_, Key, Value)
			if Key == 'Size' then
				Obj._Size = Value;
				Frame.Size = UDim2.fromOffset(Value.X, Value.Y);
			elseif Key == 'Round' then
				Obj._Round = Value;
				Corner.CornerRadius = Value and UDim.new(1, 0) or UDim.new(0, 0);
			elseif Key == 'Position' then
				Obj._Position = Value;
				Frame.Position = UDim2.fromOffset(Value.X, Value.Y);
			elseif Key == 'Color' then
				Obj._Color = Value;
				Frame.BackgroundColor3 = Value;
				Stroke.Color = Value;
			elseif Key == 'Visible' then
				Obj._Visible = Value;
				Frame.Visible = Value;
			elseif Key == 'Filled' then
				Obj._Filled = Value;
				Frame.BackgroundTransparency = Value and MathClamp(1 - Obj._Transparency, 0, 1) or 1;
				Stroke.Enabled = not Value;
			elseif Key == 'Thickness' then
				Obj._Thickness = Value;
				Stroke.Thickness = MathClamp(Value, 0.6, 0x7FFFFFFF);
			elseif Key == 'Transparency' then
				Obj._Transparency = Value;
				local Alpha = MathClamp(1 - Value, 0, 1);
				Frame.BackgroundTransparency = Obj._Filled and Alpha or 1;
				Stroke.Transparency = Alpha;
			end;
		end,
		__index = function(_, Key)
			if Key == 'Remove' or Key == 'Destroy' then
				return function() Frame:Destroy() end;
			elseif Key == 'Size' then return Obj._Size;
			elseif Key == 'Round' then return Obj._Round;
			elseif Key == 'Position' then return Obj._Position;
			elseif Key == 'Color' then return Obj._Color;
			elseif Key == 'Visible' then return Obj._Visible;
			elseif Key == 'Filled' then return Obj._Filled;
			elseif Key == 'Thickness' then return Obj._Thickness;
			elseif Key == 'Transparency' then return Obj._Transparency;
			end;
			return nil;
		end,
	};
	return setmetatable(Proxy, Meta);
end;

function CreateLine()
	local Obj = {
		_From = Vector2New(0, 0),
		_To = Vector2New(0, 0),
		_Color = Color3.new(1, 1, 1),
		_Visible = false,
		_Thickness = 1,
		_Transparency = 1,
	};
	local Frame = Instance.new('Frame');
	Frame.AnchorPoint = Vector2New(0.5, 0.5);
	Frame.BorderSizePixel = 0;
	Frame.BackgroundColor3 = Obj._Color;
	Frame.Visible = Obj._Visible;
	Frame.BackgroundTransparency = 0;
	Frame.Size = UDim2.new();
	Frame.Parent = UtilityUI;
	local function UpdateLine()
		local Dir = Obj._To - Obj._From;
		local Center = (Obj._To + Obj._From) / 2;
		local Mag = Dir.Magnitude;
		local Theta = MathDeg(MathAtan2(Dir.Y, Dir.X));
		Frame.Position = UDim2.fromOffset(Center.X, Center.Y);
		Frame.Rotation = Theta;
		Frame.Size = UDim2.fromOffset(Mag, Obj._Thickness);
	end;
	local Proxy = {};
	local Meta = {
		__newindex = function(_, Key, Value)
			if Key == 'From' then
				Obj._From = Value;
				UpdateLine();
			elseif Key == 'To' then
				Obj._To = Value;
				UpdateLine();
			elseif Key == 'Color' then
				Obj._Color = Value;
				Frame.BackgroundColor3 = Value;
			elseif Key == 'Visible' then
				Obj._Visible = Value;
				Frame.Visible = Value;
			elseif Key == 'Thickness' then
				Obj._Thickness = Value;
				UpdateLine();
			elseif Key == 'Transparency' then
				Obj._Transparency = Value;
				Frame.BackgroundTransparency = MathClamp(1 - Value, 0, 1);
			end;
		end,
		__index = function(_, Key)
			if Key == 'Remove' or Key == 'Destroy' then
				return function() Frame:Destroy() end;
			elseif Key == 'From' then return Obj._From;
			elseif Key == 'To' then return Obj._To;
			elseif Key == 'Color' then return Obj._Color;
			elseif Key == 'Visible' then return Obj._Visible;
			elseif Key == 'Thickness' then return Obj._Thickness;
			elseif Key == 'Transparency' then return Obj._Transparency;
			end;
			return nil;
		end,
	};
	return setmetatable(Proxy, Meta);
end;

SilentFOVBox = CreateSquare();
SilentFOVBox.Visible = false;
SilentFOVBox.Filled = false;
SilentFOVBox.Thickness = 1;
SilentFOVBox.Transparency = 1;

TriggerFOVBox = CreateSquare();
TriggerFOVBox.Visible = false;
TriggerFOVBox.Filled = false;
TriggerFOVBox.Thickness = 1;
TriggerFOVBox.Transparency = 1;

AimbotFOVBox = CreateSquare();
AimbotFOVBox.Visible = false;
AimbotFOVBox.Filled = false;
AimbotFOVBox.Thickness = 1;
AimbotFOVBox.Transparency = 1;

local Create3DFOVBox = function()
	local Lines = {};
	for _ = 1, 12 do
		local Line = CreateLine();
		Line.Visible = false;
		Line.Thickness = 1;
		Line.Transparency = 1;
		Lines[#Lines + 1] = Line;
	end;
	return Lines;
end;

local Hide3DFOVBox = function(Lines)
	for _, Line in next, Lines do
		Line.Visible = false;
	end;
end;

local Update3DFOVBox = function(Lines, FOVCfg, Color)
	local FOV3D = FOVCfg and FOVCfg['3D'];
	if not FOVCfg or not FOVCfg['Visualize']['Enabled'] or string.lower(tostring(FOVCfg['Options'] or '2D')) ~= '3d' or not FOV3D then
		Hide3DFOVBox(Lines);
		return;
	end;

	local CurrentCamera = Workspace.CurrentCamera;
	local MousePosition = GetCursorViewportPosition();
	local Ray = CurrentCamera:ViewportPointToRay(MousePosition.X, MousePosition.Y);
	local Right = CurrentCamera.CFrame.RightVector;
	local Up = CurrentCamera.CFrame.UpVector;
	local Width = MathMax(tonumber(FOV3D['Width']) or 6, 0);
	local Height = MathMax(tonumber(FOV3D['Height']) or 6, 0);
	local Depth = MathMax(tonumber(FOV3D['Depth']) or 10, 0);
	local Near = MathMin(MathMax(Width, Height, 1), Depth);
	local Centers = {
		Ray.Origin + Ray.Direction * Near,
		Ray.Origin + Ray.Direction * Depth,
	};
	local Corners = {};
	for _, Center in ipairs(Centers) do
		local HalfWidth = Right * (Width / 2);
		local HalfHeight = Up * (Height / 2);
		Corners[#Corners + 1] = Center - HalfWidth - HalfHeight;
		Corners[#Corners + 1] = Center + HalfWidth - HalfHeight;
		Corners[#Corners + 1] = Center + HalfWidth + HalfHeight;
		Corners[#Corners + 1] = Center - HalfWidth + HalfHeight;
	end;

	local Projected = {};
	for Index, Corner in ipairs(Corners) do
		local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(Corner);
		if not OnScreen or ScreenPos.Z <= 0 then
			Hide3DFOVBox(Lines);
			return;
		end;
		Projected[Index] = Vector2New(ScreenPos.X, ScreenPos.Y);
	end;

	local Edges = {
		{1, 2}, {2, 3}, {3, 4}, {4, 1},
		{5, 6}, {6, 7}, {7, 8}, {8, 5},
		{1, 5}, {2, 6}, {3, 7}, {4, 8},
	};
	for Index, Edge in ipairs(Edges) do
		local Line = Lines[Index];
		Line.From = Projected[Edge[1]];
		Line.To = Projected[Edge[2]];
		Line.Color = Color;
		Line.Visible = true;
	end;
end;

Silent3DFOVBox = Create3DFOVBox();
Trigger3DFOVBox = Create3DFOVBox();
Aimbot3DFOVBox = Create3DFOVBox();


SilentFOVOutColor = Color3.fromRGB(255, 255, 255);
SilentFOVInColor = Color3.fromRGB(100, 180, 255);
TriggerFOVOutColor = Color3.fromRGB(255, 255, 255);
TriggerFOVInColor = Color3.fromRGB(100, 180, 255);
AimbotFOVOutColor = Color3.fromRGB(255, 255, 255);
AimbotFOVInColor = Color3.fromRGB(100, 180, 255);

SilentTargetLine = CreateLine();
SilentTargetLine.Visible = false;
SilentTargetLine.Thickness = 0.5;
SilentTargetLine.Transparency = 1;
SilentTargetLine.Parent = DrawingGui;

OffscreenSilentLine = CreateLine();
OffscreenSilentLine.Visible = false;
OffscreenSilentLine.Thickness = 0.5;
OffscreenSilentLine.Transparency = 1;

function CreateTextLabel()
	local Obj = {
		_Text = '',
		_Size = 13,
		_Position = Vector2New(0, 0),
		_Color = Color3.new(1, 1, 1),
		_Visible = false,
		_Center = false,
		_Outline = true,
		_OutlineColor = Color3.new(0, 0, 0),
		_Transparency = 1,
		_FontFace = nil,
	};

	local Label = Instance.new('TextLabel');
	Label.AnchorPoint = Vector2New(0.5, 0.5);
	Label.BorderSizePixel = 0;
	Label.BackgroundTransparency = 1;
	Label.RichText = true;
	Label.Font = Enum.Font.SourceSansBold;
	Label.TextSize = Obj._Size;
	Label.TextColor3 = Obj._Color;
	Label.Visible = Obj._Visible;
	Label.Text = '';
	Label.Parent = UtilityUI;

	local Stroke = Instance.new('UIStroke');
	Stroke.Thickness = 1;
	Stroke.Color = Obj._OutlineColor;
	Stroke.Enabled = Obj._Outline;
	Stroke.Parent = Label;

	local function UpdatePosition()
		local Bounds = Label.TextBounds;
		local OffsetX = Obj._Center and 0 or (Bounds.X / 2);
		Label.Position = UDim2.fromOffset(Obj._Position.X + OffsetX, Obj._Position.Y + Bounds.Y / 2);
	end;

	Label:GetPropertyChangedSignal('TextBounds'):Connect(UpdatePosition);

	local Proxy = {};
	local Meta = {
		__newindex = function(_, Key, Value)
			if Key == 'Text' then
				Obj._Text = Value;
				Label.Text = Value;
			elseif Key == 'Size' then
				Obj._Size = Value;
				Label.TextSize = Value;
			elseif Key == 'Position' then
				Obj._Position = Value;
				UpdatePosition();
			elseif Key == 'Color' then
				Obj._Color = Value;
				Label.TextColor3 = Value;
			elseif Key == 'Visible' then
				Obj._Visible = Value;
				Label.Visible = Value;
			elseif Key == 'Center' then
				Obj._Center = Value;
				UpdatePosition();
			elseif Key == 'Outline' then
				Obj._Outline = Value;
				Stroke.Enabled = Value;
			elseif Key == 'OutlineColor' then
				Obj._OutlineColor = Value;
				Stroke.Color = Value;
			elseif Key == 'Transparency' then
				Obj._Transparency = Value;
				local Alpha = MathClamp(1 - Value, 0, 1);
				Label.TextTransparency = Alpha;
				Stroke.Transparency = Alpha;
			elseif Key == 'Font' then
				Label.Font = Value;
			elseif Key == 'FontFace' then
				Obj._FontFace = Value;
				Label.FontFace = Value;
			elseif Key == 'StrokeThickness' then
				Stroke.Thickness = Value;
			elseif Key == 'StrokeTransparency' then
				Stroke.Transparency = Value;
			end;
		end,
		__index = function(_, Key)
			if Key == 'TextBounds' then
				return Label.TextBounds;
			elseif Key == 'Label' then
				return Label;
			elseif Key == 'Stroke' then
				return Stroke;
			elseif Key == 'Remove' or Key == 'Destroy' then
				return function()
					Label:Destroy();
				end;
			elseif Key == 'Text' then return Obj._Text;
			elseif Key == 'Size' then return Obj._Size;
			elseif Key == 'Position' then return Obj._Position;
			elseif Key == 'Color' then return Obj._Color;
			elseif Key == 'FontFace' then return Obj._FontFace;
			elseif Key == 'Visible' then return Obj._Visible;
			elseif Key == 'Center' then return Obj._Center;
			elseif Key == 'Outline' then return Obj._Outline;
			elseif Key == 'Transparency' then return Obj._Transparency;
			end;
			return nil;
		end,
	};
	return setmetatable(Proxy, Meta);
end;

NameESPDrawings = {};
HealthBarDrawings = {};
HealthBarValueCache = {};

function GetHealthBarArmor(Player)
	local Character = Player and Player.Character;
	local BodyEffects = Character and Character:FindFirstChild('BodyEffects');
	local ArmorObject = BodyEffects and (
		BodyEffects:FindFirstChild('Armor')
		or BodyEffects:FindFirstChild('Armour')
		or BodyEffects:FindFirstChild('Defense')
	);
	if ArmorObject and tonumber(ArmorObject.Value) then
		return tonumber(ArmorObject.Value), true;
	end;
	local Leaderstats = Player and Player:FindFirstChild('leaderstats');
	local LeaderArmor = Leaderstats and (
		Leaderstats:FindFirstChild('Armor')
		or Leaderstats:FindFirstChild('Armour')
		or Leaderstats:FindFirstChild('Defense')
		or Leaderstats:FindFirstChild('Vest')
	);
	if LeaderArmor and tonumber(LeaderArmor.Value) then
		return tonumber(LeaderArmor.Value), true;
	end;
	return 0, false;
end;

function GetStableHealthBarValues(Player, Humanoid)
	local Now = Clock();
	local Cache = HealthBarValueCache[Player];
	if not Cache or Cache.Character ~= Player.Character then
		Cache = {
			Character = Player.Character,
			Health = tonumber(Humanoid.Health) or 0,
			MaxHealth = tonumber(Humanoid.MaxHealth) or 100,
			Armor = 0,
			ZeroSince = nil,
			ArmorMissingSince = nil,
		};
		HealthBarValueCache[Player] = Cache;
	end;

	local RawMaxHealth = tonumber(Humanoid.MaxHealth);
	if RawMaxHealth and RawMaxHealth > 0 and RawMaxHealth == RawMaxHealth then
		Cache.MaxHealth = RawMaxHealth;
	end;
	local MaxHealth = Cache.MaxHealth > 0 and Cache.MaxHealth or 100;

	local RawHealth = tonumber(Humanoid.Health);
	local IsDead = Humanoid:GetState() == EnumDead or not Humanoid.Parent;
	if RawHealth and RawHealth == RawHealth and RawHealth > 0 then
		Cache.Health = MathClamp(RawHealth, 0, MaxHealth);
		Cache.ZeroSince = nil;
	elseif IsDead then
		Cache.Health = 0;
		Cache.ZeroSince = Now;
	else
		Cache.ZeroSince = nil;
	end;

	local RawArmor, HasArmorValue = GetHealthBarArmor(Player);
	if HasArmorValue then
		Cache.Armor = MathMax(tonumber(RawArmor) or 0, 0);
		Cache.ArmorMissingSince = nil;
	else
		Cache.ArmorMissingSince = Cache.ArmorMissingSince or Now;
		if Now - Cache.ArmorMissingSince >= 0.3 then
			Cache.Armor = 0;
		end;
	end;

	return Cache.Health, MaxHealth, Cache.Armor, IsDead;
end;

function RemoveHealthBarSet(Set)
	if not Set then return end;
	for _, Sq in next, Set do
		pcall(function() Sq:Remove() end);
	end;
end;

function HideHealthBarSet(Set)
	if not Set then return end;
	for _, Sq in next, Set do
		Sq.Visible = false;
	end;
end;

function Cleanup()
	RestoreWalkSpeedState(State);
	for i = #_Conns, 1, -1 do
		local Conn = _Conns[i];
		_Conns[i] = nil;
		if Conn and Conn.Connected then
			pcall(function()
				Conn:Disconnect();
			end);
		end;
	end;
	pcall(function() RunService:UnbindFromRenderStep('ciderrage') end);
	if UtilityUI and UtilityUI.Parent then
		pcall(function()
			UtilityUI:Destroy();
		end);
	end;
	for _, Draw in next, NameESPDrawings do
		pcall(function()
			Draw:Remove();
		end);
	end;
	for Player in next, NameESPDrawings do
		NameESPDrawings[Player] = nil;
	end;
	for _, Set in next, HealthBarDrawings do
		RemoveHealthBarSet(Set);
	end;
	for Player in next, HealthBarDrawings do
		HealthBarDrawings[Player] = nil;
	end;
	for Player in next, HealthBarValueCache do
		HealthBarValueCache[Player] = nil;
	end;
end;

getgenv().cidercc_cleanup = Cleanup;

function CleanNameESP()
	for Player, Draw in next, NameESPDrawings do
		if not Player.Parent then
			Draw:Remove();
			NameESPDrawings[Player] = nil;
		end;
	end;
	for Player, Set in next, HealthBarDrawings do
		if not Player.Parent then
			RemoveHealthBarSet(Set);
			HealthBarDrawings[Player] = nil;
			HealthBarValueCache[Player] = nil;
		end;
	end;
end;

TrackConn(Players.PlayerRemoving:Connect(function(Player)
	if State.Future.LastTarget == Player then
		State.Future.LastTarget = nil;
		State.Future.LastWeaponClass = nil;
		State.Future.CurrentValues = nil;
	end;
	local Draw = NameESPDrawings[Player];
	if Draw then
		Draw:Remove();
		NameESPDrawings[Player] = nil;
	end;
	local Set = HealthBarDrawings[Player];
	if Set then
		RemoveHealthBarSet(Set);
		HealthBarDrawings[Player] = nil;
	end;
	HealthBarValueCache[Player] = nil;
end));

PanelTitle = CreateTextLabel();
PanelTitle.Visible = false;
PanelTitle.Size = 18;
PanelTitle.Outline = true;
PanelTitle.Center = true;
PanelTitle.Font = Enum.Font.GothamMedium;
PanelTitle.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
PanelTitle.StrokeThickness = 0.7;
PanelTitle.StrokeTransparency = 0;

PanelLabels = {};
for i = 1, 14 do
	local Label = CreateTextLabel();
	Label.Visible = false;
	Label.Size = 12;
	Label.Outline = true;
	Label.Center = true;
	Label.Font = Enum.Font.GothamMedium;
	Label.FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
	Label.StrokeThickness = 0.7;
	Label.StrokeTransparency = 0;
	PanelLabels[i] = Label;
end;

BrandHealthBarObject = nil;
BrandHealthBarScanAt = 0;

GetBrandHealthBarAnchor = function(ViewportSize)
	local Object = BrandHealthBarObject;
	if Object and Object.Parent and Object.Visible then
		local Size = Object.AbsoluteSize;
		local Position = Object.AbsolutePosition;
		if Size.X > 40 and Size.Y > 0 then
			return Position.X + Size.X / 2, ViewportSize.Y - 100;
		end;
	end;

	local Now = Clock();
	if Now - BrandHealthBarScanAt < 0.75 then
		return ViewportSize.X * 0.625, ViewportSize.Y - 100;
	end;
	BrandHealthBarScanAt = Now;

	local PlayerGui = LocalPlayer:FindFirstChildOfClass('PlayerGui');
	local Best = nil;
	local BestScore = -MathHuge;
	if PlayerGui then
		for _, GuiObject in next, PlayerGui:GetDescendants() do
			if not GuiObject:IsA('GuiObject') or not GuiObject.Visible then continue end;
			local Name = string.lower(GuiObject.Name);
			local Text = '';
			if GuiObject:IsA('TextLabel') or GuiObject:IsA('TextButton') then
				Text = string.lower(GuiObject.Text or '');
			end;
			local IsHealth = Name == 'hp'
				or string.find(Name, 'health', 1, true)
				or Text == 'health'
				or Text == 'hp';
			if not IsHealth then continue end;

			local Size = GuiObject.AbsoluteSize;
			local Position = GuiObject.AbsolutePosition;
			if Size.X < 40 or Size.Y <= 0 or Position.Y < ViewportSize.Y * 0.55 then continue end;

			local Score = Position.Y + Size.X;
			if Name == 'hp' or Name == 'health' then Score = Score + 500 end;
			if Score > BestScore then
				BestScore = Score;
				Best = GuiObject;
			end;
		end;
	end;

	BrandHealthBarObject = Best;
	if Best then
		local Size = Best.AbsoluteSize;
		local Position = Best.AbsolutePosition;
		return Position.X + Size.X / 2, ViewportSize.Y - 100;
	end;
	return ViewportSize.X * 0.625, ViewportSize.Y - 100;
end;

TriggerTargetLocked = false;
AimbotTargetLocked = false;

AntiFutureVisDot = CreateSquare();
AntiFutureVisDot.Visible = false;
AntiFutureVisDot.Color = Color3.fromRGB(255, 80, 80);
AntiFutureVisDot.Filled = true;
AntiFutureVisDot.Size = Vector2New(8, 8);

AntiFutureVisLabel = CreateTextLabel();
AntiFutureVisLabel.Visible = false;
AntiFutureVisLabel.Size = 11;
AntiFutureVisLabel.Outline = true;
AntiFutureVisLabel.Center = true;
AntiFutureVisLabel.Font = Enum.Font.SourceSansBold;
AntiFutureVisLabel.FontFace = Font.new('rbxasset://fonts/families/LegacyArial.json', Enum.FontWeight.Bold, Enum.FontStyle.Normal);

TrackConn(UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	if not GameProcessed or Input.UserInputType == Enum.UserInputType.MouseButton2 then
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then
			IsAimed = true;
		end;
	end;
end));
TrackConn(UserInputService.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		IsAimed = false;
	end;
end));

local function MatchesTriggerBinding(Input, Binding)
	if type(Binding) ~= 'table' then return false end;
	local Key = Binding['Key'];
	if Key == nil then return false end;

	local KeyName = Tostring(Key);
	local LowerKey = KeyName:lower();
	local Mode = Tostring(Binding['Mode'] or ''):lower();
	local IsMouse = Mode == 'mouse' or LowerKey:sub(1, 5) == 'mouse' or LowerKey:find('mousebutton', 1, true) ~= nil;

	if IsMouse then
		local Aliases = {
			mouse1 = 'mousebutton1',
			mouse2 = 'mousebutton2',
			mouse3 = 'mousebutton3',
			leftmouse = 'mousebutton1',
			rightmouse = 'mousebutton2',
			middlemouse = 'mousebutton3',
		};
		LowerKey = Aliases[LowerKey] or LowerKey;
		local InputName = Tostring(Input.UserInputType):match('([^%.]+)$');
		return InputName ~= nil and InputName:lower() == LowerKey;
	end;

	local KeyCodeName = Tostring(Input.KeyCode):match('([^%.]+)$');
	return KeyCodeName ~= nil and KeyCodeName:lower() == LowerKey;
end;

TrackConn(UserInputService.InputBegan:Connect(function(Input, Processed)
	local SilentAimCfg = GetConfig()['Silent Aim'];
	local TriggerCfg = GetConfig()['Triggerbot'];
	local TrigKeybind = TriggerCfg['Bind'];
	local TrigMatch = MatchesTriggerBinding(Input, TrigKeybind);

	if TrigMatch then
		local BindType = Tostring(TrigKeybind['Type'] or 'Hold'):lower();
		if BindType == 'toggle' then
			State.TriggerState = not State.TriggerState;
		elseif BindType == 'hold' then
			State.TriggerState = true;
		end;
	end;

	if Processed then return end;
	if GetConfig()['Main']['Checks']['Silent Aim']['Typing'] and IsTyping() then return end;

	if SilentAimCfg['Enabled'] and GetConfig()['Main']['Silent Aim']['Selection'] == 'Target' then
		local TargetKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Target'];
		if TargetKey then
			local Match = false;
			Pcall(function()
				if Input.KeyCode == Enum.KeyCode[TargetKey:upper()] then Match = true end;
			end);
			if not Match then
				Pcall(function()
					if Input.UserInputType == Enum.UserInputType[TargetKey] then Match = true end;
				end);
			end;
			if Match then
				SilentTargetLocked = not SilentTargetLocked;
				if SilentTargetLocked then
					local OffCfg = GetConfig()['Silent Aim']['Offscreen Targeting'];
					State.Targets.Silent = GetClosestPlayerToCursor(GetConfig()['Silent Aim']['Max Range'], OffCfg and OffCfg['Enabled'], 'Targeting', 'Silent Aim');
				else
					State.Targets.Silent = nil;
				end;
			end;
		end;
	end;

	if TriggerCfg['Enabled'] and GetConfig()['Main']['Triggerbot']['Selection'] == 'Target' then
		local TargetKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Target'];
		if TargetKey then
			local Match = false;
			Pcall(function()
				if Input.KeyCode == Enum.KeyCode[TargetKey:upper()] then Match = true end;
			end);
			if not Match then
				Pcall(function()
					if Input.UserInputType == Enum.UserInputType[TargetKey] then Match = true end;
				end);
			end;
			if Match then
				TriggerTargetLocked = not TriggerTargetLocked;
				if TriggerTargetLocked then
					local OffCfg = GetConfig()['Triggerbot']['Offscreen Targeting'];
					State.Targets.Triggerbot = GetClosestPlayerToCursor(GetConfig()['Triggerbot']['Max Range'], OffCfg and OffCfg['Enabled'], 'Targeting', 'Triggerbot');
				else
					State.Targets.Triggerbot = nil;
				end;
			end;
		end;
	end;

	local AimbotKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Aimbot'];
	if AimbotKey then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[AimbotKey:upper()] then Match = true end;
		end);
		if not Match then
			Pcall(function()
				if Input.UserInputType == Enum.UserInputType[AimbotKey] then Match = true end;
			end);
		end;
		if Match then
			local AimbotCfg = GetConfig()['Aimbot'];
			local Mode = AimbotCfg['Mode'] or 'Toggle';
			if Mode == 'Hold' then
				AimbotTargetLocked = true;
				State.Targets.Aimbot = GetClosestPlayerToCursor(GetConfig()['Aimbot']['Max Range'], nil, 'Targeting', 'Aimbot');
			else
				AimbotTargetLocked = not AimbotTargetLocked;
				if AimbotTargetLocked then
					State.Targets.Aimbot = GetClosestPlayerToCursor(GetConfig()['Aimbot']['Max Range'], nil, 'Targeting', 'Aimbot');
				else
					State.Targets.Aimbot = nil;
				end;
			end;
		end;
	end;

	local WalkSpeedKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Walk Speed'];
	if WalkSpeedKey then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[WalkSpeedKey:upper()] then Match = true end;
		end);
		if Match then
			State.SpeedModificationsActive = not State.SpeedModificationsActive;
			if not State.SpeedModificationsActive then
				RestoreWalkSpeedState(State);
			end;
		end;
	end;

	local JumpToggleKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Jump Power'];
	if JumpToggleKey then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[JumpToggleKey:upper()] then Match = true end;
		end);
		if Match then
			State.JumpModificationsActive = not State.JumpModificationsActive;
		end;
	end;

	local DoubleTapCfg = GetConfig()['Modifications']['Double Tap'];
	local DoubleTapKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Double Tap'];
	if DoubleTapCfg['Enabled'] and DoubleTapCfg['Mode'] ~= 'Always' and DoubleTapKey then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[DoubleTapKey:upper()] then Match = true end;
		end);
		if Match then
			State.DoubleTapActive = not State.DoubleTapActive;
		end;
	end;

	local ESPToggleKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['ESP'];
	if ESPToggleKey then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[ESPToggleKey:upper()] then Match = true end;
		end);
		if Match then
			GetConfig()['Name ESP']['Enabled'] = not GetConfig()['Name ESP']['Enabled'];
		end;
	end;

	local SorterKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Sorter'];
	if SorterKey and GetConfig()['Utilities']['Inventory Sorter']['Enabled'] then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[SorterKey:upper()] then Match = true end;
		end);
		if Match then
			Spawn(function()
				State.SorterActive = true;
				local Character = LocalPlayer.Character;
				if not Character then
					State.SorterActive = false;
					return;
				end;
				local Backpack = LocalPlayer:FindFirstChildOfClass('Backpack');
				if not Backpack then
					State.SorterActive = false;
					return;
				end;
				local GunOrder = GetConfig()['Utilities']['Inventory Sorter']['Order'];
				local OrderV = 10 - #GunOrder;
				local FakeFolder = Instance.new('Folder');
				FakeFolder.Name = 'SorterTemp';
				FakeFolder.Parent = Workspace;
				for _, v in next, Backpack:GetChildren() do
					if v:IsA('Tool') then
						v.Parent = FakeFolder;
					end;
				end;
				for _, Name in next, GunOrder do
					local Gun = FakeFolder:FindFirstChild(Name);
					if Gun then
						Gun.Parent = Backpack;
						Wait(0.05);
					else
						OrderV = OrderV + 1;
					end;
				end;
				for _, v in next, FakeFolder:GetChildren() do
					if v:FindFirstChild('Drink') or v:FindFirstChild('Eat') then
						v.Parent = Backpack;
						OrderV = OrderV - 1;
					end;
				end;
				if OrderV > 0 then
					for _ = 1, OrderV do
						local PlaceHolder = Instance.new('Tool');
						PlaceHolder.Name = '';
						PlaceHolder.ToolTip = 'PlaceHolder';
						PlaceHolder.GripPos = Vector3New(0, 1, 0);
						PlaceHolder.RequiresHandle = false;
						PlaceHolder.Parent = Backpack;
					end;
				end;
				for _, v in next, FakeFolder:GetChildren() do
					if v:IsA('Tool') then
						v.Parent = Backpack;
					end;
				end;
				for _, v in next, Backpack:GetChildren() do
					if v.Name == '' then
						v:Destroy();
					end;
				end;
				FakeFolder:Destroy();
				Wait(0.5);
				State.SorterActive = false;
			end);
		end;
	end;

	if Input.KeyCode == Enum.KeyCode.LeftControl then
		State.CanTriggerbotShoot = false;
	end;

	local AntiFutureCfg = GetConfig()['Anti Future'];
	local AntiFutureKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Anti Future'];
	if AntiFutureKey and AntiFutureCfg['Enabled'] then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[AntiFutureKey:upper()] then Match = true end;
		end);
		if Match then
			RunAntiFutureToggle();
		end;
	end;

	local PanicGroundCfg = GetConfig()['Panic Ground'];
	local PanicGroundKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Panic Ground'];
	if PanicGroundKey and PanicGroundCfg and PanicGroundCfg['Enabled'] then
		local Match = false;
		Pcall(function()
			if Input.KeyCode == Enum.KeyCode[PanicGroundKey:upper()] then Match = true end;
		end);
		if Match then
			RunPanicGround();
		end;
	end;
end));

TrackConn(UserInputService.InputEnded:Connect(function(Input)
	local AimbotCfg = GetConfig()['Aimbot'];
	if AimbotCfg['Mode'] == 'Hold' then
		local AimbotKey = GetConfig()['Main']['Binds'] and GetConfig()['Main']['Binds']['Aimbot'];
		if AimbotKey then
			local Match = false;
			Pcall(function()
				if Input.KeyCode == Enum.KeyCode[AimbotKey:upper()] then Match = true end;
			end);
			if not Match then
				Pcall(function()
					if Input.UserInputType == Enum.UserInputType[AimbotKey] then Match = true end;
				end);
			end;
			if Match then
				AimbotTargetLocked = false;
				State.Targets.Aimbot = nil;
			end;
		end;
	end;

	local TriggerCfg = GetConfig()['Triggerbot'];
	local TrigKeybindRel = TriggerCfg['Bind'];
	if TrigKeybindRel and Tostring(TrigKeybindRel['Type'] or 'Hold'):lower() == 'hold' and MatchesTriggerBinding(Input, TrigKeybindRel) then
		State.TriggerState = false;
	end;

	if Input.KeyCode == Enum.KeyCode.LeftControl then
		State.CanTriggerbotShoot = true;
	end;
end));



TrackConn(RunService.Heartbeat:Connect(function()
	Config = shared.Cider or Config;
	UpdatePositionCache();
	CachedIgnored = Workspace:FindFirstChild('Ignored');
	CachedBush = Workspace:FindFirstChild('Bush');
end));

TrackConn(RunService.Heartbeat:Connect(function()
	local PanicGroundCfg = GetConfig()['Panic Ground'];
	local AutoCfg = PanicGroundCfg and PanicGroundCfg['Auto'];
	if not PanicGroundCfg or not PanicGroundCfg['Enabled'] or not AutoCfg or not AutoCfg['Enabled'] then
		State.PanicGround.AutoTriggered = false;
		return;
	end;

	local Character = LocalPlayer.Character;
	local Humanoid = Character and Character:FindFirstChildOfClass('Humanoid');
	if not Humanoid or Humanoid.Health <= 0 then
		State.PanicGround.AutoTriggered = false;
		return;
	end;

	local Threshold = AutoCfg['Health Amount'] or 25;
	if Humanoid.Health <= Threshold then
		if not State.PanicGround.AutoTriggered then
			State.PanicGround.AutoTriggered = true;
			RunPanicGround();
		end;
	else
		State.PanicGround.AutoTriggered = false;
	end;
end));

TrackConn(RunService.PreRender:Connect(function()
	local SilentAimCfg = GetConfig()['Silent Aim'];
	local TriggerCfg = GetConfig()['Triggerbot'];
	local AimbotCfg = GetConfig()['Aimbot'];
	local CurrentCamera = Workspace.CurrentCamera;
	local ViewportY = CurrentCamera.ViewportSize.Y;
	local CamFOV = CurrentCamera.FieldOfView;
	local MousePosition = GetCursorViewportPosition();

	local SilentOffscreen = SilentAimCfg['Offscreen Targeting'] and SilentAimCfg['Offscreen Targeting']['Enabled'];
	local TriggerOffscreen = TriggerCfg['Offscreen Targeting'] and TriggerCfg['Offscreen Targeting']['Enabled'];

	local ClosestPlayer = GetClosestPlayerToCursor(nil, nil, 'Automatic');

	if SilentAimCfg['Enabled'] and GetConfig()['Main']['Silent Aim']['Selection'] == 'Automatic' then
		State.Targets.Silent = GetClosestPlayerToCursor(SilentAimCfg['Max Range'], SilentOffscreen, 'Automatic', 'Silent Aim');
	end;

	if TriggerCfg['Enabled'] and GetConfig()['Main']['Triggerbot']['Selection'] == 'Automatic' then
		State.Targets.Triggerbot = GetClosestPlayerToCursor(TriggerCfg['Max Range'], TriggerOffscreen, 'Automatic', 'Triggerbot');
	end;

	local SilentTarget = State.Targets.Silent;
	local SilentDisplay = SilentTarget;
	local SilentFOVCfg = GetConfig()['Main']['FOV']['Silent'];
	local SilentUses3DFOV = string.lower(tostring(SilentFOVCfg['Options'] or '2D')) == '3d';
	Update3DFOVBox(Silent3DFOVBox, SilentFOVCfg, SilentFOVCfg['Visualize']['Color'] or SilentFOVOutColor);
	if not SilentDisplay and SilentFOVCfg['Visualize']['Enabled'] then
		SilentDisplay = ClosestPlayer;
	end;
	local ViewportX = CurrentCamera.ViewportSize.X;
	if not SilentUses3DFOV and SilentFOVCfg['Visualize']['Enabled'] and SilentDisplay then
		local Char = SilentDisplay.Character;
		local Root = Char and Char:FindFirstChild('HumanoidRootPart');
		if Root and IsVisible(Root.Position, SilentDisplay) then
			local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(Root.Position);
			if OnScreen and ScreenPos.Z > 1 then
				local ScaleFactor = (Root.Size.Y * ViewportY) / (ScreenPos.Z * 2) * 80 / CamFOV;
				local IsCircle = false;
				local FovSize = SilentFOVCfg;
				local W, H;
				if IsCircle then
					local R = MathMin(5 * ScaleFactor, ViewportX * 2);
					W = R; H = R;
				else
					local WidthVal = FovSize['Width'] and (FovSize['Width'][1] or 150) or 150;
					local HeightVal = FovSize['Height'] and (FovSize['Height'][1] or 150) or 150;
					W = MathMin(WidthVal * ScaleFactor, ViewportX * 2);
					H = MathMin(HeightVal * ScaleFactor, ViewportY * 2);
				end;

				SilentFOVBox.Round = IsCircle;
				SilentFOVBox.Size = Vector2New(MathFloor(W + 0.5), MathFloor(H + 0.5));
				SilentFOVBox.Position = Vector2New(MathFloor(ScreenPos.X - W / 2 + 0.5), MathFloor(ScreenPos.Y - H / 2 + 0.5));

				local Delta = Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition;
				local InBox;
				if IsCircle then
					InBox = (Delta.X * Delta.X + Delta.Y * Delta.Y) <= (W / 2) * (W / 2);
				else
					InBox = MathAbs(Delta.X) <= W / 2 and MathAbs(Delta.Y) <= H / 2;
				end;
				SilentFOVBox.Color = InBox and SilentFOVInColor or SilentFOVOutColor;
				SilentFOVBox.Visible = SilentFOVCfg['Visualize']['Enabled'];
			else
				SilentFOVBox.Visible = false;
			end;
		else
			SilentFOVBox.Visible = false;
		end;
	else
		SilentFOVBox.Visible = false;
	end;

	local LineCfg = SilentAimCfg['Target Tracer'];
	local OffSilentCfg = SilentAimCfg['Offscreen Targeting'];
	local SilentAllowOffscreen = OffSilentCfg and OffSilentCfg['Enabled'];
	if LineCfg and LineCfg['Enabled'] and SilentTarget then
		local Char = SilentTarget.Character;
		local Root = Char and Char:FindFirstChild('Head');
		if Root then
			local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(Root.Position);
			local Thickness = LineCfg['Thickness'] or 0.5;
			if OnScreen and ScreenPos.Z > 0 then
				SilentTargetLine.From = Vector2New(MousePosition.X, MousePosition.Y);
				SilentTargetLine.To = Vector2New(ScreenPos.X, ScreenPos.Y);
				SilentTargetLine.Color = LineCfg['Color'] or Color3.fromRGB(255, 255, 255);
				SilentTargetLine.Thickness = Thickness;
				SilentTargetLine.Visible = true;
				OffscreenSilentLine.Visible = false;
			elseif SilentAllowOffscreen then
				local HRP = Char:FindFirstChild('HumanoidRootPart') or Root;
				local Dir = (HRP.Position - CurrentCamera.CFrame.Position).Unit;
				local CamRight = CurrentCamera.CFrame.RightVector;
				local CamUp = CurrentCamera.CFrame.UpVector;
				local RightDot = Dir:Dot(CamRight);
				local UpDot = Dir:Dot(CamUp);
				local EdgeDir = Vector2New(RightDot, -UpDot).Unit;
				local HalfW = ViewportX / 2 - 10;
				local HalfH = ViewportY / 2 - 10;
				local Scale = MathMin(HalfW / MathAbs(EdgeDir.X + 0.0001), HalfH / MathAbs(EdgeDir.Y + 0.0001));
				local EdgePoint = Vector2New(ViewportX / 2, ViewportY / 2) + EdgeDir * Scale;
				SilentTargetLine.Visible = false;
				OffscreenSilentLine.From = MousePosition;
				OffscreenSilentLine.To = EdgePoint;
				OffscreenSilentLine.Color = LineCfg['Color'] or Color3.fromRGB(255, 255, 255);
				OffscreenSilentLine.Thickness = Thickness;
				OffscreenSilentLine.Visible = true;
			else
				SilentTargetLine.Visible = false;
				OffscreenSilentLine.Visible = false;
			end;
		else
			SilentTargetLine.Visible = false;
			OffscreenSilentLine.Visible = false;
		end;
	else
		SilentTargetLine.Visible = false;
		OffscreenSilentLine.Visible = false;
	end;

	local TrigTarget = State.Targets.Triggerbot;
	local TrigDisplay = TrigTarget;
	local TriggerFOVCfg = GetConfig()['Main']['FOV']['Triggerbot'];
	local TriggerUses3DFOV = string.lower(tostring(TriggerFOVCfg['Options'] or '2D')) == '3d';
	Update3DFOVBox(Trigger3DFOVBox, TriggerFOVCfg, TriggerFOVCfg['Visualize']['Color'] or TriggerFOVOutColor);
	if not TrigDisplay and TriggerFOVCfg['Visualize']['Enabled'] then
		TrigDisplay = ClosestPlayer;
	end;
	if not TriggerUses3DFOV and TriggerFOVCfg['Visualize']['Enabled'] and TrigDisplay then
		local Char = TrigDisplay.Character;
		local Root = Char and Char:FindFirstChild('HumanoidRootPart');
		if Root and IsVisible(Root.Position, TrigDisplay) then
			local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(Root.Position);
			if OnScreen and ScreenPos.Z > 1 then
				local ScaleFactor = (Root.Size.Y * ViewportY) / (ScreenPos.Z * 2) * 80 / CamFOV;
				local IsCircle = false;
				local FovSize = TriggerFOVCfg;
				local W, H;
				if IsCircle then
					local R = MathMin(9e9 * ScaleFactor, ViewportX * 2);
					W = R; H = R;
				else
					local WidthVal = FovSize['Width'] and (FovSize['Width'][1] or 9e9) or 9e9;
					local HeightVal = FovSize['Height'] and (FovSize['Height'][1] or 9e9) or 9e9;
					W = MathMin(WidthVal * ScaleFactor, ViewportX * 2);
					H = MathMin(HeightVal * ScaleFactor, ViewportY * 2);
				end;

				TriggerFOVBox.Round = IsCircle;
				TriggerFOVBox.Size = Vector2New(MathFloor(W + 0.5), MathFloor(H + 0.5));
				TriggerFOVBox.Position = Vector2New(MathFloor(ScreenPos.X - W / 2 + 0.5), MathFloor(ScreenPos.Y - H / 2 + 0.5));

				local Delta = Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition;
				local InBox;
				if IsCircle then
					InBox = (Delta.X * Delta.X + Delta.Y * Delta.Y) <= (W / 2) * (W / 2);
				else
					InBox = MathAbs(Delta.X) <= W / 2 and MathAbs(Delta.Y) <= H / 2;
				end;
				TriggerFOVBox.Color = InBox and TriggerFOVInColor or TriggerFOVOutColor;
				TriggerFOVBox.Visible = TriggerFOVCfg['Visualize']['Enabled'];
			else
				TriggerFOVBox.Visible = false;
			end;
		else
			TriggerFOVBox.Visible = false;
		end;
	else
		TriggerFOVBox.Visible = false;
	end;

	local AimbotTarget = State.Targets.Aimbot;
	local AimbotDisplay = AimbotTarget;
	local AimbotFOVCfg = GetConfig()['Main']['FOV']['Aimbot'];
	local AimbotUses3DFOV = string.lower(tostring(AimbotFOVCfg['Options'] or '2D')) == '3d';
	Update3DFOVBox(Aimbot3DFOVBox, AimbotFOVCfg, AimbotFOVCfg['Visualize']['Color'] or AimbotFOVOutColor);
	if not AimbotDisplay and AimbotFOVCfg['Visualize']['Enabled'] then
		AimbotDisplay = ClosestPlayer;
	end;
	if not AimbotUses3DFOV and AimbotFOVCfg['Visualize']['Enabled'] and AimbotDisplay then
		local Char = AimbotDisplay.Character;
		local Root = Char and Char:FindFirstChild('HumanoidRootPart');
		if Root and IsVisible(Root.Position, AimbotDisplay) then
			local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(Root.Position);
			if OnScreen and ScreenPos.Z > 1 then
				local ScaleFactor = (Root.Size.Y * ViewportY) / (ScreenPos.Z * 2) * 80 / CamFOV;
				local IsCircle = false;
				local FovSize = AimbotFOVCfg;
				local W, H;
				if IsCircle then
					local R = MathMin(9e9 * ScaleFactor, ViewportX * 2);
					W = R; H = R;
				else
					local WidthVal = FovSize['Width'] and (FovSize['Width'][1] or 9e9) or 9e9;
					local HeightVal = FovSize['Height'] and (FovSize['Height'][1] or 9e9) or 9e9;
					W = MathMin(WidthVal * ScaleFactor, ViewportX * 2);
					H = MathMin(HeightVal * ScaleFactor, ViewportY * 2);
				end;

				AimbotFOVBox.Round = IsCircle;
				AimbotFOVBox.Size = Vector2New(MathFloor(W + 0.5), MathFloor(H + 0.5));
				AimbotFOVBox.Position = Vector2New(MathFloor(ScreenPos.X - W / 2 + 0.5), MathFloor(ScreenPos.Y - H / 2 + 0.5));

				local Delta = Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition;
				local InBox;
				if IsCircle then
					InBox = (Delta.X * Delta.X + Delta.Y * Delta.Y) <= (W / 2) * (W / 2);
				else
					InBox = MathAbs(Delta.X) <= W / 2 and MathAbs(Delta.Y) <= H / 2;
				end;
				AimbotFOVBox.Color = InBox and AimbotFOVInColor or AimbotFOVOutColor;
				AimbotFOVBox.Visible = AimbotFOVCfg['Visualize']['Enabled'];
			else
				AimbotFOVBox.Visible = false;
			end;
		else
			AimbotFOVBox.Visible = false;
		end;
	else
		AimbotFOVBox.Visible = false;
	end;

	local ESPCfg = GetConfig()['Name ESP'];
	if ESPCfg['Enabled'] then
		local ESPColor = ESPCfg['Color'] or Color3.fromRGB(180, 180, 180);
		local ESPTargetColor = ESPCfg['Target Color'] or Color3.fromRGB(100, 180, 255);
		local ESPSize = ESPCfg['Text Size'] or 13;
		local SuppressTriggerHighlight = SilentAimCfg['Enabled'] and GetConfig()['Main']['Silent Aim']['Selection'] == 'Target';
		for _, Player in next, Players:GetPlayers() do
			if Player == LocalPlayer then continue end;
			local Character = Player.Character;
			if not Character then
				if NameESPDrawings[Player] then NameESPDrawings[Player].Visible = false end;
				continue;
			end;
			local HumanoidRootPart = Character:FindFirstChild('HumanoidRootPart');
			if not HumanoidRootPart then
				if NameESPDrawings[Player] then NameESPDrawings[Player].Visible = false end;
				continue;
			end;



			local ESPPos = HumanoidRootPart.Position - Vector3New(0, 3, 0);
			local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(ESPPos);
			if not OnScreen then
				if NameESPDrawings[Player] then NameESPDrawings[Player].Visible = false end;
				continue;
			end;
			if not NameESPDrawings[Player] then
				local Draw = CreateTextLabel();
				Draw.Outline = true;
				Draw.Center = true;
				NameESPDrawings[Player] = Draw;
			end;
			local Draw = NameESPDrawings[Player];
			local IsTarget = (Player == State.Targets.Silent or Player == State.Targets.Aimbot or (not SuppressTriggerHighlight and Player == State.Targets.Triggerbot));
			Draw.Text = Player.DisplayName;
			Draw.Size = ESPSize;
			Draw.Color = IsTarget and ESPTargetColor or ESPColor;
			Draw.Position = Vector2New(MathFloor(ScreenPos.X + 0.5), MathFloor(ScreenPos.Y + 0.5));
			Draw.Visible = true;
		end;
	else
		for _, Draw in next, NameESPDrawings do
			Draw.Visible = false;
		end;
	end;

	local HBCfg = GetConfig()['Health Bar'];
	if HBCfg and HBCfg['Enabled'] then
		local HBPos = HBCfg['Position'] or 'Bottom';
		local ShowArmor = HBCfg['Show Armor'];
		local HealthColor = HBCfg['Health Color'] or Color3.fromRGB(85, 255, 255);
		local ArmorColor = HBCfg['Armor Color'] or Color3.fromRGB(120, 185, 255);

		local TargetPlayer = State.Targets.Silent or State.Targets.Aimbot or State.Targets.Triggerbot;

		for Player, Set in next, HealthBarDrawings do
			if Player ~= TargetPlayer then
				HideHealthBarSet(Set);
			end;
		end;

		local Character = TargetPlayer and TargetPlayer.Character;
		local HumanoidRootPart = Character and Character:FindFirstChild('HumanoidRootPart');
		local Humanoid = Character and Character:FindFirstChildOfClass('Humanoid');

		if TargetPlayer and HumanoidRootPart and Humanoid then
			local TopScreen, TopOn = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position + Vector3New(0, 3, 0));
			local BottomScreen, BottomOn = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position - Vector3New(0, 3.5, 0));

			if TopOn or BottomOn then
				if not HealthBarDrawings[TargetPlayer] then
					local Set = {};
					for _, Key in next, {'HealthBack', 'HealthFill', 'ArmorBack', 'ArmorFill'} do
						local Sq = CreateSquare();
						Sq.Filled = true;
						Sq.Visible = false;
						Set[Key] = Sq;
					end;
					HealthBarDrawings[TargetPlayer] = Set;
				end;
				local Set = HealthBarDrawings[TargetPlayer];

				local HealthValue, MaxHealth, ArmorVal, IsDead = GetStableHealthBarValues(TargetPlayer, Humanoid);
				local HealthFrac = MathClamp(HealthValue / MaxHealth, 0, 1);
				local ArmorFrac = MathClamp(ArmorVal / 100, 0, 1);
				local DrawArmor = ShowArmor and ArmorVal > 0;

				Set.HealthBack.Color = Color3.fromRGB(8, 8, 12);
				Set.HealthFill.Color = HealthColor;
				Set.ArmorBack.Color = Color3.fromRGB(8, 8, 12);
				Set.ArmorFill.Color = ArmorColor;

				local CenterX = (TopScreen.X + BottomScreen.X) / 2;
				local BarLen = 66;
				local TrackHeight = 2;
				local Border = 1;
				local Gap = 1;
				local ESPCfgHB = GetConfig()['Name ESP'];
				local ESPTextSize = ESPCfgHB['Text Size'] or 13;
				local TrackWidth = BarLen + Border * 2;
				local TrackX = MathFloor(CenterX - TrackWidth / 2 + 0.5);
				local FeetY = MathMax(TopScreen.Y, BottomScreen.Y);
				local TrackY;
				if HBPos == 'Top' then
					TrackY = MathFloor(MathMin(TopScreen.Y, BottomScreen.Y) - (TrackHeight + Border * 2) - 4 + 0.5);
				elseif ESPCfgHB['Enabled'] then
					local NameDraw = NameESPDrawings[TargetPlayer];
					local NameY = NameDraw and NameDraw.Position.Y or FeetY;
					local NameHeight = NameDraw and NameDraw.TextBounds.Y or ESPTextSize;
					TrackY = MathFloor(NameY + MathMax(NameHeight, ESPTextSize) + 2 + 0.5);
				else
					TrackY = MathFloor(FeetY + 3 + 0.5);
				end;

				local HealthBackY = TrackY;
				local HealthFillY = HealthBackY + Border;
				local ArmorBackY = HealthBackY + TrackHeight + Border * 2 + Gap;
				local ArmorFillY = ArmorBackY + Border;

				Set.HealthBack.Size = Vector2New(TrackWidth, TrackHeight + Border * 2);
				Set.HealthBack.Position = Vector2New(TrackX, HealthBackY);
				Set.HealthFill.Size = Vector2New(MathFloor(BarLen * HealthFrac + 0.5), TrackHeight);
				Set.HealthFill.Position = Vector2New(TrackX + Border, HealthFillY);

				Set.ArmorBack.Size = Vector2New(TrackWidth, TrackHeight + Border * 2);
				Set.ArmorBack.Position = Vector2New(TrackX, ArmorBackY);
				Set.ArmorFill.Size = Vector2New(MathFloor(BarLen * ArmorFrac + 0.5), TrackHeight);
				Set.ArmorFill.Position = Vector2New(TrackX + Border, ArmorFillY);

				local ShowHealth = HealthFrac > 0 and not IsDead;
				Set.HealthBack.Visible = ShowHealth;
				Set.HealthFill.Visible = ShowHealth;
				Set.ArmorBack.Visible = DrawArmor and not IsDead;
				Set.ArmorFill.Visible = DrawArmor and ArmorFrac > 0 and not IsDead;
			else
				HideHealthBarSet(HealthBarDrawings[TargetPlayer]);
			end;
		end;
	else
		for _, Set in next, HealthBarDrawings do
			HideHealthBarSet(Set);
		end;
	end;

	local PanelCfg = GetConfig()['Main']['Brand'];
	if PanelCfg['Enabled'] then
		local PColors = PanelCfg;
		local AccentColor = PanelCfg['Accent'] or Color3.fromRGB(100, 180, 255);
		local ViewportSize = CurrentCamera.ViewportSize;
		local VW, VH = ViewportSize.X, ViewportSize.Y;

		local Scale = MathClamp(MathMin(VW / 1920, VH / 1080), 0.55, 1.35);

		local TitleSize = MathFloor(15 * Scale + 0.5);
		local LabelSize = MathFloor(12 * Scale + 0.5);
		local LineH = MathFloor(14 * Scale + 0.5);
		local TitleGap = MathFloor(18 * Scale + 0.5);

		local ActiveLabels = 0;
		if SilentAimCfg['Enabled'] and State.Toggles.SilentAim and State.Targets.Silent then
			ActiveLabels = ActiveLabels + 1;
			if State.Targets.Silent and State.Targets.Silent.Character then
				ActiveLabels = ActiveLabels + 1;
			end;
		end;
		if AimbotCfg['Enabled'] and AimbotTargetLocked then ActiveLabels = ActiveLabels + 1 end;
		if TriggerCfg['Enabled'] and State.TriggerState and State.Targets.Triggerbot then ActiveLabels = ActiveLabels + 1 end;
		if SilentAimCfg['Enabled'] and State.Targets.Silent and SilentAimCfg['Auto Shoot'] and SilentAimCfg['Auto Shoot']['Enabled'] then ActiveLabels = ActiveLabels + 1 end;
		if GetConfig()['Movement']['Speed Modifications']['Enabled'] and State.SpeedModificationsActive then ActiveLabels = ActiveLabels + 1 end;
		if State.SorterActive then ActiveLabels = ActiveLabels + 1 end;
		if GetConfig()['Modifications']['Double Tap']['Enabled'] and (GetConfig()['Modifications']['Double Tap']['Mode'] == 'Always' or State.DoubleTapActive) then ActiveLabels = ActiveLabels + 1 end;
		if GetConfig()['Anti Future']['Enabled'] and State.AntiFuture.Active then ActiveLabels = ActiveLabels + 1 end;
		if GetConfig()['Movement']['Jump Modifications']['Enabled'] and State.JumpModificationsActive then ActiveLabels = ActiveLabels + 1 end;
		local TotalH = TitleGap + ActiveLabels * LineH;

		local HealthCenterX, HealthTopY = GetBrandHealthBarAnchor(ViewportSize);
		local BaseX = HealthCenterX;
		local BaseY = HealthTopY - TotalH - MathFloor(7 * Scale + 0.5);

		local HalfTitleW = MathFloor(PanelTitle.TextBounds.X / 2 + 0.5);
		local MinX = HalfTitleW + 4;
		local MaxX = VW - HalfTitleW - 4;
		BaseX = MathClamp(MathFloor(BaseX + 0.5), MinX, MaxX);
		BaseY = MathClamp(MathFloor(BaseY + 0.5), 6, VH - TotalH - 6);

		PanelTitle.Size = TitleSize;
		for i = 1, #PanelLabels do
			PanelLabels[i].Size = LabelSize;
		end;

		PanelTitle.Text = string.format('<font color="rgb(255, 255, 255)">cider</font><font color="rgb(%d, %d, %d)">.wtf</font>', MathFloor(AccentColor.R * 255 + 0.5), MathFloor(AccentColor.G * 255 + 0.5), MathFloor(AccentColor.B * 255 + 0.5));
		PanelTitle.Position = Vector2New(BaseX, BaseY);
		PanelTitle.Visible = true;

		local OffsetY = BaseY + TitleGap;
		local LabelIdx = 0;

		if SilentAimCfg['Enabled'] and State.Toggles.SilentAim and State.Targets.Silent then
			local STarget = State.Targets.Silent;
			local FC = PColors['Feature'];

			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local TName = STarget and STarget.DisplayName or 'none';
				local TC = STarget and AccentColor or PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">silent aim</font> <font color="rgb(%d, %d, %d)">&gt; %s</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), MathFloor(TC.R * 255 + 0.5), MathFloor(TC.G * 255 + 0.5), MathFloor(TC.B * 255 + 0.5), TName);
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;

			if STarget and STarget.Character then
				LabelIdx = LabelIdx + 1;
				local HL = PanelLabels[LabelIdx];
				if HL then
					local HP, Armor = 0, 0;
					local Hum = STarget.Character:FindFirstChildOfClass('Humanoid');
					if Hum then HP = MathFloor(Hum.Health + 0.5) end;
					local BE = STarget.Character:FindFirstChild('BodyEffects');
					if BE then
						local AV = BE:FindFirstChild('Armor') or BE:FindFirstChild('Armour') or BE:FindFirstChild('Defense');
						if AV and AV.Value and AV.Value > 0 then Armor = MathFloor(AV.Value + 0.5) end;
					end;
					if Armor == 0 and STarget then
						local LS = STarget:FindFirstChild('leaderstats');
						if LS then
							local AV = LS:FindFirstChild('Armor') or LS:FindFirstChild('Armour') or LS:FindFirstChild('Defense') or LS:FindFirstChild('Vest');
							if AV and AV.Value then Armor = MathFloor(AV.Value + 0.5) end;
						end;
					end;
					local HealthStr = string.format('<font color="rgb(%d, %d, %d)">health</font> <font color="rgb(85, 255, 85)">&gt; %d</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), HP);
					if Armor > 0 then
						HealthStr = HealthStr .. string.format(' / <font color="rgb(85, 170, 255)">%d</font>', Armor);
					end;
					HL.Text = HealthStr;
					HL.Color = Color3.new(1, 1, 1);
					HL.Position = Vector2New(BaseX, OffsetY);
					HL.Visible = true;
					OffsetY = OffsetY + LineH;
				end;
			end;
		end;

		if AimbotCfg['Enabled'] and AimbotTargetLocked then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local ATarget = State.Targets.Aimbot;
				local TName = ATarget and ATarget.DisplayName or 'none';
				local FC = PColors['Feature'];
				local TC = ATarget and AccentColor or PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">aimbot</font> <font color="rgb(%d, %d, %d)">&gt; %s</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), MathFloor(TC.R * 255 + 0.5), MathFloor(TC.G * 255 + 0.5), MathFloor(TC.B * 255 + 0.5), TName);
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;

		if TriggerCfg['Enabled'] and State.TriggerState and State.Targets.Triggerbot then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local TTarget = State.Targets.Triggerbot;
				local TName = TTarget and TTarget.DisplayName or 'none';
				local FC = PColors['Feature'];
				local TC = TTarget and AccentColor or PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">triggerbot</font> <font color="rgb(%d, %d, %d)">&gt; %s</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), MathFloor(TC.R * 255 + 0.5), MathFloor(TC.G * 255 + 0.5), MathFloor(TC.B * 255 + 0.5), TName);
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;

		if SilentAimCfg['Enabled'] and State.Targets.Silent and SilentAimCfg['Auto Shoot'] and SilentAimCfg['Auto Shoot']['Enabled'] then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local FC = PColors['Feature'];
				local Status = State.AutoShootStatus or 'idle';
				local SC = AccentColor;
				local StatusLower = string.lower(Status);
				L.Text = string.format('<font color="rgb(%d, %d, %d)">auto shoot</font> <font color="rgb(%d, %d, %d)">&gt; %s</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), MathFloor(SC.R * 255 + 0.5), MathFloor(SC.G * 255 + 0.5), MathFloor(SC.B * 255 + 0.5), StatusLower);
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;

		if GetConfig()['Movement']['Speed Modifications']['Enabled'] and State.SpeedModificationsActive then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local FC = PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">speed</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5));
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;


		if State.SorterActive then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local FC = PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">sorter</font> <font color="rgb(%d, %d, %d)">&gt; active</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), MathFloor(AccentColor.R * 255 + 0.5), MathFloor(AccentColor.G * 255 + 0.5), MathFloor(AccentColor.B * 255 + 0.5));
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;

		if GetConfig()['Modifications']['Double Tap']['Enabled'] and (GetConfig()['Modifications']['Double Tap']['Mode'] == 'Always' or State.DoubleTapActive) then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local FC = PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">double tap</font> <font color="rgb(%d, %d, %d)">&gt; active</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5), MathFloor(AccentColor.R * 255 + 0.5), MathFloor(AccentColor.G * 255 + 0.5), MathFloor(AccentColor.B * 255 + 0.5));
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;

		if GetConfig()['Anti Future']['Enabled'] and State.AntiFuture.Active then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local FC = PColors['Feature'];
				local TC = AccentColor;
				local AntiFutureCfg = GetConfig()['Anti Future'];
				local AntiFutureOptions = AntiFutureCfg['Options'] or {};
				local str = AntiFutureOptions['Strength'] or 400;
				local airOnly = AntiFutureOptions['Air Only'] and ' (air)' or '';
				L.Text = string.format(
					'<font color="rgb(%d, %d, %d)">anti future</font> <font color="rgb(%d, %d, %d)">&gt; %d%s</font>',
					MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5),
					MathFloor(TC.R * 255 + 0.5), MathFloor(TC.G * 255 + 0.5), MathFloor(TC.B * 255 + 0.5),
					str, airOnly
				);
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;



		if GetConfig()['Movement']['Jump Modifications']['Enabled'] and State.JumpModificationsActive then
			LabelIdx = LabelIdx + 1;
			local L = PanelLabels[LabelIdx];
			if L then
				local FC = PColors['Feature'];
				L.Text = string.format('<font color="rgb(%d, %d, %d)">jump</font>', MathFloor(FC.R * 255 + 0.5), MathFloor(FC.G * 255 + 0.5), MathFloor(FC.B * 255 + 0.5));
				L.Color = Color3.new(1, 1, 1);
				L.Position = Vector2New(BaseX, OffsetY);
				L.Visible = true;
				OffsetY = OffsetY + LineH;
			end;
		end;

		for i = LabelIdx + 1, #PanelLabels do
			PanelLabels[i].Visible = false;
		end;
	else
		PanelTitle.Visible = false;
		for _, L in next, PanelLabels do L.Visible = false end;
	end;

	do
		local AntiFutureCfg = GetConfig()['Anti Future'];
		local afActive = State.AntiFuture.Active;
		local afVis = AntiFutureCfg['Visualize Server'];
		local basePos = State.AntiFuture.LastServerPosition;
		local spoofVel = State.AntiFuture.LastSpoofedVelocity;
		local spoofTime = State.AntiFuture.LastSpoofTime;
		local showDot = afActive and afVis and basePos ~= nil;

		if showDot then
			local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart');

			local ghostPos;
			if spoofVel ~= nil and spoofTime ~= nil then
				local dt = MathClamp(Clock() - spoofTime, 0, 0.05);
				ghostPos = basePos + spoofVel * dt;
			else
				ghostPos = basePos;
			end;

			local screenPos, onScreen = CurrentCamera:WorldToViewportPoint(ghostPos);

			if onScreen and screenPos.Z > 0.5 then
				local sx, sy = screenPos.X, screenPos.Y;
				local dist = hrp and MathFloor((ghostPos - hrp.Position).Magnitude + 0.5) or 0;

				local dotSize = 8;
				AntiFutureVisDot.Size = Vector2New(dotSize, dotSize);
				AntiFutureVisDot.Position = Vector2New(sx - dotSize / 2, sy - dotSize / 2);
				AntiFutureVisDot.Color = Color3.fromRGB(255, 80, 80);
				AntiFutureVisDot.Visible = true;

				AntiFutureVisLabel.Text = string.format(
					'<font color="rgb(255,80,80)">server</font> <font color="rgb(150,150,150)">%d studs</font>',
					dist
				);
				AntiFutureVisLabel.Position = Vector2New(sx, sy + dotSize + 6);
				AntiFutureVisLabel.Visible = true;
			else
				AntiFutureVisDot.Visible = false;
				AntiFutureVisLabel.Visible = false;
			end;
		else
			AntiFutureVisDot.Visible = false;
			AntiFutureVisLabel.Visible = false;
		end;
	end;

	RunTriggerbot();

	if AimbotCfg['Enabled'] and AimbotTarget and PassesConditions(AimbotTarget, 'Aimbot') then
		local TargetChar = AimbotTarget.Character;
		if TargetChar then
			local HumanoidRootPart = TargetChar:FindFirstChild('HumanoidRootPart');
			if HumanoidRootPart then
				local Distance = (HumanoidRootPart.Position - CurrentCamera.CFrame.Position).Magnitude;
				if Distance <= (AimbotCfg['Max Range'] or 750) and IsInside3DFOV(HumanoidRootPart.Position, 'Aimbot') then
					local TargetPos, _ = ResolveHitPosition(TargetChar, AimbotCfg);
					if not TargetPos then TargetPos = HumanoidRootPart.Position end;
					TargetPos = ApplyPrediction(TargetPos, AimbotTarget, AimbotCfg);

					local CamPos = CurrentCamera.CFrame.Position;
					local DesiredCFrame = CFrameNew(CamPos, TargetPos);

					local SmoothCfg = AimbotCfg['Smoothing'];
					if SmoothCfg and SmoothCfg['Enabled'] then
						local AlphaX = SmoothCfg['X'] or 0.09;
						local AlphaY = SmoothCfg['Y'] or 0.09;
						local AlphaZ = SmoothCfg['Z'] or 0.09;

						local EasingCfg = SmoothCfg['Easing'];
						local EasingStyle = EasingCfg and Enum.EasingStyle[EasingCfg['In'] or 'Linear'] or Enum.EasingStyle.Linear;
						local EasingDir = EasingCfg and Enum.EasingDirection[EasingCfg['Out'] or 'InOut'] or Enum.EasingDirection.InOut;

						local CurDir = CurrentCamera.CFrame.LookVector;
						local TgtDir = (DesiredCFrame.LookVector);
						local SmoothedDir = Vector3New(
							CurDir.X + (TgtDir.X - CurDir.X) * TweenService:GetValue(AlphaX, EasingStyle, EasingDir),
							CurDir.Y + (TgtDir.Y - CurDir.Y) * TweenService:GetValue(AlphaY, EasingStyle, EasingDir),
							CurDir.Z + (TgtDir.Z - CurDir.Z) * TweenService:GetValue(AlphaZ, EasingStyle, EasingDir)
						);
						CurrentCamera.CFrame = CFrameNew(CamPos, CamPos + SmoothedDir);
					else
						CurrentCamera.CFrame = DesiredCFrame;
					end;
				end;
			end;
		end;
	end;
end));

RageFire = function(Child, Handle, ToolName, Origin, Direction, GunRange, SpreadCfg)
	if ShotgunWeapons[ToolName] then
		local ServerTime = Workspace:GetServerTimeNow();
		local SpreadMult = 1;
		if SpreadCfg then
			SpreadMult = SpreadCfg['Value'] or 1;
			local Rand = SpreadCfg['Randomizer'];
			if Rand and Rand['Enabled'] then
				local Min = Rand['Min'] or 1;
				local Max = Rand['Max'] or 1;
				local Alpha = MathRandom();
				SpreadMult = SpreadMult * (Min + (Max - Min) * Alpha);
			end;
		end;
		for PelletIndex = 1, 5 do
			local SpreadX = (MathRandom() > 0.5 and MathRandom() * 0.05 or -MathRandom() * 0.05) * SpreadMult;
			local SpreadY = (MathRandom() > 0.5 and MathRandom() * 0.1 or -MathRandom() * 0.1) * SpreadMult;
			local SpreadZ = (MathRandom() > 0.5 and MathRandom() * 0.05 or -MathRandom() * 0.05) * SpreadMult;
			local AimDir = Direction + Vector3New(SpreadX, SpreadY, SpreadZ);
			local AimPosition = Origin + AimDir * GunRange;
			local HitPosition, HitInstance, HitNormal = ShowPellet(LocalPlayer.Character, Handle, Origin, AimPosition, GunRange);
			HitPosition, HitInstance, HitNormal = ApplyDamageModifierHit(ToolName, HitPosition, HitInstance, HitNormal);
			CachedMainEvent:FireServer('ShootGun', Handle, Origin, HitPosition, HitInstance, HitNormal, ServerTime);
		end;
	else
		local AimPosition = Origin + Direction * GunRange;
		local HitPosition, HitInstance, HitNormal = ShowPellet(LocalPlayer.Character, Handle, Origin, AimPosition, GunRange);
		HitPosition, HitInstance, HitNormal = ApplyDamageModifierHit(ToolName, HitPosition, HitInstance, HitNormal);
		CachedMainEvent:FireServer('ShootGun', Handle, Origin, HitPosition, HitInstance, HitNormal);
	end;
end;

local RageCore = function()
	local SilentAimCfg = GetConfig()['Silent Aim'];
	local RageCfg = SilentAimCfg['Auto Shoot'];
	if not RageCfg or not RageCfg['Enabled'] or not SilentAimCfg['Enabled'] then
		State.AutoShootStatus = 'Disabled';
		return;
	end;

	local Target = State.Targets.Silent;
	if not Target then
		State.AutoShootStatus = 'No Target';
		return;
	end;

	local Character = LocalPlayer.Character;
	if not Character then
		State.AutoShootStatus = 'No Character';
		return;
	end;

	local Tool = Character:FindFirstChildOfClass('Tool');
	if not Tool or not Tool:FindFirstChild('Ammo') or Tool.Name == '[Knife]' then
		State.AutoShootStatus = 'No Gun';
		return;
	end;

	if not PassesConditions(Target, 'Silent Aim') then
		State.AutoShootStatus = 'Conditions';
		return;
	end;

	local TargetChar = Target.Character;
	local TargetHRP = TargetChar and TargetChar:FindFirstChild('HumanoidRootPart');
	if not TargetHRP then
		State.AutoShootStatus = 'No Target';
		return;
	end;

	local SelfHRP = Character:FindFirstChild('HumanoidRootPart');
	if not SelfHRP then return end;

	local RangeVal = Tool:FindFirstChild('Range');
	local GunRange = RangeVal and RangeVal.Value or 200;
	local ReachOrigin = GetMuzzlePosition(Tool) or SelfHRP.Position;
	if (ReachOrigin - TargetHRP.Position).Magnitude > GunRange then
		State.AutoShootStatus = 'Out of Range';
		return;
	end;

	if RageCfg['Wall Check'] and not IsVisible(TargetHRP.Position, Target) then
		State.AutoShootStatus = 'Blocked';
		return;
	end;

	local OffscreenCfg = SilentAimCfg['Offscreen Targeting'];
	local AllowOffscreen = OffscreenCfg and OffscreenCfg['Enabled'];
	local CurrentCamera = Workspace.CurrentCamera;
	local ScreenPos, OnScreen = CurrentCamera:WorldToViewportPoint(TargetHRP.Position);
	if not AllowOffscreen then
		if not (OnScreen and ScreenPos.Z > 1) then
			State.AutoShootStatus = 'Blocked';
			return;
		end;
		local SilentFOVCfg = GetConfig()['Main']['FOV'] and GetConfig()['Main']['FOV']['Silent'];
		if SilentFOVCfg and (SilentFOVCfg['Width'] or SilentFOVCfg['Height']) then
			local MousePosition = UserInputService:GetMouseLocation();
			local ViewportY = CurrentCamera.ViewportSize.Y;
			local CamFOV = CurrentCamera.FieldOfView;
			local ScaleFactor = (TargetHRP.Size.Y * ViewportY) / (ScreenPos.Z * 2) * 80 / CamFOV;
			local W = ((SilentFOVCfg['Width'] and SilentFOVCfg['Width'][2]) or 9e9) * ScaleFactor;
			local H = ((SilentFOVCfg['Height'] and SilentFOVCfg['Height'][2]) or 9e9) * ScaleFactor;
			local Delta = Vector2New(ScreenPos.X, ScreenPos.Y) - MousePosition;
			if not (MathAbs(Delta.X) <= W / 2 and MathAbs(Delta.Y) <= H / 2) then
				State.AutoShootStatus = 'Blocked';
				return;
			end;
		end;
	end;

	State.AutoShootStatus = 'Shooting';
	Tool:Activate();
end;


RunService:BindToRenderStep('ciderrage', 1, RageCore);
TrackConn(RunService.RenderStepped:Connect(RageCore));
TrackConn(RunService.Stepped:Connect(RageCore));
TrackConn(RunService.Heartbeat:Connect(RageCore));

if CurrentGame.Name == 'Da Hood' then
	if LocalPlayer.Character then HookGunActivation(LocalPlayer.Character) end;
	TrackConn(LocalPlayer.CharacterAdded:Connect(HookGunActivation));
end;

do
	local DasHoodCfg = GetConfig()['Modifications']['Das Hood'];
	local InfRangeCfg = DasHoodCfg['Inf Range'];
	local WallbangCfg = DasHoodCfg['Wallbang'];

	if InfRangeCfg['Enabled'] then
		task.spawn(function()
		local MainEvent = ReplicatedStorage:FindFirstChild('MainEvent') or ReplicatedStorage:WaitForChild('MainEvent', 10);
		if MainEvent then
			TrackConn(RunService.Heartbeat:Connect(function()
				local Character = LocalPlayer.Character;
				if Character then
					for _, Tool in next, Character:GetChildren() do
						if Tool:IsA('Tool') then
							local R = Tool:FindFirstChild('Range');
							if R then R.Value = 999999 end;
						end;
					end;
				end;
				local Backpack = LocalPlayer:FindFirstChild('Backpack');
				if Backpack then
					for _, Tool in next, Backpack:GetChildren() do
						if Tool:IsA('Tool') then
							local R = Tool:FindFirstChild('Range');
							if R then R.Value = 999999 end;
						end;
					end;
				end;
			end));

			local hookMM = hookmetamethod or (getgenv and getgenv().hookmetamethod);
			if hookMM then
				local oldNC;
				oldNC = hookMM(game, '__namecall', function(self, ...)
					local method = getnamecallmethod();
					local args = {...};
					if self == MainEvent and method == 'FireServer' and args[1] == 'ShootGun' then
						if args[6] and type(args[6]) == 'number' then
							args[6] = 10;
						end;
						if args[3] and args[5] then
							local Dir = (args[3] - args[5]).Unit;
							args[3] = args[5] + Dir * 10;
						end;
						if args[2] and args[4] and args[5] then
							local Tool = args[2].Parent;
							if Tool then
								args[4], args[5], args[6] = ApplyDamageModifierHit(Tool.Name, args[4], args[5], args[6]);
							end;
						end;
					end;
					if args[1] == 'CHECKER_4' then return nil end;
					return oldNC(self, Unpack(args));
				end);
			end;
		end;
		end);
	end;

	if WallbangCfg['Enabled'] then
		local function DoWallbang()
			local IgnoredFolder = Workspace:FindFirstChild('Ignored');
			if not IgnoredFolder then
				IgnoredFolder = Instance.new('Folder');
				IgnoredFolder.Name = 'Ignored';
				IgnoredFolder.Parent = Workspace;
			end;
			local Map = Workspace:FindFirstChild('MAP') or Workspace:FindFirstChild('Map');
			if Map and Map.Parent ~= IgnoredFolder then
				Map.Parent = IgnoredFolder;
			end;
		end;
		DoWallbang();
		TrackConn(RunService.Heartbeat:Connect(function()
			if GetConfig()['Modifications']['Das Hood']['Wallbang']['Enabled'] then
				DoWallbang();
			end;
		end));
	end;

end;

if CurrentGame.Name ~= 'Da Hood' and type(hookfunction) == 'function' then
	local SpreadModCfg = GetConfig()['Modifications']['Spread Modifications'];
	if SpreadModCfg['Enabled'] then
		local SpreadAngles = SpreadModCfg['Spread Angles'];
		local oldRandom;
		oldRandom = hookfunction(math.random, function(...)
			local args = {...};
			if checkcaller() then return oldRandom(...) end;
			if (#args == 0) or
			   (args[1] == -0.05 and args[2] == 0.05) or
			   (args[1] == -0.1 and args[2] == 0.1) or
			   (args[1] == -0.05) or
			   (args[1] == -0.1) then
				local Cfg = GetConfig()['Modifications']['Spread Modifications'];
				if not Cfg['Enabled'] or (SpreadAngles and SpreadAngles['Enabled']) then
					return oldRandom(...);
				end;
				local Spread = MathClamp((Cfg['Value'] or 0) / 100, 0, 1);
				local n = #args;
				if Spread == 0 then
					if n == 0 then return 0
					elseif n == 1 then return 0
					else return (args[1] + args[2]) / 2
					end;
				end;
				local Raw = oldRandom(...);
				if n == 0 then
					return (Raw - 0.5) * Spread + 0.5;
				elseif n == 1 then
					return Raw * Spread;
				else
					local Mid = (args[1] + args[2]) / 2;
					return Mid + (Raw - Mid) * Spread;
				end;
			end;
			return oldRandom(...);
		end);
	end;
end;

do
	local RangeEnhCfg = GetConfig()['Modifications']['Misc Gun Modifications']['Range Enhancer'];
	if RangeEnhCfg and RangeEnhCfg['Enabled'] then
		local function ResolveRangeGunHandler(PreferredModule)
			local Emu = TryLoadEmulatedGunHandler();
			if Emu and type(Emu.shoot) == 'function' and type(Emu.getAim) == 'function' then
				return Emu, 'emulated';
			end;

			if PreferredModule then
				local ok, GunHandler = pcall(require, PreferredModule);
				if ok and type(GunHandler) == 'table' and type(GunHandler.shoot) == 'function' and type(GunHandler.getAim) == 'function' then
					return GunHandler, 'require';
				end;
			end;

			return nil, 'missing';
		end;

		local function ApplyRangeToTool(Tool)
			if not Tool or not Tool:IsA('Tool') then return end;
			local RangeValueObj = Tool:FindFirstChild('Range');
			if not RangeValueObj then return end;

			local BaseRange = Tool:GetAttribute('__CiderBaseRange');
			if type(BaseRange) ~= 'number' then
				BaseRange = RangeValueObj.Value;
				Tool:SetAttribute('__CiderBaseRange', BaseRange);
			end;

			local CurrentCfg = GetConfig()['Modifications']['Misc Gun Modifications']['Range Enhancer'];
			local ExtraRange = (CurrentCfg and CurrentCfg['Enabled'] and CurrentCfg['Value']) or 0;
			RangeValueObj.Value = BaseRange + ExtraRange;
		end;

		local function SyncRangeTools()
			local Character = LocalPlayer.Character;
			if Character then
				for _, Tool in next, Character:GetChildren() do
					ApplyRangeToTool(Tool);
				end;
			end;

			local Backpack = LocalPlayer:FindFirstChild('Backpack');
			if Backpack then
				for _, Tool in next, Backpack:GetChildren() do
					ApplyRangeToTool(Tool);
				end;
			end;
		end;

		task.spawn(function()
		local ModulesFolder = ReplicatedStorage:FindFirstChild('Modules') or ReplicatedStorage:WaitForChild('Modules', 5);
		local ok, GunModule = pcall(function()
			return ModulesFolder and ModulesFolder:WaitForChild('GunHandler', 5);
		end);
		if ok and GunModule then
			local GunHandler, ResolveSource = ResolveRangeGunHandler(GunModule);
			shared.__cider_range_gunhandler_source = ResolveSource;
			if GunHandler then
				if GunHandler.shoot and type(GunHandler.shoot) == 'function' and not GunHandler.__CiderRangeWrapped then
					local origShoot = GunHandler.shoot;
					GunHandler.shoot = function(args)
						local CurrentCfg = GetConfig()['Modifications']['Misc Gun Modifications']['Range Enhancer'];
						local EnhVal = (CurrentCfg and CurrentCfg['Enabled'] and CurrentCfg['Value']) or 0;
						if args and args.Range then
							args.Range = args.Range + EnhVal;
						end;
						return origShoot(args);
					end;
					GunHandler.__CiderRangeWrapped = true;
				end;
				if GunHandler.getAim and type(GunHandler.getAim) == 'function' and not GunHandler.__CiderRangeAimWrapped then
					local origGetAim = GunHandler.getAim;
					GunHandler.getAim = function(hit, dist)
						local CurrentCfg = GetConfig()['Modifications']['Misc Gun Modifications']['Range Enhancer'];
						local EnhVal = (CurrentCfg and CurrentCfg['Enabled'] and CurrentCfg['Value']) or 0;
						return origGetAim(hit, dist + EnhVal);
					end;
					GunHandler.__CiderRangeAimWrapped = true;
				end;
			end;
		end;
		end);

		task.spawn(function()
			SyncRangeTools();
			TrackConn(RunService.Heartbeat:Connect(function()
				SyncRangeTools();
			end));
			TrackConn(LocalPlayer.CharacterAdded:Connect(function()
				task.wait(1);
				SyncRangeTools();
			end));
		end);

		if RangeEnhCfg['Use Hooks'] and getgc and islclosure and getfunctionhash and debug then
			task.spawn(function()
				local EnhVal = (GetConfig()['Modifications']['Misc Gun Modifications']['Range Enhancer']['Value']) or 12;
				for _, obj in getgc() do
					if type(obj) == 'function' and islclosure(obj) then
						if getfunctionhash(obj) == 'f01a12bbf0fe1944cdca10883eb444581d9a6bbd8f40472dbf23b6b39fd412f21769d9bfccef6b899f802bae846d2bb3' then
							local uv = debug.getupvalue(obj, 10);
							if uv then uv.Value = EnhVal end;
							debug.setupvalue(obj, 2, 0);
							debug.setconstant(obj, 26, 0);
							debug.setconstant(obj, 27, 0);
						end;
					end;
				end;
			end);
		end;
	end;
end;

if CurrentGame.Hooks == "Raycast" then
	local hookmetamethod = hookmetamethod or (getgenv and getgenv().hookmetamethod);
	if hookmetamethod then
		local old;
		old = hookmetamethod(game, "__namecall", function(self, ...)
			local args = {...};
			local method = getnamecallmethod();
			if not checkcaller() and method == "Raycast" and self == Workspace then
				local SilentAimCfg = GetConfig()['Silent Aim'];
				if SilentAimCfg['Enabled'] and State.Targets.Silent and PassesConditions(State.Targets.Silent, 'Silent Aim') then
					local MuzzlePos = args[1];
					local Direction = args[2];
					local Range = Direction.Magnitude;
					
					local TargetPos = GetAimPosition(MuzzlePos, Range);
					if TargetPos ~= Mouse.Hit.Position then
						args[2] = (TargetPos - MuzzlePos).Unit * Range;
						return old(self, Unpack(args));
					end;
				end;
			end;
			return old(self, Unpack(args));
		end);
	else
		warn("game not supported!");
	end;
end;

local function SetupAntiFall(Character)
	if not Character then return end;
	local Humanoid = Character:FindFirstChildOfClass('Humanoid') or Character:WaitForChild('Humanoid', 10);
	if not Humanoid then return end;
	TrackConn(Humanoid.StateChanged:Connect(function(_, NewState)
		if not GetConfig()['Movement']['Anti Trip'] then return end;
		if NewState == EnumFallingDown or NewState == EnumRagdoll then
			Humanoid:ChangeState(EnumGettingUp);
		end;
	end));
end;
if LocalPlayer.Character then SetupAntiFall(LocalPlayer.Character) end;
TrackConn(LocalPlayer.CharacterAdded:Connect(SetupAntiFall));

local function HealthHitDetection(Character)
	if not Character then return end;
	local Humanoid = Character:FindFirstChildOfClass('Humanoid') or Character:WaitForChild('Humanoid', 10);
	if not Humanoid then return end;
	local LastHealth = Humanoid.Health;
	TrackConn(Humanoid.HealthChanged:Connect(function(NewHealth)
		if NewHealth < LastHealth then
			TriggerAntiFutureBoost();
		end;
		LastHealth = NewHealth;
	end));
end;
if LocalPlayer.Character then HealthHitDetection(LocalPlayer.Character) end;
TrackConn(LocalPlayer.CharacterAdded:Connect(HealthHitDetection));

do
	local ANIM_PRESETS = {
		['Ninja'] = { Idle = 'rbxassetid://656118341', Run = 'rbxassetid://656118852', Walk = 'rbxassetid://656121766', Jump = 'rbxassetid://656117878', Fall = 'rbxassetid://10921159222', Climb = 'rbxassetid://656114359', Swim = 'rbxassetid://10921161002', SwimIdle = 'rbxassetid://10922757002' },
		['Robot'] = { Idle = 'rbxassetid://616089559', Run = 'rbxassetid://616091570', Walk = 'rbxassetid://616095330', Jump = 'rbxassetid://616090535', Fall = 'rbxassetid://616092998', Climb = 'rbxassetid://616086039', Swim = 'rbxassetid://10921253142', SwimIdle = 'rbxassetid://10921253767' },
		['Default'] = { Idle = 'rbxassetid://507766666', Run = 'rbxassetid://10921261968', Walk = 'rbxassetid://10921269718', Jump = 'rbxassetid://10921263860', Fall = 'rbxassetid://10921262864', Climb = 'rbxassetid://10921257536', Swim = 'rbxassetid://10921264784', SwimIdle = 'rbxassetid://10921265698' },
		['Custom'] = { Idle = 'rbxassetid://92080889861410', Run = 'rbxassetid://16738337225', Walk = 'rbxassetid://16738340646', Jump = 'rbxassetid://104325245285198', Fall = 'rbxassetid://616003713', Climb = 'rbxassetid://18537363391', Swim = 'rbxassetid://133308483266208', SwimIdle = 'rbxassetid://109346520324160' },
		['Levitate'] = { Idle = 'rbxassetid://616008087', Run = 'rbxassetid://616010382', Walk = 'rbxassetid://616013216', Jump = 'rbxassetid://616008936', Fall = 'rbxassetid://616005863', Climb = 'rbxassetid://616003713', Swim = 'rbxassetid://10921139478', SwimIdle = 'rbxassetid://10921138209' },
		['Mage'] = { Idle = 'rbxassetid://707855907', Run = 'rbxassetid://707861613', Walk = 'rbxassetid://707897309', Jump = 'rbxassetid://707853694', Fall = 'rbxassetid://707829716', Climb = 'rbxassetid://707826056', Swim = 'rbxassetid://10921150788', SwimIdle = 'rbxassetid://10921151661' },
		['Stylish'] = { Idle = 'rbxassetid://616138447', Run = 'rbxassetid://616140816', Walk = 'rbxassetid://616146177', Jump = 'rbxassetid://616139451', Fall = 'rbxassetid://616134815', Climb = 'rbxassetid://616133594', Swim = 'rbxassetid://10921281000', SwimIdle = 'rbxassetid://10921281964' },
		['Hero'] = { Idle = 'rbxassetid://616113536', Run = 'rbxassetid://616117076', Walk = 'rbxassetid://616122287', Jump = 'rbxassetid://616115533', Fall = 'rbxassetid://616108001', Climb = 'rbxassetid://616104706', Swim = 'rbxassetid://10921295495', SwimIdle = 'rbxassetid://10921297391' },
		['Toy'] = { Idle = 'rbxassetid://782845736', Run = 'rbxassetid://782842708', Walk = 'rbxassetid://782843345', Jump = 'rbxassetid://782847020', Fall = 'rbxassetid://782846423', Climb = 'rbxassetid://782843869', Swim = 'rbxassetid://10921309319', SwimIdle = 'rbxassetid://10921310341' },
		['Astronaut'] = { Idle = 'rbxassetid://891633237', Run = 'rbxassetid://891636393', Walk = 'rbxassetid://891667138', Jump = 'rbxassetid://891627522', Fall = 'rbxassetid://891617961', Climb = 'rbxassetid://891609353', Swim = 'rbxassetid://10921044000', SwimIdle = 'rbxassetid://10921045006' },
		['Bubbly'] = { Idle = 'rbxassetid://910009958', Run = 'rbxassetid://910025107', Walk = 'rbxassetid://910034870', Jump = 'rbxassetid://910016857', Fall = 'rbxassetid://910001910', Climb = 'rbxassetid://742636889', Swim = 'rbxassetid://10921063569', SwimIdle = 'rbxassetid://10922582160' },
		['Cartoony'] = { Idle = 'rbxassetid://742638445', Run = 'rbxassetid://742638842', Walk = 'rbxassetid://742640026', Jump = 'rbxassetid://742637942', Fall = 'rbxassetid://742637151', Climb = 'rbxassetid://742636889', Swim = 'rbxassetid://10921079380', SwimIdle = 'rbxassetid://10921081059' },
		['Elder'] = { Idle = 'rbxassetid://845400520', Run = 'rbxassetid://845386501', Walk = 'rbxassetid://845403856', Jump = 'rbxassetid://845398858', Fall = 'rbxassetid://845396048', Climb = 'rbxassetid://845392038', Swim = 'rbxassetid://10921108971', SwimIdle = 'rbxassetid://10921110146' },
		['Ghost'] = { Idle = 'rbxassetid://616008087', Run = 'rbxassetid://616013216', Walk = 'rbxassetid://616013216', Jump = 'rbxassetid://616008936', Fall = 'rbxassetid://616005863', Climb = 'rbxassetid://616156119', Swim = 'rbxassetid://133308483266208', SwimIdle = 'rbxassetid://109346520324160' },
		['Knight'] = { Idle = 'rbxassetid://657568135', Run = 'rbxassetid://657564596', Walk = 'rbxassetid://657552124', Jump = 'rbxassetid://658409194', Fall = 'rbxassetid://657600338', Climb = 'rbxassetid://658360781', Swim = 'rbxassetid://10921125160', SwimIdle = 'rbxassetid://10921125935' },
		['Vampire'] = { Idle = 'rbxassetid://1083450166', Run = 'rbxassetid://1083462077', Walk = 'rbxassetid://1083473930', Jump = 'rbxassetid://1083455352', Fall = 'rbxassetid://1083443587', Climb = 'rbxassetid://1083439238', Swim = 'rbxassetid://10921324408', SwimIdle = 'rbxassetid://10921325443' },
		['Werewolf'] = { Idle = 'rbxassetid://1083214717', Run = 'rbxassetid://1083216690', Walk = 'rbxassetid://1083178339', Jump = 'rbxassetid://1083218792', Fall = 'rbxassetid://1083189019', Climb = 'rbxassetid://1083182000', Swim = 'rbxassetid://10921340419', SwimIdle = 'rbxassetid://10921341319' },
		['Zombie'] = { Idle = 'rbxassetid://616160636', Run = 'rbxassetid://616163682', Walk = 'rbxassetid://616168032', Jump = 'rbxassetid://616161997', Fall = 'rbxassetid://616157476', Climb = 'rbxassetid://616156119', Swim = 'rbxassetid://10921352344', SwimIdle = 'rbxassetid://10921353442' },
		['Bold'] = { Idle = 'rbxassetid://16738334710', Run = 'rbxassetid://16738337225', Walk = 'rbxassetid://16738340646', Jump = 'rbxassetid://16738336650', Fall = 'rbxassetid://16738333171', Climb = 'rbxassetid://16738332169', Swim = 'rbxassetid://16738339158', SwimIdle = 'rbxassetid://16738339817' },
		['Adidas'] = { Idle = 'rbxassetid://18537371272', Run = 'rbxassetid://18537384940', Walk = 'rbxassetid://18537392113', Jump = 'rbxassetid://18537380791', Fall = 'rbxassetid://18537367238', Climb = 'rbxassetid://18537363391', Swim = 'rbxassetid://18537389531', SwimIdle = 'rbxassetid://18537387180' },
		['Catwalk'] = { Idle = 'rbxassetid://94970088341563', Run = 'rbxassetid://81024476153754', Walk = 'rbxassetid://109168724482748', Jump = 'rbxassetid://116936326516985', Fall = 'rbxassetid://119377220967554', Climb = 'rbxassetid://92294537340807', Swim = 'rbxassetid://134591743181628', SwimIdle = 'rbxassetid://98854111361360' },
		['Walmart'] = { Idle = 'rbxassetid://18747063918', Run = 'rbxassetid://18747070484', Walk = 'rbxassetid://18747074203', Jump = 'rbxassetid://18747069148', Fall = 'rbxassetid://18747062535', Climb = 'rbxassetid://18747060903', Swim = 'rbxassetid://18747073181', SwimIdle = 'rbxassetid://18747071682' },
		['Wicked'] = { Idle = 'rbxassetid://76049494037641', Run = 'rbxassetid://72301599441680', Walk = 'rbxassetid://92072849924640', Jump = 'rbxassetid://104325245285198', Fall = 'rbxassetid://121152442762481', Climb = 'rbxassetid://131326830509784', Swim = 'rbxassetid://99384245425157', SwimIdle = 'rbxassetid://113199415118199' },
		['NFL'] = { Idle = 'rbxassetid://74451233229259', Run = 'rbxassetid://117333533048078', Walk = 'rbxassetid://110358958299415', Jump = 'rbxassetid://119846112151352', Fall = 'rbxassetid://129773241321032', Climb = 'rbxassetid://134630013742019', Swim = 'rbxassetid://132697394189921', SwimIdle = 'rbxassetid://79090109939093' },
		['Pirate'] = { Idle = 'rbxassetid://750782770', Run = 'rbxassetid://750783738', Walk = 'rbxassetid://750785693', Jump = 'rbxassetid://750782230', Fall = 'rbxassetid://750780242', Climb = 'rbxassetid://750779899', Swim = 'rbxassetid://750784579', SwimIdle = 'rbxassetid://750785176' },
		['Adidas2'] = { Idle = 'rbxassetid://102357151005774', Run = 'rbxassetid://82598234841035', Walk = 'rbxassetid://122150855457006', Jump = 'rbxassetid://75290611992385', Fall = 'rbxassetid://98600215928904', Climb = 'rbxassetid://88763136693023', Swim = 'rbxassetid://133308483266208', SwimIdle = 'rbxassetid://109346520324160' },
		['Animals'] = { Idle = 'rbxassetid://102357151005774', Run = 'rbxassetid://87721497492370', Walk = 'rbxassetid://122150855457006', Jump = 'rbxassetid://75290611992385', Fall = 'rbxassetid://98600215928904', Climb = 'rbxassetid://88763136693023', Swim = 'rbxassetid://133308483266208', SwimIdle = 'rbxassetid://109346520324160' },
		['Aura'] = { Idle = 'rbxassetid://114191137265065', Run = 'rbxassetid://118320322718866', Walk = 'rbxassetid://83842218823011', Jump = 'rbxassetid://109996626521204', Fall = 'rbxassetid://95603166884636', Climb = 'rbxassetid://97824616490448', Swim = 'rbxassetid://134530128383903', SwimIdle = 'rbxassetid://94922130551805' },
		['Wicked2'] = { Idle = 'rbxassetid://132238900951109', Run = 'rbxassetid://135515454877967', Walk = 'rbxassetid://73718308412641', Jump = 'rbxassetid://78508480717326', Fall = 'rbxassetid://78147885297412', Climb = 'rbxassetid://129447497744818', Swim = 'rbxassetid://110657013921774', SwimIdle = 'rbxassetid://129183123083281' },
		['Unboxed'] = { Idle = 'rbxassetid://138183121662404', Run = 'rbxassetid://134824450619865', Walk = 'rbxassetid://90478085024465', Jump = 'rbxassetid://121454505477205', Fall = 'rbxassetid://94788218468396', Climb = 'rbxassetid://121145883950231', Swim = 'rbxassetid://105962919001086', SwimIdle = 'rbxassetid://129126268464847' },
		['Ud'] = { Idle = 'rbxassetid://3303162549', Run = 'rbxassetid://3236836670', Walk = 'rbxassetid://3303162967', Jump = 'rbxassetid://10921263860', Fall = 'rbxassetid://10921262864', Climb = 'rbxassetid://10921257536', Swim = 'rbxassetid://10921264784', SwimIdle = 'rbxassetid://10921265698' },
		['Toilet'] = { Idle = 'rbxassetid://4417978624', Run = 'rbxassetid://4417979645', Walk = 'rbxassetid://10921269718', Jump = 'rbxassetid://10921263860', Fall = 'rbxassetid://10921262864', Climb = 'rbxassetid://10921257536', Swim = 'rbxassetid://10921264784', SwimIdle = 'rbxassetid://10921265698' },
		['Gm'] = { Idle = 'rbxassetid://96439737641086', Run = 'rbxassetid://101925097435036', Walk = 'rbxassetid://85809016093530', Jump = 'rbxassetid://74159004634379', Fall = 'rbxassetid://98070939608691', Climb = 'rbxassetid://108236155509584', Swim = 'rbxassetid://83003487432457', SwimIdle = 'rbxassetid://112946194103503' },
		['Kat'] = { Idle = 'rbxassetid://72329200359275', Run = 'rbxassetid://73117360545482', Walk = 'rbxassetid://99182913548783', Jump = 'rbxassetid://103632305262747', Fall = 'rbxassetid://127802717128367', Climb = 'rbxassetid://106213237973858', Swim = 'rbxassetid://134148268480210', SwimIdle = 'rbxassetid://138619485942849' },
		['Oldschool'] = { Idle = 'rbxassetid://10921232093', Run = 'rbxassetid://10921240218', Walk = 'rbxassetid://10921244891', Jump = 'rbxassetid://10921242013', Fall = 'rbxassetid://10921241244', Climb = 'rbxassetid://10921229866', Swim = 'rbxassetid://10921243048', SwimIdle = 'rbxassetid://10921244018' },
	};

	local ANIM_FOLDER_MAP = {
		['Idle'] = { Folder = 'idle',     Children = { 'Animation1', 'Animation2' } },
		['Run'] = { Folder = 'run',      Children = { 'RunAnim' } },
		['Walk'] = { Folder = 'walk',     Children = { 'WalkAnim' } },
		['Jump'] = { Folder = 'jump',     Children = { 'JumpAnim' } },
		['Fall'] = { Folder = 'fall',     Children = { 'FallAnim' } },
		['Climb'] = { Folder = 'climb',    Children = { 'ClimbAnim' } },
		['Swim'] = { Folder = 'swim',     Children = { 'Swim' } },
		['SwimIdle'] = { Folder = 'swimidle', Children = { 'SwimIdleAnim' } },
	};

	local function ResolveAnimId(preset, slot)
		if not preset then return nil end;
		if preset:sub(1, 13) == 'rbxassetid://' or preset:match('^%d+$') then
			return 'rbxassetid://' .. preset:match('%d+');
		end;
		local pack = ANIM_PRESETS[preset];
		if not pack then return nil end;
		local id = pack[slot];
		if not id then return nil end;
		if id:sub(1, 13) == 'rbxassetid://' then return id end;
		return 'rbxassetid://' .. id;
	end;

	local function ApplyAnimChanger(Character, Force)
		local AnimCfg = GetConfig()['Utilities']['Animation Changer'];
		if not Force and not AnimCfg['Enabled'] then return end;
		local Animate = Character:FindFirstChild('Animate');
		if not Animate then return end;
		local Humanoid = Character:FindFirstChildOfClass('Humanoid');
		if not Humanoid then return end;

		local AnimSlots = AnimCfg['Animations'] or {};
		for CfgSlot, FolderInfo in next, ANIM_FOLDER_MAP do
			local Preset = AnimSlots[CfgSlot];
			if not Preset then continue end;
			local Id = ResolveAnimId(Preset, CfgSlot);
			if not Id then continue end;
			local Folder = Animate:FindFirstChild(FolderInfo.Folder);
			if not Folder then continue end;
			for _, ChildName in next, FolderInfo.Children do
				local Anim = Folder:FindFirstChild(ChildName);
				if Anim and Anim:IsA('Animation') then
					Anim.AnimationId = Id;
				end;
			end;
		end;

		for _, Track in next, Humanoid:GetPlayingAnimationTracks() do
			pcall(function() Track:Stop(0) end);
		end;
		pcall(function()
			local AnimateScript = Character:FindFirstChild('Animate');
			if AnimateScript then
				AnimateScript.Disabled = true;
				AnimateScript.Disabled = false;
			end;
		end);
	end;

	shared.__CiderApplyAnimationChanger = ApplyAnimChanger;

	local AnimCfg = GetConfig()['Utilities']['Animation Changer'];
	if AnimCfg['Enabled'] then
		if LocalPlayer.Character then
			task.delay(0.5, function() ApplyAnimChanger(LocalPlayer.Character) end);
		end;
		TrackConn(LocalPlayer.CharacterAdded:Connect(function(Character)
			task.delay(1, function() ApplyAnimChanger(Character) end);
		end));
	end;
end;

do
	local HitboxCfg = GetConfig()['Utilities']['Hitbox Expander'];
	if HitboxCfg['Enabled'] then
		local function RestoreHitbox(HRP)
			if not HRP then return end;
			HRP.Size = Vector3New(2, 2, 1);
			HRP.Transparency = 1;
			HRP.Material = Enum.Material.Plastic;
			HRP.BrickColor = BrickColor.new('Medium stone grey');
		end;

		TrackConn(RunService.Heartbeat:Connect(function()
			local Cfg = GetConfig()['Utilities']['Hitbox Expander'];
			if not Cfg['Enabled'] then
				for _, Player in next, Players:GetPlayers() do
					if Player == LocalPlayer then continue end;
					local Character = Player.Character;
					local HRP = Character and Character:FindFirstChild('HumanoidRootPart');
					if HRP then
						RestoreHitbox(HRP);
					end;
				end;
				return;
			end;
			local Size = Cfg['Size'] or 8;
			local TargetOnly = Cfg['Target Only'];
			local Visualize = Cfg['Visualize'];
			local CurrentTarget = TargetOnly and (State.Targets.Silent or State.Targets.Triggerbot or State.Targets.Aimbot);
			for _, Player in next, Players:GetPlayers() do
				if Player == LocalPlayer then continue end;
				local Character = Player.Character;
				if not Character then continue end;
				local HRP = Character:FindFirstChild('HumanoidRootPart');
				if not HRP then continue end;
				if TargetOnly and CurrentTarget ~= Player then
					RestoreHitbox(HRP);
					continue;
				end;
				HRP.Size = Vector3New(Size, Size, Size);
				HRP.CanCollide = false;
				if Visualize then
					HRP.Transparency = 0.5;
					HRP.BrickColor = BrickColor.new('Really black');
					HRP.Material = Enum.Material.SmoothPlastic;
				else
					HRP.Transparency = 1;
					HRP.Material = Enum.Material.Plastic;
					HRP.BrickColor = BrickColor.new('Medium stone grey');
				end;
			end;
		end));
	end;
end;

local function GetMovementKey(Character, Humanoid, Cfg)
	local Tool = Character and Character:FindFirstChildOfClass('Tool');
	local IsKnife = false;
	local IsReload = false;
	if Tool then
		local Name = Tool.Name;
		local Lower = string.lower(Name);
		IsKnife = (Name == '[Knife]') or (Lower:find('knife') ~= nil);
		local Ammo = Tool:FindFirstChild('Ammo');
		if Ammo and Ammo.Value == 0 then
			IsReload = true;
		else
			local Reloading = Tool:FindFirstChild('Reloading');
			if Reloading and Reloading.Value then IsReload = true end;
		end;
	end;
	local BodyEffects = Character and Character:FindFirstChild('BodyEffects');
	if BodyEffects then
		local Reload = BodyEffects:FindFirstChild('Reload');
		if Reload and Reload.Value == true then IsReload = true end;
	end;
	local Threshold = 25;
	local IsLowHealth = Humanoid and Humanoid.Health > 0 and Humanoid.Health <= Threshold;
	local Desired = 'Normal';
	if IsKnife then
		Desired = 'Knife';
	elseif IsLowHealth then
		Desired = 'Low Health';
	elseif IsReload then
		Desired = 'Reload';
	elseif State.IsShooting then
		Desired = 'Shooting';
	end;
	local Conditions = (Cfg and Cfg['Conditions']) or {};
	local Entry = Conditions[Desired];
	if Entry and Entry['Enabled'] == false then
		return 'Normal';
	end;
	return Desired;
end;

local function SetupNoJumpCooldown(Character)
	if not Character then return end;
	local Humanoid = Character:FindFirstChildOfClass('Humanoid');
	if not Humanoid then return end;
	local DefaultJumpPower = Humanoid.JumpPower;
	TrackConn(Humanoid:GetPropertyChangedSignal('JumpPower'):Connect(function()
		if not GetConfig()['Movement']['No Jump Cooldown'] then return end;
		if Humanoid.JumpPower == 0 then
			local JumpModCfg = GetConfig()['Movement']['Jump Modifications'];
			if JumpModCfg['Enabled'] and State.JumpModificationsActive and not JumpModCfg['Spiderman Mode'] then
				local Key = GetMovementKey(Character, Humanoid, JumpModCfg);
				local Conditions = JumpModCfg['Conditions'] or {};
				local Entry = Conditions[Key];
				local Mult = (Entry and Entry['Enabled'] ~= false and Entry['Multiplier']) or 1;
				local Values = JumpModCfg['Values'] or JumpModCfg;
				local Base = (JumpModCfg['Mode'] == 'Multiplier') and ((Values['Multiplier'] or 1) * 100) or (Values['Number'] or 50);
				Humanoid.JumpPower = Base * Mult;
			else
				Humanoid.JumpPower = DefaultJumpPower;
			end;
		end;
	end));
end;

if LocalPlayer.Character then SetupNoJumpCooldown(LocalPlayer.Character) end;
TrackConn(LocalPlayer.CharacterAdded:Connect(SetupNoJumpCooldown));

TrackConn(RunService.RenderStepped:Connect(function()
	local Character = LocalPlayer.Character;
	local Humanoid = Character and Character:FindFirstChildOfClass('Humanoid');
	if not Humanoid then return end;

	local SpeedModCfg = GetConfig()['Movement']['Speed Modifications'];
	if State.SpeedModificationHumanoid ~= Humanoid then
		RestoreWalkSpeedState(State);
	end;
	if not SpeedModCfg['Enabled'] or not State.SpeedModificationsActive then
		RestoreWalkSpeedState(State);
		return;
	end;

	if not State.SpeedModificationHumanoid then
		State.SpeedModificationHumanoid = Humanoid;
		State.OriginalWalkSpeed = Humanoid.WalkSpeed;
	end;

	local Key = GetMovementKey(Character, Humanoid, SpeedModCfg);
	local Conditions = SpeedModCfg['Conditions'] or {};
	local Entry = Conditions[Key];
	local Mult = (Entry and Entry['Enabled'] ~= false and Entry['Multiplier']) or 1;
	local Values = SpeedModCfg['Values'] or SpeedModCfg;
	if SpeedModCfg['Mode'] == 'Multiplier' then
		Humanoid.WalkSpeed = ((Values['Multiplier'] or 1) * 100) * Mult;
	else
		Humanoid.WalkSpeed = (Values['Number'] or 16) * Mult;
	end;
end));

local function SetupJumpModifications(Character)
	if not Character then return end;
	local Humanoid = Character:FindFirstChildOfClass('Humanoid') or Character:WaitForChild('Humanoid', 10);
	if not Humanoid then return end;
	local DefaultJumpPower = Humanoid.JumpPower;

	local WallCheckParams = RaycastParamsNew();
	WallCheckParams.FilterType = EnumExclude;
	WallCheckParams.FilterDescendantsInstances = {Character};

	local function IsNearWall(RootPart)
		local Origin = RootPart.Position;
		local CF = RootPart.CFrame;
		local Directions = { CF.LookVector, -CF.LookVector, CF.RightVector, -CF.RightVector, (CF.LookVector + CF.RightVector).Unit, (CF.LookVector - CF.RightVector).Unit, (-CF.LookVector + CF.RightVector).Unit, (-CF.LookVector - CF.RightVector).Unit };
		for _, Dir in next, Directions do
			if Workspace:Raycast(Origin, Dir * 5, WallCheckParams) then return true end;
		end;
		return false;
	end;

	local function GetJumpValue()
		local JumpModCfg = GetConfig()['Movement']['Jump Modifications'];
		local Key = GetMovementKey(Character, Humanoid, JumpModCfg);
		local Conditions = JumpModCfg['Conditions'] or {};
		local Entry = Conditions[Key];
		local Mult = (Entry and Entry['Enabled'] ~= false and Entry['Multiplier']) or 1;
		local Values = JumpModCfg['Values'] or JumpModCfg;
		if JumpModCfg['Mode'] == 'Multiplier' then
			return ((Values['Multiplier'] or 1) * 100) * Mult;
		else
			return (Values['Number'] or 50) * Mult;
		end;
	end;

	local JumpConn;
	local JumpWasBoosted = false;
	JumpConn = TrackConn(RunService.RenderStepped:Connect(function()
		if not Character.Parent then JumpConn:Disconnect(); return end;
		local JumpModCfg = GetConfig()['Movement']['Jump Modifications'];
		if not JumpModCfg['Enabled'] or not State.JumpModificationsActive or JumpModCfg['Spiderman Mode'] then
			if JumpWasBoosted then
				Humanoid.JumpPower = DefaultJumpPower;
				JumpWasBoosted = false;
			end;
			return;
		end;
		Humanoid.UseJumpPower = true;
		Humanoid.JumpPower = GetJumpValue();
		JumpWasBoosted = true;
	end));

	local RequestConn;
	local LastWallJump = 0;
	RequestConn = TrackConn(UserInputService.JumpRequest:Connect(function()
		if not Character.Parent then RequestConn:Disconnect(); return end;
		local JumpModCfg = GetConfig()['Movement']['Jump Modifications'];
		if not JumpModCfg['Enabled'] or not State.JumpModificationsActive or not JumpModCfg['Spiderman Mode'] then return end;
		local RootPart = Character:FindFirstChild('HumanoidRootPart');
		if not RootPart then return end;
		if Humanoid.FloorMaterial ~= EnumAir then return end;
		if (Tick() - LastWallJump) < 0.3 then return end;
		if not IsNearWall(RootPart) then return end;
		LastWallJump = Tick();
		Humanoid.UseJumpPower = true;
		Humanoid.JumpPower = GetJumpValue();
		Humanoid:ChangeState(EnumJumping);
		local ResetConn;
		ResetConn = TrackConn(Humanoid.StateChanged:Connect(function(_, NewState)
			if NewState == EnumFreefall or NewState == EnumLanded then
				ResetConn:Disconnect();
				Humanoid.JumpPower = DefaultJumpPower;
			end;
		end));
	end));
end;

if LocalPlayer.Character then SetupJumpModifications(LocalPlayer.Character) end;
TrackConn(LocalPlayer.CharacterAdded:Connect(SetupJumpModifications));

do
	local function GetSkinChangerCfg() return GetConfig()['Utilities']['Skin Changer'] end;
	if type(getgenv) == 'function' then
		local prevApplied = getgenv().__scAppliedSkins;
		if prevApplied then
			for _, entry in next, prevApplied do
				if entry and entry.Connections then
					for _, c in next, entry.Connections do
						pcall(function() if c.Connected then c:Disconnect() end end);
					end;
				end;
			end;
		end;
		local prevKnife = getgenv().__scKnifeData;
		if prevKnife then
			for _, data in next, prevKnife do
				if data and data.conns then
					for _, c in next, data.conns do
						pcall(function() if c.Connected then c:Disconnect() end end);
					end;
				end;
			end;
		end;
	end;
	local AppliedSkins = {};
	local KnifeData = {};
	local InitialGunSkinRefreshDone = {};
	local PendingSkinReprocess = {};
	if type(getgenv) == 'function' then
		getgenv().__scAppliedSkins = AppliedSkins;
		getgenv().__scKnifeData = KnifeData;
	end;
	local ToolRegistry = {};
	local SkinAssets = CachedSkinAssets;
	local SkinModules = ReplicatedStorage:FindFirstChild('SkinModules');
	local SkinData = nil;
	local ApplySkinToTool;
	local RemoveSkinFromTool;
	task.spawn(function()
		if not SkinModules then
			local ok, found = pcall(function()
				return ReplicatedStorage:WaitForChild('SkinModules', 3);
			end);
			if ok and found then SkinModules = found; end;
		end;
		if SkinModules and typeof(SkinModules) == 'Instance' and SkinModules:IsA('ModuleScript') then
			local ok, result = pcall(require, SkinModules);
			if ok and type(result) == 'table' then
				SkinData = result;
				return;
			end;
		end;
		local httpFn = (type(game.HttpGet) == 'function' and function(url) return game:HttpGet(url) end)
			or (type(getgenv) == 'function' and getgenv().http_request and function(url)
				local res = getgenv().http_request({ Url = url, Method = 'GET' });
				return res and res.Body;
			end)
			or (type(getgenv) == 'function' and getgenv().request and function(url)
				local res = getgenv().request({ Url = url, Method = 'GET' });
				return res and res.Body;
			end);
		if httpFn then
			local ok, body = pcall(httpFn, 'https://pastebin.com/raw/0uZ107WE');
			if ok and body then
				local fn = loadstring(body);
				if fn then
					local ok2, result = pcall(fn);
					if ok2 and type(result) == 'table' then
						SkinData = result;
					elseif ok2 and shared.skin_modules and next(shared.skin_modules) then
						SkinData = shared.skin_modules;
					end;
				end;
			end;
		end;

		task.wait(0.5);
		if SkinData then
			local SkinCfg = GetSkinChangerCfg();
			if SkinCfg and SkinCfg['Enabled'] then
				local Skins = SkinCfg['Skins'];
				local function reapplyContainer(Container)
					if not Container then return; end;
					for _, Tool in next, Container:GetChildren() do
						if Tool:IsA('Tool') then
							local SkinName = Skins[Tool.Name];
							if not SkinName then
								local stripped = Tool.Name:gsub('%[', ''):gsub('%]', '');
								SkinName = Skins['[' .. stripped .. ']'];
							end;
							if SkinName and SkinName ~= '' and SkinName ~= 'None' then
								pcall(function() RemoveSkinFromTool(Tool) end);
								ToolRegistry[Tool] = nil;
								pcall(function() ProcessTool(Tool) end);
							end;
						end;
					end;
				end;
				pcall(function() reapplyContainer(LocalPlayer.Character) end);
				pcall(function() reapplyContainer(LocalPlayer:FindFirstChild('Backpack')) end);
			end;
		end;
	end);

	local function IsKnifeSkin(name)
		local n = name:gsub(' ', '');
		return n == 'GoldenAgeTanto' or n == 'GPO-Knife' or n == 'GPO-KnifePrestige' or n == 'Heaven'
			or n == 'LoveKukri' or n == 'PurpleDagger' or n == 'BlueDagger' or n == 'GreenDagger' or n == 'RedDagger';
	end;

	local function CleanKnife(Tool)
		local data = KnifeData[Tool];
		if data then
			if data.conns then
				for _, c in next, data.conns do
					if c then c:Disconnect() end;
				end;
				data.conns = nil;
			end;
			if data.track then
				data.track:Stop();
				data.track:Destroy();
				data.track = nil;
			end;
			if data.welds then
				for _, w in next, data.welds do
					if w then w:Destroy() end;
				end;
			end;
			if data.sounds then
				for _, s in next, data.sounds do
					if s and s.Parent then s:Destroy() end;
				end;
			end;
		end;
		local mesh = Tool:FindFirstChild('Default');
		if mesh then
			for _, v in next, mesh:GetChildren() do
				if v.Name == 'Handle.R' or v:IsA('Model') or (v:IsA('BasePart') and v.Name ~= 'Default') then
					v:Destroy();
				end;
			end;
			mesh.Transparency = 0;
		end;
		for _, v in next, Tool:GetChildren() do
			if (v:IsA('Model') or v:IsA('MeshPart')) and v ~= mesh and v.Name ~= 'Handle' then
				v:Destroy();
			end;
		end;
		KnifeData[Tool] = nil;
	end;

	local function ApplyKnife(Character, Tool, SkinName)
		if not IsKnifeSkin(SkinName) then return end;
		if Tool.Parent ~= Character then return end;
		local Humanoid = Character:FindFirstChild('Humanoid');
		local rhand = Character:FindFirstChild('RightHand');
		if not Humanoid or not rhand then return end;

		local existing = KnifeData[Tool];
		if existing and existing.welds and #existing.welds > 0 then
			local handleR = Tool:FindFirstChild('Default') and Tool:FindFirstChild('Default'):FindFirstChild('Handle.R');
			if handleR and handleR.Parent then
				local m6d = handleR:FindFirstChildOfClass('Motor6D');
				if m6d then
					m6d.Part0 = rhand;
				end;
				local defMesh = Tool:FindFirstChild('Default');
				if defMesh then
					defMesh.Transparency = 1;
					for _, v in next, defMesh:GetChildren() do
						if (v:IsA('Model') or v:IsA('MeshPart')) and v.Name ~= SkinName then
							v:Destroy();
						end;
					end;
				end;
				for _, v in next, Tool:GetChildren() do
					if (v:IsA('Model') or v:IsA('MeshPart')) and v ~= defMesh and v.Name ~= 'Handle' and v.Name ~= SkinName then
						v:Destroy();
					end;
				end;
				local Animator = Humanoid:FindFirstChildOfClass('Animator');
				if Animator then
					local n = SkinName:gsub(' ', '');
					local animId, sndId;
					if n == 'GoldenAgeTanto' then
						animId, sndId = 'rbxassetid://13473404819', 'rbxassetid://5917819099';
					elseif n == 'GPO-Knife' or n == 'GPO-KnifePrestige' then
						animId, sndId = 'rbxassetid://14014278925', 'rbxassetid://4604390759';
					elseif n == 'Heaven' then
						animId, sndId = 'rbxassetid://14500266726', 'rbxassetid://14489860007';
					elseif n == 'PurpleDagger' then
						animId, sndId = 'rbxassetid://17824999722', 'rbxassetid://17822743153';
					elseif n == 'BlueDagger' then
						animId, sndId = 'rbxassetid://17824995184', 'rbxassetid://17822737046';
					elseif n == 'GreenDagger' then
						animId, sndId = 'rbxassetid://17825004320', 'rbxassetid://17822741762';
					elseif n == 'RedDagger' then
						animId, sndId = 'rbxassetid://17825008844', 'rbxassetid://17822952417';
					end;
					if animId then
						if existing.track then
							existing.track:Stop();
							existing.track:Destroy();
							existing.track = nil;
						end;
						local anim = Instance.new('Animation');
						anim.AnimationId = animId;
						local track = Animator:LoadAnimation(anim);
						track.Looped = false;
						track:Play();
						existing.track = track;
						anim:Destroy();
						track.Ended:Once(function()
							if existing.track == track then existing.track = nil end;
							track:Destroy();
						end);
					end;
					if sndId then
						local snd = Instance.new('Sound');
						snd.SoundId = sndId;
						snd.Parent = Workspace;
						snd:Play();
						table.insert(existing.sounds, snd);
						snd.Ended:Connect(function()
							snd:Destroy();
						end);
					end;
				end;
				return;
			end;
		end;

		CleanKnife(Tool);
		KnifeData[Tool] = { track = nil, welds = {}, sounds = {} };
		local data = KnifeData[Tool];
		local mesh = Tool:FindFirstChild('Default');
		if not mesh then return end;
		mesh.Transparency = 1;
		local knives = SkinModules and SkinModules:FindFirstChild('Knives');
		if not knives then return end;
		local skinmodel = knives:FindFirstChild(SkinName);
		if not skinmodel then return end;
		local clone = skinmodel:Clone();
		clone.Name = SkinName;
		local handr = Instance.new('Part');
		handr.Name = 'Handle.R';
		handr.Transparency = 1;
		handr.CanCollide = false;
		handr.Anchored = false;
		handr.Size = Vector3New(0.001, 0.001, 0.001);
		handr.Massless = true;
		handr.Parent = mesh;
		local m6d = Instance.new('Motor6D');
		m6d.Name = 'Handle.R';
		m6d.Part0 = rhand;
		m6d.Part1 = handr;
		m6d.Parent = handr;

		local offset, animId, sndId;
		local n = SkinName:gsub(' ', '');

		if n == 'GoldenAgeTanto' then
			offset = CFrameNew(0, -0.20, -1.2) * CFrame.Angles(MathRad(90), MathRad(263.7), MathRad(180));
			animId = 'rbxassetid://13473404819';
			sndId = 'rbxassetid://5917819099';
		elseif n == 'GPO-Knife' or n == 'GPO-KnifePrestige' then
			offset = CFrameNew(0, -0.32, -1.07) * CFrame.Angles(MathRad(90), MathRad(-97.4), MathRad(90));
			animId = 'rbxassetid://14014278925';
			sndId = 'rbxassetid://4604390759';
		elseif n == 'Heaven' then
			offset = CFrameNew(-0.02, -0.82, 0.20) * CFrame.Angles(MathRad(64.42), MathRad(3.79), MathRad(0));
			animId = 'rbxassetid://14500266726';
			sndId = 'rbxassetid://14489860007';
		elseif n == 'LoveKukri' then
			offset = CFrameNew(-0.14, 0.14, -1.62) * CFrame.Angles(MathRad(-90), MathRad(180), MathRad(-4.97));
		elseif n == 'PurpleDagger' then
			offset = CFrameNew(-0.13, -0.24, -1.80) * CFrame.Angles(MathRad(89.05), MathRad(96.63), MathRad(180));
			animId = 'rbxassetid://17824999722';
			sndId = 'rbxassetid://17822743153';
		elseif n == 'BlueDagger' then
			offset = CFrameNew(-0.13, -0.24, -1.80) * CFrame.Angles(MathRad(89.05), MathRad(96.63), MathRad(180));
			animId = 'rbxassetid://17824995184';
			sndId = 'rbxassetid://17822737046';
		elseif n == 'GreenDagger' then
			offset = CFrameNew(-0.13, -0.24, -1.07) * CFrame.Angles(MathRad(89.05), MathRad(96.63), MathRad(180));
			animId = 'rbxassetid://17825004320';
			sndId = 'rbxassetid://17822741762';
		elseif n == 'RedDagger' then
			offset = CFrameNew(-0.13, -0.24, -1.07) * CFrame.Angles(MathRad(89.05), MathRad(96.63), MathRad(180));
			animId = 'rbxassetid://17825008844';
			sndId = 'rbxassetid://17822952417';
		end;

		if not offset then return end;

		if clone:IsA('Model') then
			if not clone.PrimaryPart then
				for _, c in next, clone:GetChildren() do
					if c:IsA('BasePart') then
						clone.PrimaryPart = c;
						break;
					end;
				end;
			end;
			if clone.PrimaryPart then
				for _, p in next, clone:GetDescendants() do
					if p:IsA('BasePart') then
						p.CanCollide = false;
						p.Massless = true;
						p.Anchored = false;
						local w = Instance.new('Weld');
						w.Part0 = handr;
						w.Part1 = p;
						w.C0 = offset;
						w.C1 = p.CFrame:ToObjectSpace(clone.PrimaryPart.CFrame);
						w.Parent = p;
						table.insert(data.welds, w);
					end;
				end;
			end;
			clone.Parent = mesh;
		elseif clone:IsA('BasePart') then
			clone.CanCollide = false;
			clone.Massless = true;
			clone.Anchored = false;
			clone.Parent = mesh;
			local w = Instance.new('Weld');
			w.Part0 = handr;
			w.Part1 = clone;
			w.C0 = offset;
			w.Parent = clone;
			table.insert(data.welds, w);
		end;

		local Animator = Humanoid:FindFirstChildOfClass('Animator');
		if not Animator then
			Animator = Instance.new('Animator');
			Animator.Parent = Humanoid;
		end;
		if animId then
			local anim = Instance.new('Animation');
			anim.AnimationId = animId;
			local track = Animator:LoadAnimation(anim);
			track.Looped = false;
			track:Play();
			data.track = track;
			anim:Destroy();
			track.Ended:Once(function()
				if data.track == track then
					data.track = nil;
				end;
				track:Destroy();
			end);
		end;
		if sndId then
			local snd = Instance.new('Sound');
			snd.SoundId = sndId;
			snd.Parent = Workspace;
			snd:Play();
			table.insert(data.sounds, snd);
			snd.Ended:Connect(function()
				snd:Destroy();
			end);
		end;
		data.conns = data.conns or {};
		local function StripKnifeIntruders()
			if KnifeData[Tool] ~= data then return end;
			if mesh and mesh.Parent then
				mesh.Transparency = 1;
				for _, v in next, mesh:GetChildren() do
					if (v:IsA('Model') or v:IsA('MeshPart')) and v.Name ~= SkinName then
						v:Destroy();
					end;
				end;
			end;
			for _, v in next, Tool:GetChildren() do
				if (v:IsA('Model') or v:IsA('MeshPart')) and v ~= mesh and v.Name ~= 'Handle' and v.Name ~= SkinName then
					v:Destroy();
				end;
			end;
		end;
		local kc1 = Tool.ChildAdded:Connect(function(c)
			if (c:IsA('Model') or c:IsA('MeshPart')) and c ~= mesh and c.Name ~= 'Handle' and c.Name ~= SkinName then
				task.defer(StripKnifeIntruders);
			end;
		end);
		table.insert(data.conns, kc1);
		if mesh then
			local kc2 = mesh.ChildAdded:Connect(function(c)
				if (c:IsA('Model') or c:IsA('MeshPart')) and c.Name ~= SkinName then
					task.defer(StripKnifeIntruders);
				end;
			end);
			table.insert(data.conns, kc2);
			local kc3 = mesh:GetPropertyChangedSignal('Transparency'):Connect(function()
				if KnifeData[Tool] == data and mesh.Transparency ~= 1 then
					mesh.Transparency = 1;
				end;
			end);
			table.insert(data.conns, kc3);
		end;
	end;

	local function LoadSkinData()
		if SkinData then return SkinData end;
		if SkinModules and typeof(SkinModules) == 'Instance' and SkinModules:IsA('ModuleScript') then
			local ok, result = pcall(require, SkinModules);
			if ok and type(result) == 'table' then SkinData = result; end;
		end;
		if not SkinData and shared.skin_modules and next(shared.skin_modules) then
			SkinData = shared.skin_modules;
		end;
		if SkinData then
			for Tool, SkinName in next, PendingSkinReprocess do
				if Tool and Tool.Parent and SkinName and SkinName ~= '' and SkinName ~= 'None' then
					task.defer(function()
						ToolRegistry[Tool] = nil;
						ProcessTool(Tool);
					end);
				end;
				PendingSkinReprocess[Tool] = nil;
			end;
		end;
		return SkinData;
	end;

	local function GetSkinInfo(weaponName, skinName)
		local data = LoadSkinData();
		if not data then return nil end;
		local weaponSkins = data[weaponName];
		if not weaponSkins then
			local bracketName = '[' .. weaponName:gsub('%[', ''):gsub('%]', '') .. ']';
			weaponSkins = data[bracketName];
		end;
		if not weaponSkins then return nil end;
		local info = weaponSkins[skinName];
		if not info then
			info = weaponSkins[skinName:gsub('-', ' ')];
		end;
		if not info then
			info = weaponSkins[skinName:gsub('-', '')];
		end;
		return info;
	end;

	local function FindSourceMesh(skinName, meshRef, isKnife)
		if not SkinModules or typeof(SkinModules) ~= 'Instance' then return nil end;
		if isKnife then
			local cleanSkin = skinName:lower():gsub(' ', '');
			local KnivesFolder = SkinModules:FindFirstChild('Knives');
			if KnivesFolder then
				for _, child in next, KnivesFolder:GetChildren() do
					if child:IsA('MeshPart') then
						local cleanName = child.Name:lower():gsub(' ', '');
						if child.Name == skinName or cleanName == cleanSkin then
							return child;
						end;
					elseif child:IsA('Folder') or child:IsA('Model') then
						local cleanName = child.Name:lower():gsub(' ', '');
						if child.Name == skinName or cleanName == cleanSkin then
							for _, sub in next, child:GetChildren() do
								if sub:IsA('MeshPart') then
									return sub;
								end;
							end;
						end;
					end;
				end;
			end;
			if SkinAssets then
				local KnifeFolder = SkinAssets:FindFirstChild('KnifeMeshes') or SkinAssets:FindFirstChild('Knives');
				if KnifeFolder then
					for _, child in next, KnifeFolder:GetChildren() do
						if child:IsA('MeshPart') then
							local cleanName = child.Name:lower():gsub(' ', '');
							if child.Name == skinName or cleanName == cleanSkin then
								return child;
							end;
						elseif child:IsA('Folder') or child:IsA('Model') then
							local cleanName = child.Name:lower():gsub(' ', '');
							if child.Name == skinName or cleanName == cleanSkin then
								for _, sub in next, child:GetChildren() do
									if sub:IsA('MeshPart') then
										return sub;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
			return nil;
		end;
		local MeshesFolder = SkinModules:FindFirstChild('Meshes');
		if not MeshesFolder then return nil end;
		local folderNames = { skinName, skinName:gsub(' ', ''), skinName:gsub(' ', '_') };
		for _, folderName in next, folderNames do
			local skinFolder = MeshesFolder:FindFirstChild(folderName);
			if skinFolder then
				if meshRef then
					for _, child in next, skinFolder:GetChildren() do
						if child:IsA('MeshPart') then
							local cleanChild = child.Name:lower():gsub(' ', ''):gsub('-', '');
							local cleanRef = meshRef:lower():gsub(' ', ''):gsub('-', '');
							if child.Name == meshRef or cleanChild == cleanRef then
								return child;
							end;
						end;
					end;
				end;
				for _, child in next, skinFolder:GetChildren() do
					if child:IsA('MeshPart') then
						return child;
					end;
				end;
			end;
		end;
		if SkinAssets then
			local GunMeshes = SkinAssets:FindFirstChild('GunMeshes');
			if GunMeshes then
				for _, folderName in next, folderNames do
					local skinFolder = GunMeshes:FindFirstChild(folderName);
					if skinFolder then
						for _, child in next, skinFolder:GetChildren() do
							if child:IsA('MeshPart') then
								return child;
							end;
						end;
					end;
				end;
			end;
		end;
		return nil;
	end;

	local function GetShootSound(weaponName, skinName)
		if not SkinAssets then return nil end;
		local GunShootSounds = SkinAssets:FindFirstChild('GunShootSounds');
		if not GunShootSounds then return nil end;
		local WeaponFolder = GunShootSounds:FindFirstChild(weaponName);
		if not WeaponFolder then return nil end;
		local SoundValue = WeaponFolder:FindFirstChild(skinName);
		if SoundValue and SoundValue:IsA('StringValue') then
			return SoundValue.Value;
		end;
		return nil;
	end;

	local ApplySkinToTool;
	local RemoveSkinFromTool;

	local function FindShootSoundInstance(Tool)
		if not Tool then return nil end;
		for _, child in next, Tool:GetDescendants() do
			if child:IsA('Sound') and (child.Name == 'Shoot' or child.Name == 'ShootSound') then
				return child;
			end;
		end;
		return nil;
	end;

	local function BindShootSoundForSkin(Tool)
		local skinData = AppliedSkins[Tool];
		if not skinData then return end;
		local shootSound = FindShootSoundInstance(Tool);
		if not shootSound then return end;
		if not skinData.ShootSoundOriginals then
			skinData.ShootSoundOriginals = {};
		end;
		if skinData.ShootSoundOriginals[shootSound] == nil then
			skinData.ShootSoundOriginals[shootSound] = shootSound.SoundId;
		end;
		skinData.ShootSound = shootSound;
		local soundId = GetShootSound(Tool.Name, skinData.SkinName);
		if soundId and soundId ~= '' then
			shootSound.SoundId = soundId;
		end;
	end;

	local function StripForeignGunMeshes(Tool, default, Handle)
		if not Tool or not default then return end;
		local function IsOurs(nm)
			return #nm == 0 or nm == '\0';
		end;
		for _, child in next, Tool:GetChildren() do
			if child:IsA('MeshPart') and child ~= default and child ~= Handle and not IsOurs(child.Name) then
				child:Destroy();
			end;
		end;
		for _, child in next, default:GetChildren() do
			if child:IsA('MeshPart') and not IsOurs(child.Name) then
				child:Destroy();
			end;
		end;
	end;

	local function ReapplyGunSkinState(Tool)
		local skinData = AppliedSkins[Tool];
		if not skinData then return end;
		local default = skinData.Default;
		if not default or not default.Parent then return end;
		local Handle = Tool and Tool:FindFirstChild('Handle');
		StripForeignGunMeshes(Tool, default, Handle);
		if skinData.HideDefault then
			if default.Transparency ~= 1 then
				default.Transparency = 1;
			end;
		else
			if skinData.DesiredTransparency ~= nil and default.Transparency ~= skinData.DesiredTransparency then
				default.Transparency = skinData.DesiredTransparency;
			end;
			if skinData.DesiredTextureID ~= nil and default.TextureID ~= skinData.DesiredTextureID then
				default.TextureID = skinData.DesiredTextureID;
			end;
		end;
	end;

	RemoveSkinFromTool = function(Tool)
		if not Tool or not AppliedSkins[Tool] then return end;
		CleanKnife(Tool);
		local original = AppliedSkins[Tool];
		if original.Connections then
			for _, connection in next, original.Connections do
				if connection and connection.Connected then
					connection:Disconnect();
				end;
			end;
		end;
		for _, child in next, original.ClonedChildren or {} do
			if child and child.Parent then
				child:Destroy();
			end;
		end;
		if original.Default and original.Default.Parent then
			for _, child in next, original.Default:GetChildren() do
				if child.Name == '\0' then
					child:Destroy();
				end;
			end;
			original.Default.Transparency = original.OriginalTransparency or 0;
			original.Default.TextureID = original.OriginalTextureID or '';
		end;
		if original.ShootSoundOriginals then
			for sound, soundId in next, original.ShootSoundOriginals do
				if sound and sound.Parent and soundId then
					sound.SoundId = soundId;
				end;
			end;
		elseif original.ShootSound and original.OriginalShootSoundId then
			original.ShootSound.SoundId = original.OriginalShootSoundId;
		end;
		local Handle = Tool:FindFirstChild('Handle');
		if Handle then
			Handle:SetAttribute('SkinName', original.OriginalSkinName or '');
		end;
		AppliedSkins[Tool] = nil;
	end;

	local function ScheduleInitialGunRefresh(Tool, SkinName)
		if not Tool or InitialGunSkinRefreshDone[Tool] then return end;
		InitialGunSkinRefreshDone[Tool] = true;
		task.delay(0.35, function()
			local skinData = AppliedSkins[Tool];
			if not skinData or skinData.SkinName ~= SkinName then
				return;
			end;
			RemoveSkinFromTool(Tool);
			ApplySkinToTool(Tool, SkinName);
		end);
	end;

	ApplySkinToTool = function(Tool, SkinName)
		if not Tool then return end;
		if AppliedSkins[Tool] and AppliedSkins[Tool].SkinName == SkinName then return end;
		local Handle = Tool:FindFirstChild('Handle');
		if not Handle then return end;
		local default = Tool:FindFirstChild('Default');
		if not default or not default:IsA('MeshPart') then
			default = Handle:FindFirstChildOfClass('MeshPart');
			if not default then
				for _, child in next, Tool:GetDescendants() do
					if child:IsA('MeshPart') then
						default = child;
						break;
					end;
				end;
			end;
		end;
		if not default then return end;
		local ShootSound = FindShootSoundInstance(Tool);
		if AppliedSkins[Tool] then
			RemoveSkinFromTool(Tool);
		end;
		AppliedSkins[Tool] = {
			SkinName = SkinName,
			OriginalTextureID = default.TextureID,
			OriginalTransparency = default.Transparency,
			OriginalSkinName = Handle:GetAttribute('SkinName') or '',
			Default = default,
			ShootSound = ShootSound,
			OriginalShootSoundId = ShootSound and ShootSound.SoundId or nil,
			ShootSoundOriginals = ShootSound and { [ShootSound] = ShootSound.SoundId } or {},
			ClonedChildren = {},
			Connections = {},
			DesiredTextureID = default.TextureID,
			DesiredTransparency = default.Transparency,
			HideDefault = false,
		};
		Handle:SetAttribute('SkinName', SkinName);
		local attrConn = Handle:GetAttributeChangedSignal('SkinName'):Connect(function()
			if Handle:GetAttribute('SkinName') ~= SkinName then
				Handle:SetAttribute('SkinName', SkinName);
			end;
		end);
		table.insert(AppliedSkins[Tool].Connections, attrConn);
		local isKnife = Tool.Name:lower():find('knife') ~= nil or Tool.Name == '[Knife]';
		local weaponName = Tool.Name:lower():sub(2, -2);
		local skinInfo = GetSkinInfo(Tool.Name, SkinName);
		local textureOnlySkin = not isKnife and skinInfo and type(skinInfo.TextureID) == 'string' and skinInfo.TextureID ~= '';
		if not isKnife and not skinInfo then
			PendingSkinReprocess[Tool] = SkinName;
			task.defer(LoadSkinData);
			BindShootSoundForSkin(Tool);
			return;
		end;
		if not isKnife then
			for _, child in next, Tool:GetChildren() do
				if child:IsA('MeshPart') and child ~= default and child ~= Handle then
					child:Destroy();
				end;
			end;
			for _, child in next, default:GetChildren() do
				if child:IsA('MeshPart') then
					child:Destroy();
				end;
			end;
			default.Transparency = AppliedSkins[Tool].OriginalTransparency or 0;
			default.TextureID = AppliedSkins[Tool].OriginalTextureID or '';
		end;
		local mesh = nil;
		if not isKnife and skinInfo and skinInfo.TextureID and not textureOnlySkin then
			local tv = skinInfo.TextureID;
			if typeof(tv) == 'Instance' then
				if tv:IsA('MeshPart') then
					mesh = tv;
				elseif tv:IsA('Model') or tv:IsA('Folder') then
					mesh = tv:GetChildren();
				end;
			end;
		end;
		if not isKnife and not mesh and not textureOnlySkin and SkinModules and typeof(SkinModules) == 'Instance' then
			local MeshesFolder = SkinModules:FindFirstChild('Meshes');
			if MeshesFolder then
				local skinFolder = MeshesFolder:FindFirstChild(SkinName)
					or MeshesFolder:FindFirstChild(SkinName:gsub(' ', ''))
					or MeshesFolder:FindFirstChild(SkinName:gsub(' ', '_'))
					or MeshesFolder:FindFirstChild(SkinName:gsub('-', ' '))
					or MeshesFolder:FindFirstChild(SkinName:gsub('-', ''));
				if skinFolder then
					if skinFolder:IsA('MeshPart') then
						mesh = skinFolder;
					else
						mesh = skinFolder:GetChildren();
					end;
				end;
			end;
			if not mesh then
				local GunModels = SkinModules:FindFirstChild('GunModels');
				if GunModels then
					local model = GunModels:FindFirstChild(SkinName)
						or GunModels:FindFirstChild('[' .. SkinName .. ']')
						or GunModels:FindFirstChild(SkinName:gsub('-', ' '))
						or GunModels:FindFirstChild(SkinName:gsub('-', ''));
					if model then
						if model:IsA('MeshPart') then
							mesh = model;
						elseif model:IsA('Model') then
							mesh = model:FindFirstChildOfClass('MeshPart');
						end;
					end;
				end;
			end;
		end;
		local skinMesh = nil;
		if mesh and not isKnife then
			if typeof(mesh) == 'Instance' and mesh:IsA('MeshPart') then
				skinMesh = mesh;
			elseif type(mesh) == 'table' then
				for _, child in next, mesh do
					if typeof(child) == 'Instance' and child:IsA('MeshPart') then
						local lowered = child.Name:lower();
						if lowered:find('rpg') and weaponName == 'rpg' then
							skinMesh = child; break;
						elseif lowered:find('aug') and weaponName == 'aug' then
							skinMesh = child; break;
						elseif lowered:find('tac') and weaponName == 'tacticalshotgun' then
							skinMesh = child; break;
						elseif lowered:find('rev') and weaponName == 'revolver' then
							skinMesh = child; break;
						elseif (lowered:find('db') or lowered:find('double')) and (weaponName == 'double-barrel sg' or weaponName == 'double-barrelsg') then
							skinMesh = child; break;
						elseif lowered:find('rifle') and weaponName == 'rifle' then
							skinMesh = child; break;
						elseif lowered:find('flame') and weaponName == 'flamethrower' then
							skinMesh = child; break;
						end;
					end;
				end;
				if not skinMesh then
					for _, child in next, mesh do
						if typeof(child) == 'Instance' and child:IsA('MeshPart') then
							skinMesh = child;
							break;
						end;
					end;
				end;
			end;
		end;
		local hidDefault = false;
		if skinMesh and not isKnife then
			local newFake = skinMesh:Clone();
			newFake.Anchored = false;
			newFake.CanCollide = false;
			newFake.CFrame = default.CFrame;
			local skinCFrame = (skinInfo and skinInfo.CFrame and typeof(skinInfo.CFrame) == 'CFrame') and skinInfo.CFrame or CFrame.new();
			local weld = Instance.new('Weld');
			weld.Part0 = newFake;
			weld.Part1 = default;
			weld.C0 = skinCFrame:Inverse();
			weld.Name = '\0';
			weld.Parent = newFake;
			newFake.Name = '\0';
			newFake.Parent = Tool;
			default.Transparency = 1;
			hidDefault = true;
			if AppliedSkins[Tool] then
				AppliedSkins[Tool].HideDefault = true;
				AppliedSkins[Tool].DesiredTransparency = 1;
				AppliedSkins[Tool].DesiredTextureID = AppliedSkins[Tool].OriginalTextureID or '';
				table.insert(AppliedSkins[Tool].ClonedChildren, newFake);
			end;
		elseif not isKnife and skinInfo then
			local textureValue = skinInfo.TextureID;
			if textureValue then
				if typeof(textureValue) == 'Instance' and textureValue:IsA('MeshPart') then
					local clone = textureValue:Clone();
					clone.Anchored = false;
					clone.CanCollide = false;
					clone.CFrame = default.CFrame;
					clone.Name = '\0';
					clone.Parent = Tool;
					local skinCFrame = (skinInfo.CFrame and typeof(skinInfo.CFrame) == 'CFrame') and skinInfo.CFrame or CFrame.new();
					local weld = Instance.new('Weld');
					weld.Part0 = clone;
					weld.Part1 = default;
					weld.C0 = skinCFrame:Inverse();
					weld.Name = '\0';
					weld.Parent = clone;
					default.Transparency = 1;
					hidDefault = true;
					if AppliedSkins[Tool] then
						AppliedSkins[Tool].HideDefault = true;
						AppliedSkins[Tool].DesiredTransparency = 1;
						AppliedSkins[Tool].DesiredTextureID = AppliedSkins[Tool].OriginalTextureID or '';
						table.insert(AppliedSkins[Tool].ClonedChildren, clone);
					end;
				elseif type(textureValue) == 'string' then
					default.TextureID = textureValue;
					default.Transparency = 0;
					if AppliedSkins[Tool] then
						AppliedSkins[Tool].HideDefault = false;
						AppliedSkins[Tool].DesiredTransparency = 0;
						AppliedSkins[Tool].DesiredTextureID = textureValue;
					end;
				end;
			end;
		end;
		if not isKnife and AppliedSkins[Tool] then
			local function StripIntruders()
				if not AppliedSkins[Tool] then return end;
				ReapplyGunSkinState(Tool);
			end;
			local function IsOurs(nm)
				return #nm == 0 or nm == '\0';
			end;
			local addConn = Tool.ChildAdded:Connect(function(c)
				if c:IsA('MeshPart') and not IsOurs(c.Name) and c ~= default and c ~= Handle then
					task.defer(StripIntruders);
				end;
			end);
			table.insert(AppliedSkins[Tool].Connections, addConn);
			local defAddConn = default.ChildAdded:Connect(function(c)
				if c:IsA('MeshPart') and not IsOurs(c.Name) then
					task.defer(StripIntruders);
				end;
			end);
			table.insert(AppliedSkins[Tool].Connections, defAddConn);
			if hidDefault then
				local transConn = default:GetPropertyChangedSignal('Transparency'):Connect(function()
					if AppliedSkins[Tool] and default.Transparency ~= 1 then
						default.Transparency = 1;
					end;
				end);
				table.insert(AppliedSkins[Tool].Connections, transConn);
			else
				local transConn = default:GetPropertyChangedSignal('Transparency'):Connect(function()
					local skinData = AppliedSkins[Tool];
					if skinData and skinData.DesiredTransparency ~= nil and default.Transparency ~= skinData.DesiredTransparency then
						default.Transparency = skinData.DesiredTransparency;
					end;
				end);
				table.insert(AppliedSkins[Tool].Connections, transConn);
			end;
			local textureConn = default:GetPropertyChangedSignal('TextureID'):Connect(function()
				if AppliedSkins[Tool] and default.TextureID ~= AppliedSkins[Tool].DesiredTextureID then
					default.TextureID = AppliedSkins[Tool].DesiredTextureID or '';
				end;
			end);
			table.insert(AppliedSkins[Tool].Connections, textureConn);
			task.defer(StripIntruders);
			task.delay(0.1, function()
				if AppliedSkins[Tool] then
					ReapplyGunSkinState(Tool);
				end;
			end);
			task.delay(0.35, function()
				if AppliedSkins[Tool] then
					ReapplyGunSkinState(Tool);
				end;
			end);
		end;
		for _, child in next, Handle:GetChildren() do
			if #child.Name == 0 then
				child:Destroy();
			end;
		end;
		if SkinAssets then
			local GunHandleParticle = SkinAssets:FindFirstChild('GunHandleParticle');
			if GunHandleParticle then
				local particleFolder = GunHandleParticle:FindFirstChild(SkinName)
					or GunHandleParticle:FindFirstChild(SkinName:gsub('-', ' '))
					or GunHandleParticle:FindFirstChild(SkinName:gsub('-', ''));
				if particleFolder then
					local emitter = particleFolder:FindFirstChildOfClass('ParticleEmitter');
					if emitter then
						local clonedParticle = emitter:Clone();
						clonedParticle.Parent = Handle;
						clonedParticle.Name = '\0';
						table.insert(AppliedSkins[Tool].ClonedChildren, clonedParticle);
					end;
				end;
			end;
		end;
		if isKnife and SkinAssets then
			local SkinScripts = SkinAssets:FindFirstChild('SkinScripts');
			if SkinScripts then
				for _, folder in next, SkinScripts:GetChildren() do
					if folder.Name:lower():gsub(' ', '') == SkinName:lower():gsub(' ', '') then
						local sound = folder:FindFirstChildOfClass('Sound');
						if sound then
							local cloned = sound:Clone();
							cloned.Name = '\0';
							cloned.Parent = Handle;
							cloned:Play();
							game.Debris:AddItem(cloned, 3);
						end;
						for _, obj in next, folder:GetDescendants() do
							if obj:IsA('Sound') or obj:IsA('StringValue') then
								local objLower = obj.Name:lower():gsub(' ', '');
								if objLower == 'equipsfx' or objLower == 'sfx' or objLower == 'equip' or objLower == 'tantoequip' then
									AppliedSkins[Tool].KnifeEquipSound = obj:IsA('Sound') and obj.SoundId or obj.Value;
								elseif objLower == 'attacksfx' or objLower == 'attack' then
									AppliedSkins[Tool].KnifeAttackSound = obj:IsA('Sound') and obj.SoundId or obj.Value;
								end;
							end;
						end;
						break;
					end;
				end;
			end;
			local SkinScriptsStorage = SkinAssets:FindFirstChild('SkinScriptsStorage');
			if SkinScriptsStorage then
				for _, folder in next, SkinScriptsStorage:GetChildren() do
					if folder.Name:lower():gsub(' ', '') == SkinName:lower():gsub(' ', '') then
						for _, anim in next, folder:GetDescendants() do
							if anim:IsA('Animation') then
								local animLower = anim.Name:lower():gsub(' ', '');
								if animLower == 'knife' or animLower == 'equipknife' or animLower == 'knifeequip' or animLower == 'tantoequip' then
									AppliedSkins[Tool].KnifeEquipAnim = anim;
									break;
								end;
							end;
						end;
						break;
					end;
				end;
			end;
			local KnifeSkinAnimation = SkinAssets:FindFirstChild('KnifeSkinAnimation');
			if KnifeSkinAnimation then
				for _, folder in next, KnifeSkinAnimation:GetChildren() do
					if folder.Name:lower():gsub(' ', '') == SkinName:lower():gsub(' ', '') then
						for _, anim in next, folder:GetDescendants() do
							if anim:IsA('Animation') then
								AppliedSkins[Tool].KnifeAttackAnim = anim;
								break;
							end;
						end;
						break;
					end;
				end;
			end;
		end;
		if isKnife and SkinName:lower():gsub(' ', '') == 'goldenagetanto' then
			if not AppliedSkins[Tool].KnifeEquipAnim then
				local anim = Instance.new('Animation');
				anim.AnimationId = 'rbxassetid://13473404819';
				AppliedSkins[Tool].KnifeEquipAnim = anim;
			else
				AppliedSkins[Tool].KnifeEquipAnim.AnimationId = 'rbxassetid://13473404819';
			end;
		end;
		if isKnife and (SkinName:lower():gsub(' ', '') == 'gpoknife' or SkinName:lower():gsub(' ', '') == 'gpoknifeprestige') then
			if not AppliedSkins[Tool].KnifeEquipAnim then
				local anim = Instance.new('Animation');
				anim.AnimationId = 'rbxassetid://102007904524177';
				AppliedSkins[Tool].KnifeEquipAnim = anim;
			else
				AppliedSkins[Tool].KnifeEquipAnim.AnimationId = 'rbxassetid://102007904524177';
			end;
		end;
		BindShootSoundForSkin(Tool);
		local soundConn = Tool.DescendantAdded:Connect(function(desc)
			if desc:IsA('Sound') and (desc.Name == 'Shoot' or desc.Name == 'ShootSound') then
				task.defer(function()
					if AppliedSkins[Tool] and AppliedSkins[Tool].SkinName == SkinName then
						BindShootSoundForSkin(Tool);
					end;
				end);
			end;
		end);
		table.insert(AppliedSkins[Tool].Connections, soundConn);
		if not isKnife then
			ScheduleInitialGunRefresh(Tool, SkinName);
		end;
	end;

	function ProcessTool(Tool)
		if ToolRegistry[Tool] then return end;
		ToolRegistry[Tool] = true;
		local SkinChangerCfg = GetSkinChangerCfg();
		if not SkinChangerCfg['Enabled'] then return end;
		local Skins = SkinChangerCfg['Skins'];
		local ConfiguredSkin = Skins[Tool.Name];
		if not ConfiguredSkin then
			local stripped = Tool.Name:gsub('%[', ''):gsub('%]', '');
			ConfiguredSkin = Skins['[' .. stripped .. ']'];
		end;
		if not ConfiguredSkin or ConfiguredSkin == '' or ConfiguredSkin == 'None' then return end;
		local isKnife = Tool.Name:lower():find('knife') ~= nil or Tool.Name == '[Knife]';
		if isKnife and IsKnifeSkin(ConfiguredSkin) then
			ApplySkinToTool(Tool, ConfiguredSkin);
			local equipConn;
			equipConn = Tool.Equipped:Connect(function()
				if not AppliedSkins[Tool] then
					if equipConn then equipConn:Disconnect() end;
					return;
				end;
				local char = Tool.Parent;
				if char ~= LocalPlayer.Character then return end;
				ApplyKnife(char, Tool, ConfiguredSkin);
			end);
			if not AppliedSkins[Tool].Connections then
				AppliedSkins[Tool].Connections = {};
			end;
			table.insert(AppliedSkins[Tool].Connections, equipConn);
			if LocalPlayer.Character and Tool.Parent == LocalPlayer.Character then
				ApplyKnife(LocalPlayer.Character, Tool, ConfiguredSkin);
			end;
			if AppliedSkins[Tool] and (AppliedSkins[Tool].KnifeAttackAnim or AppliedSkins[Tool].KnifeAttackSound) then
				local attackConnection;
				attackConnection = Tool.Activated:Connect(function()
					local skinData = AppliedSkins[Tool];
					if not skinData then
						if attackConnection then attackConnection:Disconnect() end;
						return;
					end;
					if skinData.KnifeAttackSound then
						local sound = Instance.new('Sound');
						sound.SoundId = skinData.KnifeAttackSound;
						sound.Volume = 1;
						sound.Parent = Tool:FindFirstChild('Handle') or Tool;
						sound:Play();
						game.Debris:AddItem(sound, 3);
					end;
					if skinData.KnifeAttackAnim then
						local Character = LocalPlayer.Character;
						if Character then
							local Humanoid = Character:FindFirstChildOfClass('Humanoid');
							if Humanoid then
								local Animator = Humanoid:FindFirstChildOfClass('Animator');
								if not Animator then
									Animator = Instance.new('Animator');
									Animator.Parent = Humanoid;
								end;
								local anim = Instance.new('Animation');
								anim.AnimationId = skinData.KnifeAttackAnim.AnimationId;
								local track = Animator:LoadAnimation(anim);
								track.Priority = Enum.AnimationPriority.Action;
								track:Play();
								anim:Destroy();
							end;
						end;
					end;
				end);
				table.insert(AppliedSkins[Tool].Connections, attackConnection);
			end;
		else
			ApplySkinToTool(Tool, ConfiguredSkin);
			Tool.Equipped:Connect(function()
				local char = Tool.Parent;
				if char ~= LocalPlayer.Character then return end;
				ApplySkinToTool(Tool, ConfiguredSkin);
			end);
			if LocalPlayer.Character and Tool.Parent == LocalPlayer.Character then
				ApplySkinToTool(Tool, ConfiguredSkin);
			end;
		end;
	end;

	function ProcessCharacter(Character)
		if not Character then return end;
		for _, Child in next, Character:GetChildren() do
			if Child:IsA('Tool') then
				ProcessTool(Child);
			end;
		end;
		Character.ChildAdded:Connect(function(Child)
			if Child:IsA('Tool') then
				Wait(0.1);
				ProcessTool(Child);
			end;
		end);
	end;

	function ProcessBackpack(Backpack)
		if not Backpack then return end;
		for _, Tool in next, Backpack:GetChildren() do
			if Tool:IsA('Tool') then
				ProcessTool(Tool);
			end;
		end;
		Backpack.ChildAdded:Connect(function(Tool)
			if Tool:IsA('Tool') then
				Wait(0.1);
				ProcessTool(Tool);
			end;
		end);
	end;

	task.spawn(LoadSkinData);
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
	local Backpack = LocalPlayer:FindFirstChild('Backpack') or LocalPlayer:WaitForChild('Backpack', 5);
	ProcessCharacter(Character);
	if Backpack then ProcessBackpack(Backpack) end;
	LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
		Wait(0.5);
		ProcessCharacter(NewCharacter);
		local NewBackpack = LocalPlayer:FindFirstChild('Backpack') or LocalPlayer:WaitForChild('Backpack', 5);
		if NewBackpack then ProcessBackpack(NewBackpack) end;
	end);

	local function GetConfiguredSkinFor(Tool)
		local SkinChangerCfg = GetSkinChangerCfg();
		if not SkinChangerCfg or not SkinChangerCfg['Enabled'] then return nil end;
		local Skins = SkinChangerCfg['Skins'];
		local ConfiguredSkin = Skins[Tool.Name];
		if not ConfiguredSkin then
			local stripped = Tool.Name:gsub('%[', ''):gsub('%]', '');
			ConfiguredSkin = Skins['[' .. stripped .. ']'];
		end;
		if not ConfiguredSkin or ConfiguredSkin == '' or ConfiguredSkin == 'None' then return nil end;
		return ConfiguredSkin;
	end;

	local function ReapplySkinChangerTools()
		local function reapplyContainer(Container)
			if not Container then return end;
			for _, Tool in next, Container:GetChildren() do
				if Tool:IsA('Tool') then




					local NewSkin = GetConfiguredSkinFor(Tool);
					local CurrentSkin = AppliedSkins[Tool] and AppliedSkins[Tool].SkinName or nil;
					if NewSkin ~= CurrentSkin then
						ToolRegistry[Tool] = nil;
						InitialGunSkinRefreshDone[Tool] = nil;
						pcall(function() RemoveSkinFromTool(Tool) end);
						pcall(function() ProcessTool(Tool) end);
					end;
				end;
			end;
		end;
		reapplyContainer(LocalPlayer.Character);
		reapplyContainer(LocalPlayer:FindFirstChild('Backpack'));
	end;

	local PreviousReapplyAllSkins = ReapplyAllSkins;
	ReapplyAllSkins = function()
		if PreviousReapplyAllSkins then PreviousReapplyAllSkins() end;
		ReapplySkinChangerTools();
	end;
end;

do
	KOConnection = nil;
	function SetupAntiStomp(Character)
		if KOConnection then KOConnection:Disconnect(); KOConnection = nil end;
		local BodyEffects = Character:WaitForChild('BodyEffects', 5);
		if not BodyEffects then return end;
		local KO = BodyEffects:WaitForChild('K.O', 5);
		if not KO then return end;
		KOConnection = KO.Changed:Connect(function(Knocked)
			local AntiStompCfg = GetConfig()['Anti Stomp'];
			if not AntiStompCfg or not AntiStompCfg['Enabled'] then return end;
			if not Knocked then return end;
			local HRP = Character:FindFirstChild('HumanoidRootPart');
			if not HRP then return end;
			HRP.CFrame = CFrameNew(0, -2147483647, 0);
			HRP.Velocity = Vector3New(65536, 65534, 65536);
			local Humanoid = Character:FindFirstChildOfClass('Humanoid');
			if Humanoid then
				for _ = 1, 10 do
					Humanoid.Health = 0;
					Wait();
				end;
			end;
		end);
	end;
	if LocalPlayer.Character then Spawn(SetupAntiStomp, LocalPlayer.Character) end;
	LocalPlayer.CharacterAdded:Connect(SetupAntiStomp);
end;

do 
	function GetMiscGunCfg() return GetConfig()['Modifications']['Misc Gun Modifications'] end;
	CurrentCamera = Workspace.CurrentCamera;
	SavedCFrame = CurrentCamera.CFrame;
	RestorePending = false;

	function QueueRestore()
		if RestorePending then return end;
		RestorePending = true;
		Defer(function()
			if RestorePending then
				CurrentCamera.CFrame = SavedCFrame;
				RestorePending = false;
			end;
		end);
	end;

	RunService.RenderStepped:Connect(function()
		CurrentCamera = Workspace.CurrentCamera;
		if not RestorePending then
			SavedCFrame = CurrentCamera.CFrame;
		end;
	end);

	local MainRemote = ReplicatedStorage:FindFirstChild('MainEvent');
	if MainRemote and MainRemote:IsA('RemoteEvent') then
		MainRemote.OnClientEvent:Connect(function(Packet)
			if Packet == 'ShootingRecoil' and GetMiscGunCfg()['No Recoil'] then
				QueueRestore();
			end;
		end);
	end;

	local function HookGunShot(Character)
		local BodyEffects = Character:WaitForChild('BodyEffects', 5);
		if not BodyEffects then return end;
		local GunShotChanges = BodyEffects:FindFirstChild('GunShotChanges');
		if not GunShotChanges then return end;
		GunShotChanges.Changed:Connect(function()
			if GetMiscGunCfg()['No Recoil'] then
				QueueRestore();
			end;
		end);
	end;

	if LocalPlayer.Character then Spawn(HookGunShot, LocalPlayer.Character) end;
	LocalPlayer.CharacterAdded:Connect(function(Char) Spawn(HookGunShot, Char) end);
end;

do
	local CharCfg = GetConfig()['Char'] or {};
	local CharSize = CharCfg['Body Size'] or {};
	local CharSizeProfiles = {
		Skinny = {
			width = 0.52,
			depth = 0.52,
			height = 1.00,
			head = 1.00,
			proportion = 1.00,
			bodyType = 0.00,
		},
		Normal = {
			width = 1.00,
			depth = 1.00,
			height = 1.00,
			head = 1.00,
			proportion = 1.00,
			bodyType = 0.00,
		},
		Fat = {
			width = 1.50,
			depth = 1.50,
			height = 1.00,
			head = 1.00,
			proportion = 1.00,
			bodyType = 0.00,
		},
	};
	local CharSizeProfile = CharSizeProfiles[CharSize['Mode']] or CharSizeProfiles.Skinny;
	local CONFIG = {
		target = CharCfg['Target'] or '',
		charchanger = {
			enabled = CharCfg['Enabled'] == true and CharSize['Enabled'] ~= false,
			width = CharSizeProfile.width,
			depth = CharSizeProfile.depth,
			height = CharSizeProfile.height,
			head = CharSizeProfile.head,
			proportion = CharSizeProfile.proportion,
			bodyType = CharSizeProfile.bodyType,
			targetScales = nil,
			enforceIntervalSeconds = 0.8,
		},
	}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local InsertService = game:GetService("InsertService")

local localPlayer = Players.LocalPlayer
local targetUserId = nil
local appearanceChildConn = nil
local appearanceScaleValueConns = {}
local characterAddedConn = nil
local standaloneAppearanceConn = nil
local applySerial = 0

local AVATAR_CACHE_TTL_SECONDS = 20
local RESOLVED_USERID_TTL_SECONDS = 600
local faceTextureCache = {}  
local faceTextureCacheTime = {}  
local descriptionCache = {}
local appearanceModelCache = {}
local appearanceInfoCache = {}
local resolvedUserIdCache = {}
local resolvedUserIdCacheTime = {}
local CACHE_MAX_ENTRIES = {
    faceTexture = 80,
    description = 40,
    appearanceModel = 24,
    appearanceInfo = 60,
    resolvedUserId = 120,
    animationSet = 64,
    emoteData = 80,
}

local okEnv, env = pcall(function() return getgenv() end)
local stateKey = "__CopyOutfitState"
local prevState = nil
if okEnv and env then
    prevState = env[stateKey]
    if prevState and type(prevState.teardown) == "function" then
        pcall(prevState.teardown)
    end
end
local runtimeState = {
    currentUserId = nil,
    active = CharCfg['Enabled'] == true,
    teardown = nil,
    colorSnapshot = nil,
    guiIdentity = nil,
}
if okEnv and env then
    env[stateKey] = runtimeState
end

local COPY_CLASSES = { "Shirt", "Pants", "ShirtGraphic", "Accessory", "Hat", "BodyColors", "CharacterMesh" }
local COPY_CLASS_SET = {}
for _, cls in ipairs(COPY_CLASSES) do COPY_CLASS_SET[cls] = true end

local SCALE_VALUE_NAMES = {
    "BodyHeightScale","BodyWidthScale","BodyDepthScale",
    "HeadScale","BodyTypeScale","BodyProportionScale",
}

local SCALE_VALUE_SET = {}
for _, scaleName in ipairs(SCALE_VALUE_NAMES) do
    SCALE_VALUE_SET[scaleName] = true
end

local COPY_ANIMATION_FIELDS = {
    "ClimbAnimation","FallAnimation","IdleAnimation",
    "JumpAnimation","RunAnimation","SwimAnimation","WalkAnimation",
}

local BODY_PART_NAMES = {
    "Head",
    "Torso","UpperTorso","LowerTorso",
    "LeftArm","RightArm","LeftLeg","RightLeg",
    "LeftUpperArm","LeftLowerArm","LeftHand",
    "RightUpperArm","RightLowerArm","RightHand",
    "LeftUpperLeg","LeftLowerLeg","LeftFoot",
    "RightUpperLeg","RightLowerLeg","RightFoot",
}

local HEADLESS_HEAD_ASSET_ID = 134082579
local KORBLOX_RIGHT_LEG_ASSET_ID = 139607718
local KORBLOX_PARTS = {
    RightLowerLeg = { mesh = 902942093, hidden = true },
    RightUpperLeg = { mesh = 902942096, texture = 902843398 },
    RightFoot = { mesh = 902942089, hidden = true },
}

local function getCharAppearanceConfig()
    local config = GetConfig()['Char']
    return config or CharCfg or {}
end

local function isCharAppearanceOptionEnabled(name)
    local config = getCharAppearanceConfig()
    local accessories = config['Accessories']
    if type(accessories) == "table" then
        return accessories['Enabled'] == true and accessories[name] == true
    end
    return config[name] == true
end

local function applyCharOptionsToDescription(description)
    if not description then return nil end
    if isCharAppearanceOptionEnabled('Headless') then
        pcall(function() description.Head = HEADLESS_HEAD_ASSET_ID end)
        pcall(function() description.Face = 0 end)
    end
    if isCharAppearanceOptionEnabled('Korblox') then
        pcall(function() description.RightLeg = KORBLOX_RIGHT_LEG_ASSET_ID end)
    end
    return description
end

local function purgeHeadFaces(head)
    if not head then return end
    for _, child in ipairs(head:GetChildren()) do
        if child:IsA("Decal") then
            child.Transparency = 1
        end
    end
end

local function applyConfiguredHeadless(char)
    if not isCharAppearanceOptionEnabled('Headless') then return end
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    head.Transparency = 1
    purgeHeadFaces(head)
end

local function applyConfiguredKorblox(char)
    if not char then return end
    local existingShell = char:FindFirstChild("PhantomShell")
    if not isCharAppearanceOptionEnabled('Korblox') then
        if existingShell then existingShell:Destroy() end
        return
    end

    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    if humanoid.RigType == Enum.HumanoidRigType.R15 then
        if existingShell then existingShell:Destroy() end
        for partName, data in pairs(KORBLOX_PARTS) do
            local part = char:FindFirstChild(partName)
            if part then
                pcall(function() part.MeshId = "rbxassetid://" .. data.mesh end)
                if data.texture then
                    pcall(function() part.TextureID = "rbxassetid://" .. data.texture end)
                end
                if data.hidden then
                    part.Transparency = 1
                end
            end
        end
        return
    end

    local base = char:FindFirstChild("Right Leg")
    if not base then return end
    base.Transparency = 1
    if existingShell then existingShell:Destroy() end

    local shell = Instance.new("Part")
    shell.Name = "PhantomShell"
    shell.Size = Vector3.new(1, 2, 1)
    shell.CanCollide = false
    shell.CanTouch = false
    shell.Massless = true
    shell.CFrame = base.CFrame * CFrame.new(0, 0.75, 0)
    shell.Parent = char

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = shell
    weld.Part1 = base
    weld.Parent = shell

    local mesh = Instance.new("SpecialMesh")
    mesh.MeshType = Enum.MeshType.FileMesh
    mesh.MeshId = "rbxassetid://902942093"
    mesh.TextureId = "rbxassetid://902843398"
    mesh.Scale = Vector3.new(0.85, 1.25, 0.85)
    mesh.Parent = shell
end

local function applyConfiguredCharBodyOptions(char)
    applyConfiguredHeadless(char)
    applyConfiguredKorblox(char)
end

local function applyConfiguredCharAnimations(char, userId)
    local config = getCharAppearanceConfig()
    if config['Override Animation'] == true then
        local applyAnimationChanger = shared.__CiderApplyAnimationChanger
        if type(applyAnimationChanger) == "function" then
            applyAnimationChanger(char, true)
        end
        return
    end
    if typeof(mimicAnimationsFromUserId) == "function" then
        mimicAnimationsFromUserId(userId, true)
    end
end

local function bindStandaloneCharBodyOptions(char)
    if standaloneAppearanceConn then
        standaloneAppearanceConn:Disconnect()
        standaloneAppearanceConn = nil
    end
    if not char then return end

    applyConfiguredCharBodyOptions(char)
    standaloneAppearanceConn = char.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("Decal") and descendant.Parent and descendant.Parent.Name == "Head" then
            if isCharAppearanceOptionEnabled('Headless') then
                descendant.Transparency = 1
            end
            return
        end

        local name = descendant.Name
        if name == "Head" or name == "Humanoid" or name == "Right Leg" or KORBLOX_PARTS[name] then
            task.defer(function()
                if char.Parent then applyConfiguredCharBodyOptions(char) end
            end)
        end
    end)
end

local function applyStandaloneCharBodyOptions(char)
    bindStandaloneCharBodyOptions(char)
    for _, delaySeconds in ipairs({ 0.1, 0.35, 0.75, 1.5 }) do
        task.delay(delaySeconds, function()
            if char.Parent then applyConfiguredCharBodyOptions(char) end
        end)
    end
end

local function bindConfiguredHeadlessFaceWatcher(head)
    if not head or not isCharAppearanceOptionEnabled('Headless') then return end
    local connection = head.ChildAdded:Connect(function(child)
        if child:IsA("Decal") then
            child.Transparency = 1
        end
    end)
    appearanceScaleValueConns[#appearanceScaleValueConns + 1] = connection
end

local function disconnectAppearanceHooks()
    if appearanceChildConn  then appearanceChildConn:Disconnect();  appearanceChildConn = nil end
    for i = #appearanceScaleValueConns, 1, -1 do
        local conn = appearanceScaleValueConns[i]
        if conn and conn.Connected then conn:Disconnect() end
        appearanceScaleValueConns[i] = nil
    end
end

local function isCopyClass(className)      return COPY_CLASS_SET[className] == true end
local function shouldCloneClass(className) return isCopyClass(className) and className ~= "BodyColors" end
local function isAccessoryClass(className) return className == "Accessory" or className == "Hat" end

local function buildBasePartMap(model)
    local out = {}
    if not model then return out end
    for _, child in ipairs(model:GetChildren()) do
        if child:IsA("BasePart") then
            out[child.Name] = child
        end
    end
    return out
end

local function buildAttachmentCarrierMap(partMap)
    local carrier = {}
    for partName, part in pairs(partMap or {}) do
        for _, child in ipairs(part:GetChildren()) do
            if child:IsA("Attachment") then
                local prev = carrier[child.Name]
                if prev == nil then
                    carrier[child.Name] = partName
                elseif prev ~= partName then
                    carrier[child.Name] = false
                end
            end
        end
    end
    return carrier
end

countMapEntries = nil
pruneTimestampedCache = nil
prunePairedTimestampCache = nil
cacheGetTimed = nil
cacheSetTimed = nil
cacheGetEntry = nil
cacheSetEntry = nil

local function firstDecalTextureFromHead(head)
    if not head then return nil end
    for _, child in ipairs(head:GetChildren()) do
        if child:IsA("Decal") and child.Face == Enum.NormalId.Front and child.Texture ~= "" then
            return child.Texture
        end
    end
    for _, child in ipairs(head:GetChildren()) do
        if child:IsA("Decal") and child.Texture ~= "" then return child.Texture end
    end
    return nil
end

local function cacheFaceTexture(userId, texture)
    if texture and texture ~= "" then
        cacheSetTimed(faceTextureCache, faceTextureCacheTime, userId, texture, CACHE_MAX_ENTRIES.faceTexture)
    end
    return texture
end

local function resolveFaceFromAssetId(assetId, userId)
    local okAsset, assetModel = pcall(function() return InsertService:LoadAsset(assetId) end)
    if okAsset and assetModel then
        local foundTexture = nil
        for _, inst in ipairs(assetModel:GetDescendants()) do
            if inst:IsA("Decal") and inst.Texture ~= "" then
                foundTexture = inst.Texture
                break
            end
        end
        assetModel:Destroy()
        if foundTexture then return cacheFaceTexture(userId, foundTexture) end
    end
    return cacheFaceTexture(userId, "rbxassetid://" .. tostring(assetId))
end

countMapEntries = function(map)
    local count = 0
    for _ in pairs(map) do count = count + 1 end
    return count
end

pruneTimestampedCache = function(cache, maxEntries, onEvict)
    local count = countMapEntries(cache)
    while count > maxEntries do
        local oldestKey, oldestTs = nil, math.huge
        for k, entry in pairs(cache) do
            local ts = (entry and entry.timestamp) or 0
            if ts < oldestTs then
                oldestTs = ts
                oldestKey = k
            end
        end
        if oldestKey == nil then break end
        local evicted = cache[oldestKey]
        cache[oldestKey] = nil
        if onEvict then onEvict(oldestKey, evicted) end
        count = count - 1
    end
end

prunePairedTimestampCache = function(valueCache, timeCache, maxEntries)
    local count = countMapEntries(valueCache)
    while count > maxEntries do
        local oldestKey, oldestTs = nil, math.huge
        for k in pairs(valueCache) do
            local ts = timeCache[k] or 0
            if ts < oldestTs then
                oldestTs = ts
                oldestKey = k
            end
        end
        if oldestKey == nil then break end
        valueCache[oldestKey] = nil
        timeCache[oldestKey] = nil
        count = count - 1
    end
end

function cacheGetTimedNow(valueCache, timeCache, key, ttlSeconds)
    local value = valueCache[key]
    local ts = timeCache[key]
    if value ~= nil and ts and os.clock() - ts <= ttlSeconds then
        return value
    end
    if value ~= nil then valueCache[key] = nil end
    if ts ~= nil then timeCache[key] = nil end
    return nil
end

function cacheSetTimedNow(valueCache, timeCache, key, value, maxEntries)
    valueCache[key] = value
    timeCache[key] = os.clock()
    prunePairedTimestampCache(valueCache, timeCache, maxEntries)
    return value
end

function cacheGetEntryNow(cache, key, ttlSeconds, onExpire)
    local entry = cache[key]
    if not entry then return nil end
    if os.clock() - (entry.timestamp or 0) <= ttlSeconds then return entry end
    if onExpire then onExpire(entry) end
    cache[key] = nil
    return nil
end

function cacheSetEntryNow(cache, key, entry, maxEntries, onEvict)
    cache[key] = entry
    pruneTimestampedCache(cache, maxEntries, onEvict)
    return entry
end

cacheGetTimed = cacheGetTimedNow
cacheSetTimed = cacheSetTimedNow
cacheGetEntry = cacheGetEntryNow
cacheSetEntry = cacheSetEntryNow

function getCharacterAppearanceModel(userId)
    local entry = cacheGetEntry(appearanceModelCache, userId, AVATAR_CACHE_TTL_SECONDS, function(expired)
        if expired and expired.model then
            pcall(function() expired.model:Destroy() end)
        end
    end)
    if entry and entry.model then
        local okClone, clone = pcall(function() return entry.model:Clone() end)
        if okClone and clone then return clone end
    end

    local ok, model = false, nil
    for attempt = 1, 2 do
        local okAttempt, result = pcall(function() return Players:GetCharacterAppearanceAsync(userId) end)
        if okAttempt and result then
            ok, model = true, result
            break
        end
        if attempt == 1 then task.wait(0.15) end
    end
    if not (ok and model) then
        return nil
    end

    local okClone, stored = pcall(function() return model:Clone() end)
    if okClone and stored then
        local prev = appearanceModelCache[userId]
        if prev and prev.model then pcall(function() prev.model:Destroy() end) end
        cacheSetEntry(appearanceModelCache, userId, { model = stored, timestamp = os.clock() }, CACHE_MAX_ENTRIES.appearanceModel, function(_, entry)
            if entry and entry.model then
                pcall(function() entry.model:Destroy() end)
            end
        end)
    end
    return model
end

function getTargetDescriptionCached(userId)
    local entry = cacheGetEntry(descriptionCache, userId, AVATAR_CACHE_TTL_SECONDS, function(expired)
        if expired and expired.desc then
            pcall(function() expired.desc:Destroy() end)
        end
    end)
    if entry and entry.desc then
        local okClone, clone = pcall(function() return entry.desc:Clone() end)
        if okClone and clone then return clone end
    end

    local okDesc, desc = pcall(function() return Players:GetHumanoidDescriptionFromUserId(userId) end)
    if not okDesc or not desc then
        return nil
    end

    local okStore, stored = pcall(function() return desc:Clone() end)
    if okStore and stored then
        local prev = descriptionCache[userId]
        if prev and prev.desc then pcall(function() prev.desc:Destroy() end) end
        cacheSetEntry(descriptionCache, userId, { desc = stored, timestamp = os.clock() }, CACHE_MAX_ENTRIES.description, function(_, entry)
            if entry and entry.desc then
                pcall(function() entry.desc:Destroy() end)
            end
        end)
    end

    local okRet, ret = pcall(function() return desc:Clone() end)
    return (okRet and ret) or desc
end

function getCharacterAppearanceInfoCached(userId)
    local entry = cacheGetEntry(appearanceInfoCache, userId, AVATAR_CACHE_TTL_SECONDS)
    if entry and entry.info then return entry.info end

    local ok, info = pcall(function() return Players:GetCharacterAppearanceInfoAsync(userId) end)
    if ok and info then
        cacheSetEntry(appearanceInfoCache, userId, { info = info, timestamp = os.clock() }, CACHE_MAX_ENTRIES.appearanceInfo)
        return info
    end
    return nil
end

function clearAvatarCaches()
    for userId, entry in pairs(descriptionCache) do
        if entry and entry.desc then pcall(function() entry.desc:Destroy() end) end
        descriptionCache[userId] = nil
    end
    for userId, entry in pairs(appearanceModelCache) do
        if entry and entry.model then pcall(function() entry.model:Destroy() end) end
        appearanceModelCache[userId] = nil
    end
    for userId in pairs(appearanceInfoCache)    do appearanceInfoCache[userId] = nil end
    for userId in pairs(faceTextureCache)       do
        faceTextureCache[userId] = nil
        faceTextureCacheTime[userId] = nil
    end
    for cacheKey in pairs(resolvedUserIdCacheTime) do
        resolvedUserIdCache[cacheKey] = nil
        resolvedUserIdCacheTime[cacheKey] = nil
    end
end

function clearCopyChildren(char)
    for _, inst in ipairs(char:GetChildren()) do
        if isCopyClass(inst.ClassName) then pcall(function() inst:Destroy() end) end
    end
end

function hasAnySourceBodyPart(model)
    for _, partName in ipairs(BODY_PART_NAMES) do
        if model:FindFirstChild(partName) then return true end
    end
    return false
end

function normalizeForLookup(value)
    local v = string.lower(tostring(value or ""))
    v = string.gsub(v, "^@", "")
    v = string.gsub(v, "%s+", "")
    v = string.gsub(v, "_+", "")
    return v
end

function findUserIdInServerByNameOrDisplay(inputText)
    local rawInput = tostring(inputText or ""):gsub("^%s+",""):gsub("%s+$","")
    local needleRaw = string.lower(rawInput)
    local needleNorm = normalizeForLookup(rawInput)
    if needleNorm == "" then return nil end

    local exactNameUserId = nil
    local exactDisplayUserId = nil
    local exactDisplayCount = 0
    local prefixCandidates = {}

    for _, player in ipairs(Players:GetPlayers()) do
        local nameRaw = string.lower(player.Name)
        local displayRaw = string.lower(player.DisplayName)
        local nameNorm = normalizeForLookup(player.Name)
        local displayNorm= normalizeForLookup(player.DisplayName)

        if nameRaw == needleRaw or nameNorm == needleNorm then
            exactNameUserId = player.UserId
            break
        end
        if displayRaw == needleRaw or displayNorm == needleNorm then
            exactDisplayUserId = player.UserId
            exactDisplayCount = exactDisplayCount + 1
        end
        local namePrefix = (needleRaw ~= "" and string.sub(nameRaw,    1, #needleRaw)    == needleRaw)
                           or string.sub(nameNorm,    1, #needleNorm)    == needleNorm
        local displayPrefix = (needleRaw ~= "" and string.sub(displayRaw, 1, #needleRaw)    == needleRaw)
                           or string.sub(displayNorm, 1, #needleNorm)    == needleNorm
        if namePrefix or displayPrefix then
            prefixCandidates[#prefixCandidates + 1] = player.UserId
        end
    end

    if exactNameUserId               then return exactNameUserId    end
    if exactDisplayCount == 1        then return exactDisplayUserId end
    if #prefixCandidates > 0         then return prefixCandidates[1] end
    if exactDisplayUserId            then return exactDisplayUserId end
    return nil
end

function resolveUserToId(userInput)
    if userInput == nil then return nil end
    if type(userInput) == "number" then return math.floor(userInput) end
    if type(userInput) ~= "string" then return nil end

    local trimmed = userInput:gsub("^%s+",""):gsub("%s+$","")
    if trimmed == "" then return nil end

    local numeric = tonumber(trimmed)
    if numeric then return math.floor(numeric) end

    local username = trimmed:gsub("^@","")
    if username == "" then return nil end

    local cacheKey = normalizeForLookup(username)
    if cacheKey == "" then return nil end

    local cachedUserId = cacheGetTimed(resolvedUserIdCache, resolvedUserIdCacheTime, cacheKey, RESOLVED_USERID_TTL_SECONDS)
    if cachedUserId then return cachedUserId end

    local inServer = findUserIdInServerByNameOrDisplay(username)
    if inServer then
        return cacheSetTimed(resolvedUserIdCache, resolvedUserIdCacheTime, cacheKey, inServer, CACHE_MAX_ENTRIES.resolvedUserId)
    end

    local ok, uid = pcall(function() return Players:GetUserIdFromNameAsync(username) end)
    if ok and uid then
        return cacheSetTimed(resolvedUserIdCache, resolvedUserIdCacheTime, cacheKey, uid, CACHE_MAX_ENTRIES.resolvedUserId)
    end
    return nil
end

if okEnv and env then
    env.__ResolveUserToIdShared = resolveUserToId
end

local function getDefaultTargetUserId()
    return resolveUserToId(CONFIG.target)
end

local guiSpoofState = {
    active = false,
    serial = 0,
    identity = nil,
    originals = setmetatable({}, { __mode = "k" }),
    identityCache = {},
    connections = {},
    boundObjects = setmetatable({}, { __mode = "k" }),
    boundRoots = setmetatable({}, { __mode = "k" }),
}

local inspectHookKey = "__CiderInspectTargetState"
local inspectHookState = okEnv and env and env[inspectHookKey] or nil
if type(inspectHookState) ~= "table" then
    inspectHookState = {
        active = false,
        targetUserId = nil,
        targetName = nil,
        targetDescription = nil,
        hookInstalled = false,
        hookVersion = 0,
    }
    if okEnv and env then env[inspectHookKey] = inspectHookState end
end
inspectHookState.refreshing = false
inspectHookState.lastRefresh = tonumber(inspectHookState.lastRefresh) or 0
local refreshAvatarVisualDescription = nil
local clearAvatarVisuals = nil

local function destroyInspectDescription()
    local description = inspectHookState.targetDescription
    inspectHookState.targetDescription = nil
    inspectHookState.preferDescription = false
    if description then pcall(function() description:Destroy() end) end
end

local function clearInspectTarget()
    inspectHookState.active = false
    inspectHookState.targetUserId = nil
    inspectHookState.targetName = nil
    inspectHookState.refreshing = false
    inspectHookState.lastRefresh = 0
    destroyInspectDescription()
end

local function setInspectTarget(userId, targetName, targetDescription)
    local numericUserId = tonumber(userId)
    if not numericUserId then return end
    local changedTarget = inspectHookState.targetUserId ~= numericUserId
    if changedTarget then
        pcall(function() GuiService:CloseInspectMenu() end)
        destroyInspectDescription()
        inspectHookState.refreshing = false
        inspectHookState.lastRefresh = 0
    end
    inspectHookState.active = true
    inspectHookState.targetUserId = numericUserId
    if targetName ~= nil then inspectHookState.targetName = tostring(targetName) end
    if targetDescription then
        applyCharOptionsToDescription(targetDescription)
        destroyInspectDescription()
        inspectHookState.targetDescription = targetDescription
        inspectHookState.preferDescription = true
    end
end

local function getInspectUserId(value)
    local numeric = tonumber(value)
    if numeric then return numeric end
    local okId, resolved = pcall(function() return value.Id or value.UserId end)
    if okId then return tonumber(resolved) end
    return nil
end

local INSPECT_HOOK_VERSION = 2
if inspectHookState.hookVersion ~= INSPECT_HOOK_VERSION then
    local hookMM = hookmetamethod or (okEnv and env and env.hookmetamethod)
    local getMethod = getnamecallmethod or (okEnv and env and env.getnamecallmethod)
    if type(hookMM) == "function" and type(getMethod) == "function" then
        local oldNamecall = nil
        local callback = function(self, ...)
            local method = getMethod()
            local state = okEnv and env and env[inspectHookKey] or inspectHookState
            if state and state.active and self == GuiService then
                local args = { ... }
                if method == "InspectPlayerFromUserId" then
                    if getInspectUserId(args[1]) == localPlayer.UserId and state.targetUserId then
                        if state.preferDescription and state.targetDescription then
                            local description = state.targetDescription
                            local targetName = state.targetName or tostring(state.targetUserId)
                            task.defer(function()
                                pcall(function() GuiService:CloseInspectMenu() end)
                                pcall(function()
                                    GuiService:InspectPlayerFromHumanoidDescription(description, targetName)
                                end)
                            end)
                            return nil
                        end
                        args[1] = state.targetUserId
                    end
                elseif method == "InspectPlayerFromHumanoidDescription" then
                    local requestedName = tostring(args[2] or "")
                    if (
                        requestedName == localPlayer.Name
                        or requestedName == localPlayer.DisplayName
                    ) and state.targetDescription then
                        args[1] = state.targetDescription
                        args[2] = state.targetName or requestedName
                    end
                end
                return oldNamecall(self, table.unpack(args))
            end
            return oldNamecall(self, ...)
        end
        local wrapped = type(newcclosure) == "function" and newcclosure(callback) or callback
        local okHook, originalNamecall = pcall(function()
            return hookMM(game, "__namecall", wrapped)
        end)
        if okHook and type(originalNamecall) == "function" then
            oldNamecall = originalNamecall
            inspectHookState.hookInstalled = true
            inspectHookState.hookVersion = INSPECT_HOOK_VERSION
        end
    end
end

local function isLocalInspectTitle(value)
    if type(value) ~= "string" then return false end
    local lowered = string.lower(value)
    local names = { localPlayer.Name, localPlayer.DisplayName }
    for _, name in ipairs(names) do
        local loweredName = string.lower(tostring(name or ""))
        if loweredName ~= "" then
            if lowered == loweredName .. "'s avatar" or lowered == loweredName .. "’s avatar" then
                return true
            end
        end
    end
    return false
end

local function requestTargetInspectRefresh()
    if not inspectHookState.active or not inspectHookState.targetUserId then return end
    local now = os.clock()
    if inspectHookState.refreshing or now - inspectHookState.lastRefresh < 1.5 then return end
    inspectHookState.refreshing = true
    inspectHookState.lastRefresh = now
    task.defer(function()
        if not inspectHookState.active or not inspectHookState.targetUserId then
            inspectHookState.refreshing = false
            return
        end
        pcall(function() GuiService:CloseInspectMenu() end)
        task.wait()
        local opened = false
        if inspectHookState.targetDescription then
            opened = pcall(function()
                GuiService:InspectPlayerFromHumanoidDescription(
                    inspectHookState.targetDescription,
                    inspectHookState.targetName or tostring(inspectHookState.targetUserId)
                )
            end)
        end
        if not opened then
            pcall(function()
                GuiService:InspectPlayerFromUserId(inspectHookState.targetUserId)
            end)
        end
        task.delay(1.25, function()
            inspectHookState.refreshing = false
        end)
    end)
end

local function refreshStandaloneInspectDescription(char)
    if runtimeState.active then return end
    if not isCharAppearanceOptionEnabled('Headless') and not isCharAppearanceOptionEnabled('Korblox') then
        clearInspectTarget()
        if refreshAvatarVisualDescription then refreshAvatarVisualDescription(nil) end
        return
    end

    task.spawn(function()
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if not humanoid and char then humanoid = char:WaitForChild("Humanoid", 10) end
        if not humanoid or not char.Parent or runtimeState.active then return end

        local description = nil
        pcall(function() description = humanoid:GetAppliedDescription() end)
        if not description then
            description = getTargetDescriptionCached(localPlayer.UserId)
        end
        if not description or runtimeState.active then return end

        applyCharOptionsToDescription(description)
        setInspectTarget(localPlayer.UserId, localPlayer.DisplayName, description)
        if refreshAvatarVisualDescription then
            refreshAvatarVisualDescription(description, localPlayer.UserId)
        end
    end)
end

local function replacePlainText(value, from, to)
    if type(value) ~= "string" or type(from) ~= "string" or from == "" then return value end
    local pattern = from:gsub("([^%w])", "%%%1")
    return value:gsub(pattern, function() return tostring(to or "") end)
end

local function isIdentityWordCharacter(character)
    return type(character) == "string" and character ~= "" and string.match(character, "[%w_]") ~= nil
end

local function replaceIdentityText(value, from, to)
    if type(value) ~= "string" or type(from) ~= "string" or from == "" then return value, false end
    local output = {}
    local cursor = 1
    local changed = false
    local firstNeedsBoundary = isIdentityWordCharacter(string.sub(from, 1, 1))
    local lastNeedsBoundary = isIdentityWordCharacter(string.sub(from, -1))
    while cursor <= #value do
        local startIndex, endIndex = string.find(value, from, cursor, true)
        if not startIndex then
            output[#output + 1] = string.sub(value, cursor)
            break
        end
        local before = startIndex > 1 and string.sub(value, startIndex - 1, startIndex - 1) or ""
        local after = endIndex < #value and string.sub(value, endIndex + 1, endIndex + 1) or ""
        local validBefore = not firstNeedsBoundary or not isIdentityWordCharacter(before)
        local validAfter = not lastNeedsBoundary or not isIdentityWordCharacter(after)
        if validBefore and validAfter then
            output[#output + 1] = string.sub(value, cursor, startIndex - 1)
            output[#output + 1] = tostring(to or "")
            cursor = endIndex + 1
            changed = true
        else
            output[#output + 1] = string.sub(value, cursor, startIndex)
            cursor = startIndex + 1
        end
    end
    return table.concat(output), changed
end

local function addIdentityReplacement(list, seen, from, to)
    if type(from) ~= "string" or from == "" or seen[from] then return end
    seen[from] = true
    list[#list + 1] = { from = from, to = tostring(to or "") }
end

local function buildIdentityReplacements(identity)
    local replacements = {}
    local seen = {}
    local function addVariants(from, to)
        addIdentityReplacement(replacements, seen, from, to)
        addIdentityReplacement(replacements, seen, string.lower(from), string.lower(to))
        addIdentityReplacement(replacements, seen, string.upper(from), string.upper(to))
    end
    addVariants("@" .. localPlayer.Name, "@" .. identity.username)
    addVariants(localPlayer.DisplayName, identity.displayName)
    addVariants(localPlayer.Name, identity.username)
    table.sort(replacements, function(a, b) return #a.from > #b.from end)
    return replacements
end

local function getThumbnailContent(userId, thumbnailType, thumbnailSize)
    local ok, content = pcall(function()
        return Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
    end)
    if ok and type(content) == "string" and content ~= "" then return content end
    return nil
end

local THUMBNAIL_SPECS = {
    { Enum.ThumbnailType.HeadShot, "Size48x48", "headshot" },
    { Enum.ThumbnailType.HeadShot, "Size60x60", "headshot" },
    { Enum.ThumbnailType.HeadShot, "Size100x100", "headshot" },
    { Enum.ThumbnailType.HeadShot, "Size150x150", "headshot" },
    { Enum.ThumbnailType.HeadShot, "Size420x420", "headshot" },
    { Enum.ThumbnailType.AvatarBust, "Size150x150", "bust" },
    { Enum.ThumbnailType.AvatarBust, "Size352x352", "bust" },
    { Enum.ThumbnailType.AvatarBust, "Size420x420", "bust" },
    { Enum.ThumbnailType.AvatarThumbnail, "Size150x150", "full" },
    { Enum.ThumbnailType.AvatarThumbnail, "Size352x352", "full" },
    { Enum.ThumbnailType.AvatarThumbnail, "Size420x420", "full" },
    { Enum.ThumbnailType.AvatarThumbnail, "Size720x720", "full" },
}

local function buildThumbnailContentMap(userId)
    local map = {}
    for _, spec in ipairs(THUMBNAIL_SPECS) do
        local okSize, thumbnailSize = pcall(function() return Enum.ThumbnailSize[spec[2]] end)
        if okSize and thumbnailSize then
            local ownContent = getThumbnailContent(localPlayer.UserId, spec[1], thumbnailSize)
            local targetContent = getThumbnailContent(userId, spec[1], thumbnailSize)
            if ownContent and targetContent then map[ownContent] = targetContent end
        end
    end
    return map
end

do
local avatarVisualState = {
    serial = 0,
    active = false,
    userId = nil,
    description = nil,
    modelTemplate = nil,
    contentKinds = {},
    overlays = setmetatable({}, { __mode = "k" }),
    boundImages = setmetatable({}, { __mode = "k" }),
    boundRoots = setmetatable({}, { __mode = "k" }),
    connections = {},
}

local function disconnectAvatarVisualConnections()
    for i = #avatarVisualState.connections, 1, -1 do
        local connection = avatarVisualState.connections[i]
        avatarVisualState.connections[i] = nil
        if connection and connection.Connected then
            pcall(function() connection:Disconnect() end)
        end
    end
    avatarVisualState.boundImages = setmetatable({}, { __mode = "k" })
    avatarVisualState.boundRoots = setmetatable({}, { __mode = "k" })
end

local function removeAvatarVisualOverlay(image)
    local entry = avatarVisualState.overlays[image]
    if not entry then return end
    avatarVisualState.overlays[image] = nil
    if image and image.Parent then
        pcall(function()
            if image.ImageTransparency == 1 then
                image.ImageTransparency = entry.imageTransparency
            end
        end)
    end
    if entry.viewport then pcall(function() entry.viewport:Destroy() end) end
end

clearAvatarVisuals = function()
    avatarVisualState.active = false
    avatarVisualState.serial = avatarVisualState.serial + 1
    disconnectAvatarVisualConnections()
    for image in pairs(avatarVisualState.overlays) do
        removeAvatarVisualOverlay(image)
    end
    avatarVisualState.overlays = setmetatable({}, { __mode = "k" })
    avatarVisualState.contentKinds = {}
    avatarVisualState.userId = nil
    if avatarVisualState.modelTemplate then
        pcall(function() avatarVisualState.modelTemplate:Destroy() end)
        avatarVisualState.modelTemplate = nil
    end
    if avatarVisualState.description then
        pcall(function() avatarVisualState.description:Destroy() end)
        avatarVisualState.description = nil
    end
end

local function classifyAvatarVisualImage(image)
    if not avatarVisualState.active or not image then return nil end
    local okImage, value = pcall(function() return image.Image end)
    if not okImage or type(value) ~= "string" or value == "" then return nil end

    local kind = avatarVisualState.contentKinds[value]
    if not kind then
        local lowerValue = string.lower(value)
        local localId = tostring(localPlayer.UserId)
        local targetId = tostring(avatarVisualState.userId or "")
        if not string.find(value, localId, 1, true) and (targetId == "" or not string.find(value, targetId, 1, true)) then
            return nil
        end
        if string.find(lowerValue, "headshot", 1, true) then
            kind = "headshot"
        elseif string.find(lowerValue, "bust", 1, true) then
            kind = "bust"
        elseif string.find(lowerValue, "avatar", 1, true) or string.find(lowerValue, "thumbnail", 1, true) then
            kind = "full"
        end
    end
    if not kind then return nil end

    if kind == "full" then
        local ancestor = image
        for _ = 1, 8 do
            if not ancestor then break end
            local lowerName = string.lower(ancestor.Name or "")
            if string.find(lowerName, "playerlist", 1, true)
                or string.find(lowerName, "player_list", 1, true)
                or string.find(lowerName, "player list", 1, true)
                or string.find(lowerName, "playercard", 1, true)
                or string.find(lowerName, "playerprofile", 1, true) then
                return nil
            end
            local nearby = ancestor:GetDescendants()
            for i = 1, MathMin(#nearby, 100) do
                local item = nearby[i]
                if item:IsA("TextLabel") or item:IsA("TextButton") then
                    local okText, text = pcall(function() return string.lower(item.Text or "") end)
                    if okText and string.find(text, "in this server", 1, true) then
                        return nil
                    end
                end
            end
            ancestor = ancestor.Parent
        end
    end
    return kind
end

local function createAvatarVisualModel(description)
    local model = nil
    local okModel = pcall(function()
        model = Players:CreateHumanoidModelFromDescription(description, Enum.HumanoidRigType.R15)
    end)
    if not okModel or not model then return nil end
    for _, descendant in ipairs(model:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.Anchored = true
            descendant.CanCollide = false
            descendant.CanTouch = false
            descendant.CanQuery = false
        elseif descendant:IsA("Script") or descendant:IsA("LocalScript") then
            descendant:Destroy()
        end
    end
    local humanoid = model:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    end
    return model
end

local function getAvatarBodyFrame(model, fieldOfView)
    local minimum = nil
    local maximum = nil
    for _, child in ipairs(model:GetChildren()) do
        if child:IsA("BasePart") then
            local half = child.Size / 2
            local partMinimum = child.Position - half
            local partMaximum = child.Position + half
            minimum = minimum and Vector3New(
                MathMin(minimum.X, partMinimum.X),
                MathMin(minimum.Y, partMinimum.Y),
                MathMin(minimum.Z, partMinimum.Z)
            ) or partMinimum
            maximum = maximum and Vector3New(
                MathMax(maximum.X, partMaximum.X),
                MathMax(maximum.Y, partMaximum.Y),
                MathMax(maximum.Z, partMaximum.Z)
            ) or partMaximum
        end
    end
    if not minimum or not maximum then return nil, nil end

    local size = maximum - minimum
    local focus = (minimum + maximum) / 2
    local bodySize = MathMax(size.Y, size.X * 1.35, 4)
    local distance = bodySize / (2 * math.tan(MathRad(fieldOfView) / 2)) * 1.08
    return focus, distance
end

local function frameAvatarVisualModel(viewport, model, kind)
    local camera = Instance.new("Camera")
    camera.FieldOfView = kind == "full" and 28 or 24
    camera.Parent = viewport
    viewport.CurrentCamera = camera

    local focus = nil
    local distance = nil
    if kind == "headshot" or kind == "bust" then
        local head = model:FindFirstChild("Head")
        local upperTorso = model:FindFirstChild("UpperTorso") or model:FindFirstChild("Torso")
        if head then
            focus = head.Position + Vector3New(0, kind == "bust" and -0.35 or -0.05, 0)
            distance = kind == "bust" and 6.2 or 4.3
        elseif upperTorso then
            focus = upperTorso.Position + Vector3New(0, 0.7, 0)
            distance = 5
        end
    end

    if not focus then
        focus, distance = getAvatarBodyFrame(model, camera.FieldOfView)
    end
    if not focus then
        local root = model:FindFirstChild("HumanoidRootPart")
        focus = root and root.Position + Vector3New(0, 0.25, 0) or Vector3Zero
        distance = 12
    end

    local root = model:FindFirstChild("HumanoidRootPart")
    local front = root and root.CFrame.LookVector or Vector3New(0, 0, -1)
    camera.CFrame = CFrameNew(focus + front * distance, focus)
end

local function applyAvatarVisualToImage(image)
    if not avatarVisualState.active or not avatarVisualState.description or not image.Parent then return end
    local kind = classifyAvatarVisualImage(image)
    if not kind then
        removeAvatarVisualOverlay(image)
        return
    end

    local current = avatarVisualState.overlays[image]
    if current and current.kind == kind and current.viewport and current.viewport.Parent then return end
    removeAvatarVisualOverlay(image)

    local model = nil
    if avatarVisualState.modelTemplate then
        pcall(function() model = avatarVisualState.modelTemplate:Clone() end)
    end
    if not model then return end

    local viewport = Instance.new("ViewportFrame")
    viewport.Name = "CiderAvatarVisual"
    viewport.BackgroundTransparency = 1
    viewport.BorderSizePixel = 0
    viewport.Size = UDim2.fromScale(1, 1)
    viewport.Position = UDim2.fromScale(0, 0)
    viewport.AnchorPoint = Vector2New(0, 0)
    viewport.ZIndex = image.ZIndex + 1
    viewport.Active = false
    viewport.Ambient = Color3RGB(190, 190, 190)
    viewport.LightColor = Color3RGB(255, 255, 255)
    viewport.LightDirection = Vector3New(-1, -1, -1)

    local world = Instance.new("WorldModel")
    world.Parent = viewport
    model.Parent = world
    frameAvatarVisualModel(viewport, model, kind)

    local corner = image:FindFirstChildOfClass("UICorner")
    if corner then corner:Clone().Parent = viewport end

    local originalTransparency = image.ImageTransparency
    avatarVisualState.overlays[image] = {
        viewport = viewport,
        imageTransparency = originalTransparency,
        kind = kind,
    }
    viewport.Parent = image
    image.ImageTransparency = 1
end

local function bindAvatarVisualImage(image)
    if not image or avatarVisualState.boundImages[image] then return end
    if not image:IsA("ImageLabel") and not image:IsA("ImageButton") then return end
    avatarVisualState.boundImages[image] = true
    local connection = image:GetPropertyChangedSignal("Image"):Connect(function()
        if not avatarVisualState.active then return end
        task.defer(function()
            if image.Parent then applyAvatarVisualToImage(image) end
        end)
    end)
    avatarVisualState.connections[#avatarVisualState.connections + 1] = connection
    applyAvatarVisualToImage(image)
end

local function watchAvatarVisualRoot(root)
    if not root or avatarVisualState.boundRoots[root] then return end
    avatarVisualState.boundRoots[root] = true
    local connection = root.DescendantAdded:Connect(function(instance)
        if not avatarVisualState.active then return end
        bindAvatarVisualImage(instance)
    end)
    avatarVisualState.connections[#avatarVisualState.connections + 1] = connection
end

local function scanAvatarVisualGui()
    if not avatarVisualState.active then return end
    local roots = { CoreGui, localPlayer:FindFirstChildOfClass("PlayerGui") }
    for _, root in ipairs(roots) do
        if root then
            watchAvatarVisualRoot(root)
            for _, instance in ipairs(root:GetDescendants()) do
                bindAvatarVisualImage(instance)
            end
        end
    end
end

refreshAvatarVisualDescription = function(description, userId)
    clearAvatarVisuals()
    if not description then return end
    if not isCharAppearanceOptionEnabled('Headless') and not isCharAppearanceOptionEnabled('Korblox') then return end

    local clonedDescription = nil
    pcall(function() clonedDescription = description:Clone() end)
    if not clonedDescription then return end

    applyCharOptionsToDescription(clonedDescription)
    local modelTemplate = createAvatarVisualModel(clonedDescription)
    if not modelTemplate then
        clonedDescription:Destroy()
        return
    end
    avatarVisualState.description = clonedDescription
    avatarVisualState.modelTemplate = modelTemplate
    avatarVisualState.userId = tonumber(userId) or localPlayer.UserId
    avatarVisualState.active = true
    avatarVisualState.serial = avatarVisualState.serial + 1
    local visualToken = avatarVisualState.serial

    scanAvatarVisualGui()
    task.spawn(function()
        local userIds = { localPlayer.UserId }
        if avatarVisualState.userId ~= localPlayer.UserId then
            userIds[#userIds + 1] = avatarVisualState.userId
        end
        local contentKinds = {}
        for _, thumbnailUserId in ipairs(userIds) do
            for _, spec in ipairs(THUMBNAIL_SPECS) do
                if not avatarVisualState.active or visualToken ~= avatarVisualState.serial then return end
                local okSize, thumbnailSize = pcall(function() return Enum.ThumbnailSize[spec[2]] end)
                if okSize and thumbnailSize then
                    local content = getThumbnailContent(thumbnailUserId, spec[1], thumbnailSize)
                    if content then contentKinds[content] = spec[3] end
                end
            end
        end
        if not avatarVisualState.active or visualToken ~= avatarVisualState.serial then return end
        avatarVisualState.contentKinds = contentKinds
        scanAvatarVisualGui()
    end)
end
end

local function getTargetIdentity(userId)
    local cached = guiSpoofState.identityCache[userId]
    if cached and os.clock() - cached.timestamp <= 60 then return cached.identity end

    local targetPlayer = nil
    pcall(function() targetPlayer = Players:GetPlayerByUserId(userId) end)
    local username = targetPlayer and targetPlayer.Name or nil
    local displayName = targetPlayer and targetPlayer.DisplayName or nil

    if not username or not displayName then
        local okUserService, userService = pcall(function() return game:GetService("UserService") end)
        if okUserService and userService then
            local okInfo, infos = pcall(function()
                return userService:GetUserInfosByUserIdsAsync({ userId })
            end)
            local info = okInfo and type(infos) == "table" and infos[1] or nil
            if info then
                username = username or info.Username or info.Name
                displayName = displayName or info.DisplayName
            end
        end
    end

    if not username then
        local okName, name = pcall(function() return Players:GetNameFromUserIdAsync(userId) end)
        if okName then username = name end
    end

    username = tostring(username or userId)
    displayName = tostring(displayName or username)

    local identity = {
        userId = userId,
        username = username,
        displayName = displayName,
        thumbnailMap = {},
    }
    identity.replacements = buildIdentityReplacements(identity)
    guiSpoofState.identityCache[userId] = {
        identity = identity,
        timestamp = os.clock(),
    }
    task.spawn(function()
        local thumbnailMap = buildThumbnailContentMap(userId)
        local entry = guiSpoofState.identityCache[userId]
        if entry and entry.identity == identity then
            identity.thumbnailMap = thumbnailMap
        end
    end)
    return identity
end

local function rememberGuiProperty(instance, property, originalValue, spoofedValue)
    local properties = guiSpoofState.originals[instance]
    if not properties then
        properties = {}
        guiSpoofState.originals[instance] = properties
    end
    local entry = properties[property]
    if not entry then
        entry = { original = originalValue, spoofed = spoofedValue }
        properties[property] = entry
    else
        entry.spoofed = spoofedValue
    end
end

local function disconnectGuiIdentityConnections()
    for i = #guiSpoofState.connections, 1, -1 do
        local connection = guiSpoofState.connections[i]
        guiSpoofState.connections[i] = nil
        if connection and connection.Connected then
            pcall(function() connection:Disconnect() end)
        end
    end
    guiSpoofState.boundObjects = setmetatable({}, { __mode = "k" })
    guiSpoofState.boundRoots = setmetatable({}, { __mode = "k" })
end

local function restoreGuiIdentity()
    guiSpoofState.active = false
    guiSpoofState.serial = guiSpoofState.serial + 1
    disconnectGuiIdentityConnections()
    for instance, properties in pairs(guiSpoofState.originals) do
        if instance then
            for property, entry in pairs(properties) do
                pcall(function()
                    if instance[property] == entry.spoofed then
                        instance[property] = entry.original
                    end
                end)
            end
        end
    end
    guiSpoofState.originals = setmetatable({}, { __mode = "k" })
    guiSpoofState.identity = nil
    runtimeState.guiIdentity = nil
end

local function spoofIdentityText(value, identity)
    if type(value) ~= "string" or value == "" then return value end
    local result = value
    local applied = {}
    for index, replacement in ipairs(identity.replacements) do
        local token = "\1CIDER_ID_" .. tostring(index) .. "\2"
        local replaced, changed = replaceIdentityText(result, replacement.from, token)
        if changed then
            result = replaced
            applied[#applied + 1] = { token = token, value = replacement.to }
        end
    end
    for _, replacement in ipairs(applied) do
        result = replacePlainText(result, replacement.token, replacement.value)
    end
    return result
end

local function spoofIdentityImage(value, identity)
    if type(value) ~= "string" or value == "" then return value end
    local mapped = identity.thumbnailMap[value]
    if mapped then return mapped end
    local lowerValue = string.lower(value)
    local localId = tostring(localPlayer.UserId)
    if not string.find(value, localId, 1, true) then return value end
    if not (
        string.find(lowerValue, "rbxthumb", 1, true)
        or string.find(lowerValue, "thumbnail", 1, true)
        or string.find(lowerValue, "headshot", 1, true)
        or string.find(lowerValue, "avatar", 1, true)
        or string.find(lowerValue, "userid", 1, true)
        or string.find(lowerValue, "userids", 1, true)
    ) then
        return value
    end
    return replacePlainText(value, localId, tostring(identity.userId))
end

local function applyIdentityToGuiObject(instance, identity)
    if not instance then return end
    if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
        local okText, currentText = pcall(function() return instance.Text end)
        if okText then
            if isLocalInspectTitle(currentText) then requestTargetInspectRefresh() end
            local spoofedText = spoofIdentityText(currentText, identity)
            if spoofedText ~= currentText then
                local okSet = pcall(function() instance.Text = spoofedText end)
                if okSet then rememberGuiProperty(instance, "Text", currentText, spoofedText) end
            end
        end
    elseif instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
        local okImage, currentImage = pcall(function() return instance.Image end)
        if okImage then
            local spoofedImage = spoofIdentityImage(currentImage, identity)
            if spoofedImage ~= currentImage then
                local okSet = pcall(function() instance.Image = spoofedImage end)
                if okSet then rememberGuiProperty(instance, "Image", currentImage, spoofedImage) end
            end
        end
    end
end

local function bindIdentityGuiObject(instance, identity)
    if not instance or guiSpoofState.boundObjects[instance] then return end
    local property = nil
    if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
        property = "Text"
    elseif instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
        property = "Image"
    end
    if not property then return end
    local okConnection, connection = pcall(function()
        return instance:GetPropertyChangedSignal(property):Connect(function()
            if not guiSpoofState.active or guiSpoofState.identity ~= identity then return end
            applyIdentityToGuiObject(instance, identity)
        end)
    end)
    if okConnection and connection then
        guiSpoofState.boundObjects[instance] = true
        guiSpoofState.connections[#guiSpoofState.connections + 1] = connection
    end
end

local function watchIdentityRoot(root, identity)
    if not root or guiSpoofState.boundRoots[root] then return end
    local okConnection, connection = pcall(function()
        return root.DescendantAdded:Connect(function(instance)
            if not guiSpoofState.active or guiSpoofState.identity ~= identity then return end
            bindIdentityGuiObject(instance, identity)
            applyIdentityToGuiObject(instance, identity)
        end)
    end)
    if okConnection and connection then
        guiSpoofState.boundRoots[root] = true
        guiSpoofState.connections[#guiSpoofState.connections + 1] = connection
    end
end

local function scanIdentityGui(identity)
    local roots = { CoreGui, localPlayer:FindFirstChildOfClass("PlayerGui") }
    for _, root in ipairs(roots) do
        if root then
            watchIdentityRoot(root, identity)
            applyIdentityToGuiObject(root, identity)
            local okDescendants, descendants = pcall(function() return root:GetDescendants() end)
            if okDescendants then
                for _, instance in ipairs(descendants) do
                    bindIdentityGuiObject(instance, identity)
                    applyIdentityToGuiObject(instance, identity)
                end
            end
        end
    end
end

local function startGuiIdentity(userId, applyToken)
    restoreGuiIdentity()
    clearAvatarVisuals()
    setInspectTarget(userId)
    guiSpoofState.active = true
    guiSpoofState.serial = guiSpoofState.serial + 1
    local guiToken = guiSpoofState.serial
    task.spawn(function()
        local identity = getTargetIdentity(userId)
        if not guiSpoofState.active or guiToken ~= guiSpoofState.serial then return end
        if not runtimeState.active or applyToken ~= applySerial then return end
        guiSpoofState.identity = identity
        runtimeState.guiIdentity = identity
        setInspectTarget(userId, identity.displayName)
        task.spawn(function()
            local targetDescription = getTargetDescriptionCached(userId)
            if not guiSpoofState.active or guiToken ~= guiSpoofState.serial then
                if targetDescription then pcall(function() targetDescription:Destroy() end) end
                return
            end
            if targetDescription then
                setInspectTarget(userId, identity.displayName, targetDescription)
                refreshAvatarVisualDescription(targetDescription, userId)
            end
        end)
        while guiSpoofState.active and guiToken == guiSpoofState.serial and runtimeState.active and applyToken == applySerial do
            scanIdentityGui(identity)
            task.wait(2)
        end
    end)
end

local function destroyColorSnapshot(snapshot)
    if not snapshot then return end
    if snapshot.bodyColors then
        pcall(function() snapshot.bodyColors:Destroy() end)
        snapshot.bodyColors = nil
    end
end

local function teardown()
    local previousSnapshot = runtimeState.colorSnapshot
    runtimeState.active = false
    applySerial = applySerial + 1
    runtimeState.currentUserId = nil
    destroyColorSnapshot(previousSnapshot)
    runtimeState.colorSnapshot = nil
    targetUserId = nil
    disconnectAppearanceHooks()
    restoreGuiIdentity()
    clearInspectTarget()
    clearAvatarVisuals()
    if characterAddedConn then characterAddedConn:Disconnect(); characterAddedConn = nil end
    if standaloneAppearanceConn then standaloneAppearanceConn:Disconnect(); standaloneAppearanceConn = nil end
    clearAvatarCaches()
    

    if typeof(animCleanup) == "function" then
        animCleanup()
    end

    if okEnv and env then
        if env.__CopyOutfitColorSnapshot and env.__CopyOutfitColorSnapshot ~= previousSnapshot then
            destroyColorSnapshot(env.__CopyOutfitColorSnapshot)
        end
        env.__CopyOutfitColorSnapshot = nil
        if env[stateKey] == runtimeState then env[stateKey] = nil end
    end
end
runtimeState.teardown = teardown

local function snapshotCharacterColors(char)
    if not char then return nil end
    local snapshot = { bodyColors = nil, partColors = {} }
    local bc = char:FindFirstChildOfClass("BodyColors")
    if bc then snapshot.bodyColors = bc:Clone() end
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("BasePart") then
            snapshot.partColors[child.Name] = child.BrickColor
        end
    end
    return snapshot
end

local function publishColorSnapshot(char)
    destroyColorSnapshot(runtimeState.colorSnapshot)
    local snapshot = snapshotCharacterColors(char)
    runtimeState.colorSnapshot = snapshot
    if okEnv and env then env.__CopyOutfitColorSnapshot = snapshot end
end

local function isApplyStillCurrent(applyToken)
    return runtimeState.active and applyToken == applySerial
end

local function applyFaceTexture(char, texture)
    local head = char:FindFirstChild("Head")
    if not head then return end
    if isCharAppearanceOptionEnabled('Headless') then
        head.Transparency = 1
        purgeHeadFaces(head)
        return
    end


	
    for _, child in ipairs(head:GetChildren()) do
        if child:IsA("Decal") and (child.Name == "face" or child.Face == Enum.NormalId.Front) then
            child:Destroy()
        end
    end


	
    if head:IsA("MeshPart") then
        pcall(function() head.TextureID = "" end)
    end
    local mesh = head:FindFirstChildOfClass("SpecialMesh")
    if mesh then
        pcall(function() mesh.TextureId = "" end)
    end
    local sa = head:FindFirstChildOfClass("SurfaceAppearance")
    if sa then
        pcall(function() sa:Destroy() end)
    end

    if not texture or texture == "" then 
        texture = "rbxassetid://0" 
    end

    local decal = Instance.new("Decal")
    decal.Name = "face"
    decal.Face = Enum.NormalId.Front
    decal.Texture = texture
    decal.Parent = head
end

local function resolveFaceTexture(userId, appearanceModel, targetDesc)
    local cached = cacheGetTimed(faceTextureCache, faceTextureCacheTime, userId, AVATAR_CACHE_TTL_SECONDS)
    if cached then return cached end

    local appearanceHead = appearanceModel and appearanceModel:FindFirstChild("Head")
    local direct = firstDecalTextureFromHead(appearanceHead)
    if direct then return cacheFaceTexture(userId, direct) end

    if targetDesc and targetDesc.Face and targetDesc.Face ~= 0 then
        return resolveFaceFromAssetId(targetDesc.Face, userId)
    end

    local info = getCharacterAppearanceInfoCached(userId)
    if info and info.assets then
        for _, asset in ipairs(info.assets) do
            if asset.assetType and asset.assetType.id == 18 and asset.id then
                return resolveFaceFromAssetId(asset.id, userId)
            end
        end
    end

    local okModel, tempModel = pcall(function() return Players:CreateHumanoidModelFromUserId(userId) end)
    if okModel and tempModel then
        local tempHead = tempModel:FindFirstChild("Head")
        local tempTexture = firstDecalTextureFromHead(tempHead)
        tempModel:Destroy()
        if tempTexture then return cacheFaceTexture(userId, tempTexture) end
    end

    return nil
end

local function buildSourcePartSizeMap(srcModel)
    local sizes = {}
    for _, part in ipairs(srcModel:GetChildren()) do
        if part:IsA("BasePart") then sizes[part.Name] = part.Size end
    end
    return sizes
end

local function scaleAccessoryOnce(acc, char, sourcePartSizeMap, charPartMap, attachmentCarrierMap)
    local handle = acc:FindFirstChild("Handle")
    if not handle or not handle:IsA("BasePart") then return end

    local matchedPartName = nil
    for _, hChild in ipairs(handle:GetChildren()) do
        if hChild:IsA("Attachment") then
            local carrier = attachmentCarrierMap and attachmentCarrierMap[hChild.Name] or nil
            if type(carrier) == "string" then
                matchedPartName = carrier
                break
            end
            if carrier == false then
                local scanMap = charPartMap or buildBasePartMap(char)
                for partName, bodyPart in pairs(scanMap) do
                    if bodyPart and bodyPart:IsA("BasePart") and bodyPart:FindFirstChild(hChild.Name) then
                        matchedPartName = partName
                        break
                    end
                end
            end
        end
        if matchedPartName then break end
    end

    if not handle:GetAttribute("_cpBaseSizeX") then
        handle:SetAttribute("_cpBaseSizeX", handle.Size.X)
        handle:SetAttribute("_cpBaseSizeY", handle.Size.Y)
        handle:SetAttribute("_cpBaseSizeZ", handle.Size.Z)
        for _, hChild in ipairs(handle:GetChildren()) do
            if hChild:IsA("Attachment") then
                hChild:SetAttribute("_cpBasePosX", hChild.Position.X)
                hChild:SetAttribute("_cpBasePosY", hChild.Position.Y)
                hChild:SetAttribute("_cpBasePosZ", hChild.Position.Z)
            end
        end
        local sm0 = handle:FindFirstChildOfClass("SpecialMesh")
        if sm0 then
            sm0:SetAttribute("_cpBaseScaleX", sm0.Scale.X)
            sm0:SetAttribute("_cpBaseScaleY", sm0.Scale.Y)
            sm0:SetAttribute("_cpBaseScaleZ", sm0.Scale.Z)
        end
    end

    local scale = nil
    if matchedPartName then
        local srcSize = sourcePartSizeMap[matchedPartName]
        local dstPart = char:FindFirstChild(matchedPartName)
        if srcSize and dstPart and dstPart:IsA("BasePart") then
            local sx = math.max(srcSize.X, 0.001)
            local sy = math.max(srcSize.Y, 0.001)
            local sz = math.max(srcSize.Z, 0.001)
            scale = (dstPart.Size.X/sx + dstPart.Size.Y/sy + dstPart.Size.Z/sz) / 3
        end
    end

    local function applyScale(s)
        local bx = handle:GetAttribute("_cpBaseSizeX")
        local by = handle:GetAttribute("_cpBaseSizeY")
        local bz = handle:GetAttribute("_cpBaseSizeZ")
        if bx and by and bz then
            pcall(function() handle.Size = Vector3.new(bx*s, by*s, bz*s) end)
        end
        for _, hChild in ipairs(handle:GetChildren()) do
            if hChild:IsA("Attachment") then
                local apx = hChild:GetAttribute("_cpBasePosX")
                local apy = hChild:GetAttribute("_cpBasePosY")
                local apz = hChild:GetAttribute("_cpBasePosZ")
                if apx and apy and apz then
                    pcall(function() hChild.Position = Vector3.new(apx*s, apy*s, apz*s) end)
                end
            end
        end
        local sm = handle:FindFirstChildOfClass("SpecialMesh")
        if sm then
            local msx = sm:GetAttribute("_cpBaseScaleX")
            local msy = sm:GetAttribute("_cpBaseScaleY")
            local msz = sm:GetAttribute("_cpBaseScaleZ")
            pcall(function()
                if msx and msy and msz then
                    sm.Scale = Vector3.new(msx*s, msy*s, msz*s)
                else
                    sm.Scale = sm.Scale * s
                end
            end)
        end
    end

    if scale and math.abs(scale - 1) > 0.01 then
        applyScale(scale)
    else
        applyScale(1)
    end
end

local function scaleAllAccessories(char, sourcePartSizeMap, charPartMap, attachmentCarrierMap)
    for _, child in ipairs(char:GetChildren()) do
        if isAccessoryClass(child.ClassName) then
            scaleAccessoryOnce(child, char, sourcePartSizeMap, charPartMap, attachmentCarrierMap)
        end
    end
end

local function applyBodyFromDescription(targetDesc, char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or not targetDesc then return false end
    for _, fieldName in ipairs(COPY_ANIMATION_FIELDS) do
        pcall(function() targetDesc[fieldName] = 0 end)
    end
    local okApply = pcall(function() hum:ApplyDescription(targetDesc) end)
    return okApply
end

local function toColor3(value)
    local kind = typeof(value)
    if kind == "Color3"    then return value end
    if kind == "BrickColor"then return value.Color end
    if kind == "number"    then
        local ok, brick = pcall(function() return BrickColor.new(value) end)
        if ok and brick then return brick.Color end
    end
    return nil
end

local function enforceSkinColorFromDescription(targetDesc, char, sourceModel, preferredSnapshot)
    if not char then return end
    local bodyColors = char:FindFirstChildOfClass("BodyColors")
    if not bodyColors then
        bodyColors = Instance.new("BodyColors")
        bodyColors.Parent = char
    end

    local preferredBodyColors = preferredSnapshot and preferredSnapshot.bodyColors or nil
    local sourceBodyColors = sourceModel and sourceModel:FindFirstChildOfClass("BodyColors")

    local headColor = (preferredBodyColors and preferredBodyColors.HeadColor3)      or (targetDesc and toColor3(targetDesc.HeadColor))      or (sourceBodyColors and sourceBodyColors.HeadColor3)
    local leftArmColor = (preferredBodyColors and preferredBodyColors.LeftArmColor3)   or (targetDesc and toColor3(targetDesc.LeftArmColor))   or (sourceBodyColors and sourceBodyColors.LeftArmColor3)
    local rightArmColor = (preferredBodyColors and preferredBodyColors.RightArmColor3)  or (targetDesc and toColor3(targetDesc.RightArmColor))  or (sourceBodyColors and sourceBodyColors.RightArmColor3)
    local torsoColor = (preferredBodyColors and preferredBodyColors.TorsoColor3)     or (targetDesc and toColor3(targetDesc.TorsoColor))     or (sourceBodyColors and sourceBodyColors.TorsoColor3)
    local leftLegColor = (preferredBodyColors and preferredBodyColors.LeftLegColor3)   or (targetDesc and toColor3(targetDesc.LeftLegColor))   or (sourceBodyColors and sourceBodyColors.LeftLegColor3)
    local rightLegColor = (preferredBodyColors and preferredBodyColors.RightLegColor3)  or (targetDesc and toColor3(targetDesc.RightLegColor))  or (sourceBodyColors and sourceBodyColors.RightLegColor3)

    local preferredPartColors = preferredSnapshot and preferredSnapshot.partColors or nil
    local function pickPartColor(partName, fallbackColor)
        if preferredPartColors then
            local preferred = toColor3(preferredPartColors[partName])
            if preferred then return preferred end
        end
        return fallbackColor
    end

    if headColor     then bodyColors.HeadColor3 = headColor     end
    if leftArmColor  then bodyColors.LeftArmColor3 = leftArmColor  end
    if rightArmColor then bodyColors.RightArmColor3 = rightArmColor end
    if torsoColor    then bodyColors.TorsoColor3 = torsoColor    end
    if leftLegColor  then bodyColors.LeftLegColor3 = leftLegColor  end
    if rightLegColor then bodyColors.RightLegColor3 = rightLegColor end

    local partColorMap = {
        Head = pickPartColor("Head", headColor),
        LeftArm = pickPartColor("LeftArm", leftArmColor),      RightArm = pickPartColor("RightArm", rightArmColor),
        ["Left Arm"] = pickPartColor("Left Arm", leftArmColor),    ["Right Arm"] = pickPartColor("Right Arm", rightArmColor),
        LeftUpperArm = pickPartColor("LeftUpperArm", leftArmColor), LeftLowerArm = pickPartColor("LeftLowerArm", leftArmColor), LeftHand = pickPartColor("LeftHand", leftArmColor),
        RightUpperArm = pickPartColor("RightUpperArm", rightArmColor), RightLowerArm = pickPartColor("RightLowerArm", rightArmColor), RightHand = pickPartColor("RightHand", rightArmColor),
        Torso = pickPartColor("Torso", torsoColor),          UpperTorso = pickPartColor("UpperTorso", torsoColor),    LowerTorso = pickPartColor("LowerTorso", torsoColor),
        LeftLeg = pickPartColor("LeftLeg", leftLegColor),      LeftUpperLeg = pickPartColor("LeftUpperLeg", leftLegColor), LeftLowerLeg = pickPartColor("LeftLowerLeg", leftLegColor), LeftFoot = pickPartColor("LeftFoot", leftLegColor),
        ["Left Leg"] = pickPartColor("Left Leg", leftLegColor),    ["Right Leg"] = pickPartColor("Right Leg", rightLegColor),
        RightLeg = pickPartColor("RightLeg", rightLegColor),    RightUpperLeg = pickPartColor("RightUpperLeg", rightLegColor), RightLowerLeg = pickPartColor("RightLowerLeg", rightLegColor),RightFoot = pickPartColor("RightFoot", rightLegColor),
    }
    for partName, color3 in pairs(partColorMap) do
        if color3 then
            local part = char:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                pcall(function() part.Color = color3 end)
            end
        end
    end
end


local pqzlwt = 0
local apply

local function getTargetBodyScales(userId, targetDesc)
    local scales = {
        width = targetDesc and targetDesc.WidthScale or 1,
        depth = targetDesc and targetDesc.DepthScale or 1,
        height = targetDesc and targetDesc.HeightScale or 1,
        head = targetDesc and targetDesc.HeadScale or 1,
        proportion = targetDesc and targetDesc.ProportionScale or 0,
        bodyType = targetDesc and targetDesc.BodyTypeScale or 0,
    }

    local okPlayer, targetPlayer = pcall(function() return Players:GetPlayerByUserId(userId) end)
    local targetCharacter = okPlayer and targetPlayer and targetPlayer.Character
    local targetHumanoid = targetCharacter and targetCharacter:FindFirstChildOfClass("Humanoid")
    if not targetHumanoid then return scales end

    local okDesc, liveDesc = pcall(function() return targetHumanoid:GetAppliedDescription() end)
    local function readScale(name, field, fallback)
        local valueObject = targetHumanoid:FindFirstChild(name)
        if valueObject and valueObject:IsA("NumberValue") then return valueObject.Value end
        if okDesc and liveDesc then
            local okValue, value = pcall(function() return liveDesc[field] end)
            if okValue and type(value) == "number" then return value end
        end
        return fallback
    end

    scales.width = readScale("BodyWidthScale", "WidthScale", scales.width)
    scales.depth = readScale("BodyDepthScale", "DepthScale", scales.depth)
    scales.height = readScale("BodyHeightScale", "HeightScale", scales.height)
    scales.head = readScale("HeadScale", "HeadScale", scales.head)
    scales.proportion = readScale("BodyProportionScale", "ProportionScale", scales.proportion)
    scales.bodyType = readScale("BodyTypeScale", "BodyTypeScale", scales.bodyType)
    return scales
end

local function kfdkdl(character)
    local cfg = CONFIG and CONFIG.charchanger
    if not cfg then return end
    if not character or not character.Parent then return end
    local hum = character:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    local scaleValues = cfg.enabled and cfg or cfg.targetScales
    if not scaleValues then return end

    local map = {
        BodyWidthScale = scaleValues.width,
        BodyDepthScale = scaleValues.depth,
        BodyHeightScale = scaleValues.height,
        HeadScale = scaleValues.head,
        BodyProportionScale = scaleValues.proportion,
        BodyTypeScale = scaleValues.bodyType,
    }
    for name, value in pairs(map) do
        if type(value) == "number" then
            local nv = hum:FindFirstChild(name)
            if nv and nv:IsA("NumberValue") then
                if math.abs(nv.Value - value) > 0.001 then
                    pcall(function() nv.Value = value end)
                end
            end
        end
    end
end

local function xmvnrp(character)
    pqzlwt = pqzlwt + 1
    local myToken = pqzlwt
    local cfg = CONFIG and CONFIG.charchanger
    local interval = (cfg and tonumber(cfg.enforceIntervalSeconds)) or 0.8
    task.spawn(function()
        while myToken == pqzlwt do
            task.wait(interval)
            if myToken ~= pqzlwt then return end
            local curChar = localPlayer.Character
            if not curChar or not curChar.Parent then
                character = nil
            else
                character = curChar
            end
            if character then
                kfdkdl(character)
            end
        end
    end)
end

if okEnv and env then
    env.nxhbtc = {
        Set = function(opts)
            if type(opts) ~= "table" then return end
            for k, v in pairs(opts) do
                if CONFIG.charchanger[k] ~= nil then CONFIG.charchanger[k] = v end
            end
            if opts.enabled ~= nil then
                shared.Cider['Char']['Body Size']['Enabled'] = opts.enabled == true
            end
            kfdkdl(localPlayer.Character)
        end,
        Enable = function()
            CONFIG.charchanger.enabled = true
            shared.Cider['Char']['Body Size']['Enabled'] = true
            kfdkdl(localPlayer.Character)
            xmvnrp(localPlayer.Character)
            
            local uid = runtimeState.currentUserId or targetUserId or getDefaultTargetUserId()
            if uid then apply(uid) end
        end,
        Disable = function()
            CONFIG.charchanger.enabled = false
            shared.Cider['Char']['Body Size']['Enabled'] = false
            pqzlwt = pqzlwt + 1
            local uid = runtimeState.currentUserId or targetUserId or getDefaultTargetUserId()
            if uid then apply(uid) end
        end,
        Reapply = function()
            kfdkdl(localPlayer.Character)
            local uid = runtimeState.currentUserId or targetUserId or getDefaultTargetUserId()
            if uid then apply(uid) end
        end,
    }
end

local function applyAppearance(userId, char, applyToken)
    if not isApplyStillCurrent(applyToken) then return end

    local model = getCharacterAppearanceModel(userId)
    if not model then return end

    if not isApplyStillCurrent(applyToken) then model:Destroy(); return end

    clearCopyChildren(char)

    local sourceModel = model
    local humModel = nil
    local bodyModel = nil
    local hasHead = sourceModel:FindFirstChild("Head") ~= nil
    local hasAnyPart = hasAnySourceBodyPart(sourceModel)

    if not hasHead or not hasAnyPart then
        local ok, created = pcall(function() return Players:CreateHumanoidModelFromUserId(userId) end)
        if ok and created then
            humModel = created
            sourceModel = humModel
        end
    end

    if not isApplyStillCurrent(applyToken) then
        if humModel then humModel:Destroy() end
        model:Destroy(); return
    end

    local targetDesc = applyCharOptionsToDescription(getTargetDescriptionCached(userId))
    CONFIG.charchanger.targetScales = getTargetBodyScales(userId, targetDesc)

    local bodyApplied = applyBodyFromDescription(targetDesc, char)
    task.wait()

    local postDescriptionColorSnapshot = nil
    if bodyApplied then
        postDescriptionColorSnapshot = snapshotCharacterColors(char)
    end

    local delayedSkinSnapshot = nil
    if postDescriptionColorSnapshot and postDescriptionColorSnapshot.bodyColors then
        delayedSkinSnapshot = {
            bodyColors = postDescriptionColorSnapshot.bodyColors:Clone(),
            partColors = {},
        }
        for partName, brickColor in pairs(postDescriptionColorSnapshot.partColors or {}) do
            delayedSkinSnapshot.partColors[partName] = brickColor
        end
    end

    if not isApplyStillCurrent(applyToken) then
        destroyColorSnapshot(postDescriptionColorSnapshot)
        destroyColorSnapshot(delayedSkinSnapshot)
        if bodyModel then bodyModel:Destroy() end
        if humModel then humModel:Destroy() end
        model:Destroy(); return
    end

    if bodyApplied and not bodyModel then
        local okBody, createdBody = pcall(function() return Players:CreateHumanoidModelFromUserId(userId) end)
        if okBody and createdBody then
            bodyModel = createdBody
        end
    end

    local bodySourceModel = bodyModel or sourceModel
    local desiredFaceTexture = resolveFaceTexture(userId, bodySourceModel, targetDesc)
    local sourcePartSizeMap = buildSourcePartSizeMap(bodySourceModel)
    local charPartMap = buildBasePartMap(char)
    local attachmentCarrierMap = buildAttachmentCarrierMap(charPartMap)

    for _, partName in ipairs(BODY_PART_NAMES) do
        if bodyApplied then
            if partName == "Head" then
                applyFaceTexture(char, desiredFaceTexture)
            end
        else
            local src = bodySourceModel:FindFirstChild(partName) or sourceModel:FindFirstChild(partName)
            local dest = char:FindFirstChild(partName)
            if src and dest then
                dest.Transparency = src.Transparency

                local sm = src:FindFirstChildOfClass("SpecialMesh")
                local dm = dest:FindFirstChildOfClass("SpecialMesh")
                if sm then
                    if not dm then
                        dm = sm:Clone(); dm.Parent = dest
                    else
                        dm.MeshId = sm.MeshId; dm.TextureId = sm.TextureId
                        dm.Scale = sm.Scale;  dm.Offset = sm.Offset
                    end
                elseif dm then
                    dm:Destroy()
                end

                pcall(function()
                    if src:IsA("MeshPart") and dest:IsA("MeshPart") then
                        dest.MeshId = src.MeshId
                        dest.TextureID = src.TextureID
                    end
                end)

                for _, att in ipairs(src:GetChildren()) do
                    if att:IsA("Attachment") then
                        local existing = dest:FindFirstChild(att.Name)
                        if existing then
                            existing.Position = att.Position
                            existing.Orientation = att.Orientation
                        else
                            att:Clone().Parent = dest
                        end
                    end
                end

                if partName == "Head" then
                    applyFaceTexture(char, desiredFaceTexture)
                end
            end
        end
    end

    if not isApplyStillCurrent(applyToken) then
        destroyColorSnapshot(postDescriptionColorSnapshot)
        if bodyModel then bodyModel:Destroy() end
        if humModel then humModel:Destroy() end
        model:Destroy(); return
    end

    for _, inst in ipairs(sourceModel:GetChildren()) do
        if shouldCloneClass(inst.ClassName) then
            if bodyApplied and inst.ClassName == "CharacterMesh" then
            else
            local clone = inst:Clone()
            clone.Parent = char
            if isAccessoryClass(clone.ClassName) then
                scaleAccessoryOnce(clone, char, sourcePartSizeMap, charPartMap, attachmentCarrierMap)
            end
            end
        end
    end

    local rigRefreshToken = 0
    local function requestRigAndFaceRefresh(delaySeconds)
        rigRefreshToken = rigRefreshToken + 1
        local token = rigRefreshToken
        task.delay(delaySeconds or 0, function()
            if token ~= rigRefreshToken then return end
            if not isApplyStillCurrent(applyToken) then return end
            if not char.Parent then return end
            local h = char:FindFirstChildOfClass("Humanoid")
            if h then pcall(function() h:BuildRigFromAttachments() end) end
            applyFaceTexture(char, desiredFaceTexture)
            applyConfiguredCharBodyOptions(char)
             
            applyConfiguredCharAnimations(char, userId)
        end)
    end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then pcall(function() hum:BuildRigFromAttachments() end) end

    if not isApplyStillCurrent(applyToken) then
        destroyColorSnapshot(postDescriptionColorSnapshot)
        destroyColorSnapshot(delayedSkinSnapshot)
        if bodyModel then bodyModel:Destroy() end
        if humModel then humModel:Destroy() end
        model:Destroy(); return
    end

    enforceSkinColorFromDescription(targetDesc, char, bodySourceModel, postDescriptionColorSnapshot)
    destroyColorSnapshot(postDescriptionColorSnapshot)
    applyFaceTexture(char, desiredFaceTexture)
    applyConfiguredCharBodyOptions(char)
    publishColorSnapshot(char)

   
    kfdkdl(char)

    task.defer(function()
        local retryDelays = { 0.1, 0.28, 0.55 }
        for _, dt in ipairs(retryDelays) do
            task.wait(dt)
            if not isApplyStillCurrent(applyToken) then
                destroyColorSnapshot(delayedSkinSnapshot)
                return
            end
            if not char.Parent then
                destroyColorSnapshot(delayedSkinSnapshot)
                return
            end
            if delayedSkinSnapshot then
                if delayedSkinSnapshot.bodyColors then
                    local okClone, bcClone = pcall(function() return delayedSkinSnapshot.bodyColors:Clone() end)
                    if okClone and bcClone then
                        pcall(function()
                            local currentBC = char:FindFirstChildOfClass("BodyColors")
                            if currentBC then currentBC:Destroy() end
                            bcClone.Parent = char
                        end)
                    end
                end
                for partName, brickColor in pairs(delayedSkinSnapshot.partColors or {}) do
                    local part = char:FindFirstChild(partName)
                    if part and part:IsA("BasePart") and brickColor then
                        pcall(function() part.BrickColor = brickColor end)
                    end
                end
                enforceSkinColorFromDescription(nil, char, nil, delayedSkinSnapshot)
            else
                enforceSkinColorFromDescription(targetDesc, char, nil, nil)
            end

            kfdkdl(char)
            applyConfiguredCharBodyOptions(char)
        end
        destroyColorSnapshot(delayedSkinSnapshot)
    end)

    disconnectAppearanceHooks()
    appearanceChildConn = char.ChildAdded:Connect(function(child)
        if isAccessoryClass(child.ClassName) then
            task.defer(function()
                if not isApplyStillCurrent(applyToken) then return end
                if not char.Parent then return end
                local livePartMap = buildBasePartMap(char)
                local liveCarrierMap = buildAttachmentCarrierMap(livePartMap)
                scaleAccessoryOnce(child, char, sourcePartSizeMap, livePartMap, liveCarrierMap)
                requestRigAndFaceRefresh(0.03)
            end)
        elseif child.Name == "Head" or child:IsA("Decal") then
            if child.Name == "Head" then
                bindConfiguredHeadlessFaceWatcher(child)
            end
            requestRigAndFaceRefresh(0.02)
        end
    end)

    bindConfiguredHeadlessFaceWatcher(char:FindFirstChild("Head"))

    task.spawn(function()
        local pulseDelays = { 0.05, 0.12, 0.24, 0.4, 0.65, 0.95 }
        for _, dt in ipairs(pulseDelays) do
            task.wait(dt)
            if not isApplyStillCurrent(applyToken) then return end
            if not char.Parent then return end
            requestRigAndFaceRefresh(0.02)
        end
    end)

    local scaleRefreshScheduled = false
    local scaleRefreshQueued = false
    local function scheduleScaleRefresh()
        if scaleRefreshScheduled then
            scaleRefreshQueued = true
            return
        end
        scaleRefreshScheduled = true
        task.delay(0.03, function()
            scaleRefreshScheduled = false
            if not isApplyStillCurrent(applyToken) then disconnectAppearanceHooks(); return end
            if not char.Parent then disconnectAppearanceHooks(); return end
            local livePartMap = buildBasePartMap(char)
            local liveCarrierMap = buildAttachmentCarrierMap(livePartMap)
            scaleAllAccessories(char, sourcePartSizeMap, livePartMap, liveCarrierMap)
            requestRigAndFaceRefresh(0.02)
            if scaleRefreshQueued then
                scaleRefreshQueued = false
                scheduleScaleRefresh()
            end
        end)
    end

    local function onScaleValueChanged()
        scheduleScaleRefresh()
    end

    local hScale = char:FindFirstChildOfClass("Humanoid")
    if hScale then
        local function tryBindScaleValue(nv)
            if not nv or not nv:IsA("NumberValue") then return end
            if not SCALE_VALUE_SET[nv.Name] then return end
            local conn = nv:GetPropertyChangedSignal("Value"):Connect(onScaleValueChanged)
            appearanceScaleValueConns[#appearanceScaleValueConns + 1] = conn
        end

        for _, child in ipairs(hScale:GetChildren()) do
            tryBindScaleValue(child)
        end

        local childAddedConn = hScale.ChildAdded:Connect(function(child)
            tryBindScaleValue(child)
        end)
        appearanceScaleValueConns[#appearanceScaleValueConns + 1] = childAddedConn
    end

    task.delay(0.2, onScaleValueChanged)

    if bodyModel then bodyModel:Destroy() end
    if humModel then humModel:Destroy() end
    model:Destroy()
end

local function cleanupForSwitch(char)
    disconnectAppearanceHooks()
    if not char then return end
    clearCopyChildren(char)
end

local function syncTargetEmotes(userId, thisApply)
    local retryDelays = { 0, 0.45, 1.25, 3 }
    local synced = false
    for _, retryDelay in ipairs(retryDelays) do
        task.delay(retryDelay, function()
            if synced or not runtimeState.active or thisApply ~= applySerial then return end
            local emoteApi = env and env.EmoteMimic
            if emoteApi and type(emoteApi.SetTargetUserId) == "function" then
                local ok, applied = pcall(function() return emoteApi.SetTargetUserId(userId) end)
                if ok and applied then synced = true end
            end
        end)
    end
end

apply = function(userId)
    if not runtimeState.active then return end
    if not shared.Cider['Char']['Enabled'] then return end
    
    local char = localPlayer.Character
    if not char then return end

    applySerial = applySerial + 1
    local thisApply = applySerial
    targetUserId = userId
    runtimeState.currentUserId = userId

    cleanupForSwitch(char)
    startGuiIdentity(userId, thisApply)

    task.spawn(function()
        if not runtimeState.active then return end
        if thisApply ~= applySerial then return end
        applyAppearance(userId, char, thisApply)
        syncTargetEmotes(userId, thisApply)
        

        applyConfiguredCharAnimations(char, userId)

        task.delay(1, function()
            if thisApply == applySerial and runtimeState.active and char.Parent then
                applyConfiguredCharAnimations(char, userId)
            end
        end)
        task.delay(3, function()
            if thisApply == applySerial and runtimeState.active and char.Parent then
                applyConfiguredCharAnimations(char, userId)
            end
        end)
    end)
end

if okEnv and env then
    local function setTarget(newTarget)
        local uid = resolveUserToId(newTarget)
        if not uid then return end
        targetUserId = uid
        runtimeState.currentUserId = uid
        apply(uid)
    end
    local function reapplyTarget()
        local uid = runtimeState.currentUserId or targetUserId or getDefaultTargetUserId()
        if uid then apply(uid) end
    end
    local function useDefaultTarget()
        runtimeState.currentUserId = nil
        targetUserId = nil
        local uid = getDefaultTargetUserId()
        if uid then apply(uid) end
    end
    env.OutfitCopy = {
        SetTarget = setTarget,
        SetTargetUserId = setTarget,
        SetTargetUsername = setTarget,
        Reapply = reapplyTarget,
        UseDefaultTarget = useDefaultTarget,
        Cleanup = teardown,
    }
    env.CopySetUserId = setTarget
    env.CopyReapplyOutfit = reapplyTarget
    env.CopyUseDefaultTarget = useDefaultTarget
    env.CopyOutfitCleanup = teardown
end

characterAddedConn = localPlayer.CharacterAdded:Connect(function(char)
    applyStandaloneCharBodyOptions(char)
    task.delay(1.5, function()
        if char.Parent then refreshStandaloneInspectDescription(char) end
    end)
    if not runtimeState.active then return end
    local respawnToken = applySerial
    disconnectAppearanceHooks()
    local uid = runtimeState.currentUserId or targetUserId or getDefaultTargetUserId()
    if not uid then return end
    local hum = char:WaitForChild("Humanoid", 10)
    if not hum then return end
    task.wait(0.5)
    if not runtimeState.active or respawnToken ~= applySerial or not char.Parent then return end
    apply(uid)

    kfdkdl(char)
    xmvnrp(char)
end)

if localPlayer.Character then
    applyStandaloneCharBodyOptions(localPlayer.Character)
    local hum = localPlayer.Character:WaitForChild("Humanoid", 10)
    if hum then
        applyConfiguredCharBodyOptions(localPlayer.Character)
        refreshStandaloneInspectDescription(localPlayer.Character)
        local startupUserId = runtimeState.currentUserId or getDefaultTargetUserId()
        if startupUserId then apply(startupUserId) end
        kfdkdl(localPlayer.Character)
        xmvnrp(localPlayer.Character)
    end
end

local LOCAL_PLAYER = localPlayer

local R15_FALLBACK_ANIMATIONS = {
    climb = "rbxassetid://507765644",
    fall = "rbxassetid://507765000",
    jump = "rbxassetid://507765000",
    run = "rbxassetid://913376220",
    walk = "rbxassetid://913402848",
    swim = "rbxassetid://913384386",
    idle1 = "rbxassetid://507766388",
    idle2 = "rbxassetid://507766666",
}

local SLOT_SPECS = {
    { folder = "climb", fallback = R15_FALLBACK_ANIMATIONS.climb },
    { folder = "fall",  fallback = R15_FALLBACK_ANIMATIONS.fall  },
    { folder = "jump",  fallback = R15_FALLBACK_ANIMATIONS.jump  },
    { folder = "run",   fallback = R15_FALLBACK_ANIMATIONS.run   },
    { folder = "walk",  fallback = R15_FALLBACK_ANIMATIONS.walk  },
    { folder = "swim",  fallback = R15_FALLBACK_ANIMATIONS.swim  },
}

if env and env.__AnimationMimicState and env.__AnimationMimicState.cleanup then
    pcall(env.__AnimationMimicState.cleanup)
end

animState = {
    connections = {},
    originalByCharacter = {},
    directControllerByChar = {},
    lastTargetInput = CONFIG.target,
    pinnedTargetUserId = nil,
    lastSourceUserId = nil,
    applyToken = 0,
    animationSetCache = {},
    active = CharCfg['Enabled'] == true and CharCfg['Override Animation'] ~= true,
    settings = {
        autoApplyOnRespawn = true,
        useFallbackWhenMissing = true,
        useDirectTrackFallback = true,
        cacheTtlSeconds = 22,
        minLiveCoverage = 1,
        replicateDescriptionToOthers = false,
        invalidateAnimationCacheOnTargetSwitch = false,
    },
}
if env then env.__AnimationMimicState = animState end

function normalizeAnimationId(rawId)
    if rawId == nil then return nil end
    local numeric = tostring(rawId):match("%d+")
    if not numeric then return nil end
    if (tonumber(numeric) or 0) <= 0 then return nil end
    return "rbxassetid://" .. numeric
end

function numericIdFromContentId(rawId)
    if not rawId then return nil end
    local numeric = tostring(rawId):match("%d+")
    return numeric and tonumber(numeric) or nil
end

FALLBACK_ANIMATION_NUMERIC_IDS = {
    climb = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.climb),
    fall = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.fall),
    jump = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.jump),
    run = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.run),
    walk = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.walk),
    swim = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.swim),
    idle1 = numericIdFromContentId(R15_FALLBACK_ANIMATIONS.idle1),
}

function getLocalRigType()
    local character = LOCAL_PLAYER.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.RigType or Enum.HumanoidRigType.R15
end

function isCharacterR15(character)
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    return humanoid ~= nil and humanoid.RigType == Enum.HumanoidRigType.R15
end

function normalizeAvatarType(rawType)
    if rawType == nil then return nil end
    local s = tostring(rawType):upper()
    if s:find("R15") or s == "2" then return "R15" end
    if s:find("R6")  or s == "1" then return "R6"  end
    return nil
end

function getUserAvatarType(userId)
    local info = getCharacterAppearanceInfoCached(userId)
    return normalizeAvatarType(info and (info.playerAvatarType or info.PlayerAvatarType))
end

function resolveTargetToUserId(target)
    return resolveUserToId(target)
end

function rememberOriginal(character, animationObject)
    if not character or not animationObject then return end
    if not animState.originalByCharacter[character] then
        animState.originalByCharacter[character] = {}
    end
    if animState.originalByCharacter[character][animationObject] == nil then
        animState.originalByCharacter[character][animationObject] = animationObject.AnimationId
    end
end

function resetCharacterAnimations(character)
    local saved = animState.originalByCharacter[character]
    if not saved then return false end
    for animationObject, originalId in pairs(saved) do
        if animationObject and animationObject.Parent then
            animationObject.AnimationId = originalId
        end
    end
    animState.originalByCharacter[character] = nil
    return true
end

function extractFolderAnimationData(animate, folderName)
    local folder = animate and animate:FindFirstChild(folderName)
    if not folder then return nil end
    local data = { byName = {}, ordered = {}, first = nil }
    for _, child in ipairs(folder:GetChildren()) do
        if child:IsA("Animation") then
            local id = normalizeAnimationId(child.AnimationId)
            if id then
                if not data.first then data.first = id end
                data.byName[child.Name] = id
                data.ordered[#data.ordered + 1] = id
            end
        end
    end
    return data
end

function buildAnimationSetFromAnimate(animate)
    if not animate then return nil end
    return {
        climb = extractFolderAnimationData(animate, "climb"),
        fall = extractFolderAnimationData(animate, "fall"),
        jump = extractFolderAnimationData(animate, "jump"),
        run = extractFolderAnimationData(animate, "run"),
        walk = extractFolderAnimationData(animate, "walk"),
        swim = extractFolderAnimationData(animate, "swim"),
        idle = extractFolderAnimationData(animate, "idle"),
    }
end

function resolveIdFromFolderData(folderData, childName, index)
    local chosen
    if folderData then
        chosen = folderData.byName[childName] or folderData.ordered[index] or folderData.first
    end
    return normalizeAnimationId(chosen)
end

function resolveIdFromFolderDataWithFallback(folderData, childName, index, fallbackId)
    if animState.settings.useFallbackWhenMissing then
        return resolveIdFromFolderData(folderData, childName, index) or normalizeAnimationId(fallbackId)
    end
    return resolveIdFromFolderData(folderData, childName, index)
end

function makeSingleAnimationData(name, rawId)
    local cleaned = normalizeAnimationId(rawId)
    if not cleaned then return nil end
    return { byName = { [name] = cleaned }, ordered = { cleaned }, first = cleaned }
end

function makeIdleAnimationData(rawIdleId)
    local cleaned = normalizeAnimationId(rawIdleId)
    if not cleaned then return nil end
    return {
        byName = { Animation1 = cleaned, Animation2 = cleaned },
        ordered = { cleaned, cleaned },
        first = cleaned,
    }
end

ANIM_KEYS = { "climb","fall","jump","run","walk","swim","idle" }

function hasAnimationFolderData(fd)
    return fd ~= nil and fd.first ~= nil
end

function countAnimationSetCoverage(animationSet)
    if not animationSet then return 0 end
    local covered = 0
    for _, k in ipairs(ANIM_KEYS) do
        if hasAnimationFolderData(animationSet[k]) then covered = covered + 1 end
    end
    return covered
end

function getCachedAnimationSet(userId)
    local entry = cacheGetEntry(animState.animationSetCache, userId, animState.settings.cacheTtlSeconds)
    if not entry then return nil end
    return entry.set
end

function setCachedAnimationSet(userId, set)
    if not userId or not set then return end
    cacheSetEntry(animState.animationSetCache, userId, { set = set, timestamp = os.clock() }, CACHE_MAX_ENTRIES.animationSet)
end

function getAnimationSetFromLivePlayer(userId)
    local ok, player = pcall(function() return Players:GetPlayerByUserId(userId) end)
    if not ok or not player then return nil end
    local character = player.Character
    if not character then return nil end
    local animate = character:FindFirstChild("Animate")
    if not animate then return nil end
    local set = buildAnimationSetFromAnimate(animate)
    return (countAnimationSetCoverage(set) > 0) and set or nil
end

function getAnimationSetFromDescription(userId)
    local desc = getTargetDescriptionCached(userId)
    if not desc then return nil end
    return {
        climb = makeSingleAnimationData("ClimbAnim", desc.ClimbAnimation),
        fall = makeSingleAnimationData("FallAnim",  desc.FallAnimation),
        jump = makeSingleAnimationData("JumpAnim",  desc.JumpAnimation),
        run = makeSingleAnimationData("RunAnim",   desc.RunAnimation),
        walk = makeSingleAnimationData("WalkAnim",  desc.WalkAnimation),
        swim = makeSingleAnimationData("Swim",      desc.SwimAnimation),
        idle = makeIdleAnimationData(desc.IdleAnimation),
    }
end

function getAnimationSetFromTempRig(userId)
    local rigType = getLocalRigType()
    local ok, rig = pcall(function() return Players:CreateHumanoidModelFromUserId(userId, rigType) end)
    if not ok or not rig then
        return nil
    end
    rig.Name = "AnimationMimicTempRig"
    local animate = rig:FindFirstChild("Animate") or rig:WaitForChild("Animate", 5)
    if not animate then rig:Destroy(); return nil end
    local set = buildAnimationSetFromAnimate(animate)
    rig:Destroy()
    return set
end

function getAnimationSetFromUserId(userId)
    local cached = getCachedAnimationSet(userId)
    if cached then return cached end

    local fromLive = getAnimationSetFromLivePlayer(userId)
    local liveCoverage = countAnimationSetCoverage(fromLive)
    if liveCoverage >= (animState.settings.minLiveCoverage or 1) and liveCoverage > 0 then
        setCachedAnimationSet(userId, fromLive)
        return fromLive
    end

    local fromDesc = getAnimationSetFromDescription(userId)
    local fromRig = getAnimationSetFromTempRig(userId)

    local function pickBetter(currentBest, candidate)
        if not candidate then return currentBest end
        local coverage = countAnimationSetCoverage(candidate.set)
        if coverage <= 0 then return currentBest end
        if not currentBest then
            return { set = candidate.set, coverage = coverage, priority = candidate.priority }
        end
        if coverage > currentBest.coverage then
            return { set = candidate.set, coverage = coverage, priority = candidate.priority }
        end
        if coverage == currentBest.coverage and candidate.priority > currentBest.priority then
            return { set = candidate.set, coverage = coverage, priority = candidate.priority }
        end
        return currentBest
    end

    local best = nil
    best = pickBetter(best, { set = fromLive, priority = 3 })
    best = pickBetter(best, { set = fromRig,  priority = 2 })
    best = pickBetter(best, { set = fromDesc, priority = 1 })

    if not best or not best.set then return nil end
    setCachedAnimationSet(userId, best.set)
    return best.set
end

function getAnimationSetFromUserIdWithRetry(userId, attempts)
    attempts = attempts or 2
    for i = 1, attempts do
        local set = getAnimationSetFromUserId(userId)
        if set then return set end
        if i < attempts then task.wait(0.12) end
    end
    return nil
end

function applyAnimationSetToDescriptionFields(desc, animationSet)
    if not desc or not animationSet then return false end
    local function resolveNumeric(folder, childName, idx, fb)
        return numericIdFromContentId(resolveIdFromFolderDataWithFallback(animationSet[folder], childName, idx, fb))
    end
    desc.ClimbAnimation = resolveNumeric("climb","ClimbAnim",1,R15_FALLBACK_ANIMATIONS.climb) or FALLBACK_ANIMATION_NUMERIC_IDS.climb
    desc.FallAnimation = resolveNumeric("fall", "FallAnim", 1,R15_FALLBACK_ANIMATIONS.fall)  or FALLBACK_ANIMATION_NUMERIC_IDS.fall
    desc.JumpAnimation = resolveNumeric("jump", "JumpAnim", 1,R15_FALLBACK_ANIMATIONS.jump)  or FALLBACK_ANIMATION_NUMERIC_IDS.jump
    desc.RunAnimation = resolveNumeric("run",  "RunAnim",  1,R15_FALLBACK_ANIMATIONS.run)   or FALLBACK_ANIMATION_NUMERIC_IDS.run
    desc.WalkAnimation = resolveNumeric("walk", "WalkAnim", 1,R15_FALLBACK_ANIMATIONS.walk)  or FALLBACK_ANIMATION_NUMERIC_IDS.walk
    desc.SwimAnimation = resolveNumeric("swim", "Swim",     1,R15_FALLBACK_ANIMATIONS.swim)  or FALLBACK_ANIMATION_NUMERIC_IDS.swim
    desc.IdleAnimation = resolveNumeric("idle", "Animation1",1,R15_FALLBACK_ANIMATIONS.idle1) or FALLBACK_ANIMATION_NUMERIC_IDS.idle1
    return true
end

function getCurrentScaleValues(humanoid)
    if not humanoid then return nil end
    local function readSV(name, fallback)
        local nv = humanoid:FindFirstChild(name)
        return (nv and nv:IsA("NumberValue") and nv.Value) or fallback
    end
    local okDesc, desc = pcall(function() return humanoid:GetAppliedDescription() end)
    return {
        height = readSV("BodyHeightScale",  okDesc and desc and desc.HeightScale     or 1),
        width = readSV("BodyWidthScale",   okDesc and desc and desc.WidthScale      or 1),
        depth = readSV("BodyDepthScale",   okDesc and desc and desc.DepthScale      or 1),
        head = readSV("HeadScale",        okDesc and desc and desc.HeadScale       or 1),
        bodyType = readSV("BodyTypeScale",    okDesc and desc and desc.BodyTypeScale   or 0),
        proportion = readSV("BodyProportionScale", okDesc and desc and desc.ProportionScale or 0),
    }
end

local destroyBodyColorSnapshot = destroyColorSnapshot

function restoreCharacterColors(character, snapshot)
    if not character or not snapshot then return end
    if snapshot.bodyColors then
        local src = snapshot.bodyColors
        local ok, clone = pcall(function() return src:Clone() end)
        if ok and clone then
            local current = character:FindFirstChildOfClass("BodyColors")
            if current then pcall(function() current:Destroy() end) end
            local applied = pcall(function() clone.Parent = character end)
            if not applied then
                pcall(function() clone:Destroy() end)
                task.defer(function()
                    task.wait(0.12)
                    if not character.Parent then return end
                    local ok2, clone2 = pcall(function() return src:Clone() end)
                    if not ok2 or not clone2 then return end
                    pcall(function()
                        local bc = character:FindFirstChildOfClass("BodyColors")
                        if bc then bc:Destroy() end
                        clone2.Parent = character
                    end)
                end)
            end
        end
    end
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("BasePart") then
            local saved = snapshot.partColors[child.Name]
            if saved then child.BrickColor = saved end
        end
    end
end

function replicateAnimationStateForOthers(character, animationSet)
    if not animState.settings.replicateDescriptionToOthers then return true end
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end
    local liveColorSnapshot = snapshotCharacterColors(character)
    local scales = getCurrentScaleValues(humanoid)
    local ok, currentDesc = pcall(function() return humanoid:GetAppliedDescription() end)
    if not ok or not currentDesc then
        destroyBodyColorSnapshot(liveColorSnapshot)
        return false
    end
    if scales then
        currentDesc.HeightScale = scales.height
        currentDesc.WidthScale = scales.width
        currentDesc.DepthScale = scales.depth
        currentDesc.HeadScale = scales.head
        currentDesc.BodyTypeScale = scales.bodyType
        currentDesc.ProportionScale = scales.proportion
    end
    if not applyAnimationSetToDescriptionFields(currentDesc, animationSet) then
        destroyBodyColorSnapshot(liveColorSnapshot)
        return false
    end
    if humanoid.ApplyDescriptionClientServer then
        local okCS = pcall(function() humanoid:ApplyDescriptionClientServer(currentDesc) end)
        if okCS then
            restoreCharacterColors(character, liveColorSnapshot)
            task.defer(function()
                task.wait(0.08)
                restoreCharacterColors(character, liveColorSnapshot)
                destroyBodyColorSnapshot(liveColorSnapshot)
            end)
            return true
        end
    end
    destroyBodyColorSnapshot(liveColorSnapshot)
    return false
end

function applyAnimationSetViaDescription(humanoid, animationSet)
    if not humanoid or not animationSet then return false end
    local ok, currentDesc = pcall(function() return humanoid:GetAppliedDescription() end)
    if not ok or not currentDesc then return false end
    if not applyAnimationSetToDescriptionFields(currentDesc, animationSet) then return false end
    if humanoid.ApplyDescriptionClientServer then
        local okCS = pcall(function() humanoid:ApplyDescriptionClientServer(currentDesc) end)
        if okCS then return true end
    end
    local okApply = pcall(function() humanoid:ApplyDescription(currentDesc) end)
    return okApply
end

function stopDirectController(character)
    if not character then return end
    local controller = animState.directControllerByChar[character]
    if not controller then return end
    if controller.connection and controller.connection.Connected then
        controller.connection:Disconnect()
    end
    if controller.tracks then
        for _, track in pairs(controller.tracks) do
            pcall(function() track:Stop(0.08) end)
        end
    end
    if controller.animations then
        for _, animation in pairs(controller.animations) do
            pcall(function() animation:Destroy() end)
        end
    end
    animState.directControllerByChar[character] = nil
end

function stopAllDirectControllers()
    local chars = {}
    for c in pairs(animState.directControllerByChar) do chars[#chars+1] = c end
    for _, c in ipairs(chars) do stopDirectController(c) end
    animState.directControllerByChar = {}
end

function pruneStaleCharacterAnimationState(currentCharacter)
    for character in pairs(animState.originalByCharacter) do
        if character ~= currentCharacter and (not character.Parent or character ~= LOCAL_PLAYER.Character) then
            resetCharacterAnimations(character)
            animState.originalByCharacter[character] = nil
        end
    end

    for character in pairs(animState.directControllerByChar) do
        if character ~= currentCharacter and (not character.Parent or character ~= LOCAL_PLAYER.Character) then
            stopDirectController(character)
        end
    end
end

function startDirectController(character, animationSet)
    if not animState.settings.useDirectTrackFallback then return false end
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid or not animationSet then return false end

    stopDirectController(character)

    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        local ok, a = pcall(function() return Instance.new("Animator") end)
        if ok and a then a.Parent = humanoid; animator = a end
    end
    if not animator then return false end

    local function getAnimId(folder, childName, idx, fb)
        return resolveIdFromFolderDataWithFallback(animationSet[folder], childName, idx, fb)
    end
    local idMap = {
        idle = getAnimId("idle",  "Animation1", 1, R15_FALLBACK_ANIMATIONS.idle1),
        run = getAnimId("run",   "RunAnim",    1, R15_FALLBACK_ANIMATIONS.run),
        walk = getAnimId("walk",  "WalkAnim",   1, R15_FALLBACK_ANIMATIONS.walk),
        jump = getAnimId("jump",  "JumpAnim",   1, R15_FALLBACK_ANIMATIONS.jump),
        fall = getAnimId("fall",  "FallAnim",   1, R15_FALLBACK_ANIMATIONS.fall),
        climb = getAnimId("climb", "ClimbAnim",  1, R15_FALLBACK_ANIMATIONS.climb),
        swim = getAnimId("swim",  "Swim",       1, R15_FALLBACK_ANIMATIONS.swim),
    }

    local tracks, animations = {}, {}
    local createdAny = false
    for stateName, animId in pairs(idMap) do
        if animId then
            local animation = Instance.new("Animation")
            animation.Name = "Mimic_" .. stateName
            animation.AnimationId = animId
            animations[stateName] = animation
            local okT, track = pcall(function() return animator:LoadAnimation(animation) end)
            if okT and track then
                track.Priority = (stateName == "idle") and Enum.AnimationPriority.Idle or Enum.AnimationPriority.Movement
                track.Looped = (stateName ~= "jump" and stateName ~= "fall")
                tracks[stateName] = track
                createdAny = true
            end
        end
    end

    if not createdAny then
        for _, a in pairs(animations) do pcall(function() a:Destroy() end) end
        return false
    end

    local controller = { tracks = tracks, animations = animations, connection = nil, active = nil, nextUpdateAt = 0 }
    animState.directControllerByChar[character] = controller

    local function playState(nextState)
        if controller.active == nextState then
            local t = controller.tracks[nextState]
            if t and not t.IsPlaying then pcall(function() t:Play(0.08,1,1) end) end
            return
        end
        controller.active = nextState
        for name, track in pairs(controller.tracks) do
            if name == nextState then
                pcall(function() if not track.IsPlaying then track:Play(0.08,1,1) end end)
            else
                pcall(function() if track.IsPlaying then track:Stop(0.08) end end)
            end
        end
    end

    controller.connection = RunService.Heartbeat:Connect(function()
        if not animState.active or not character.Parent then
            stopDirectController(character); return
        end
        local now = os.clock()
        if now < controller.nextUpdateAt then return end
        controller.nextUpdateAt = now + 0.03

        local moveMag = humanoid.MoveDirection.Magnitude
        local humState = humanoid:GetState()

        if humState == Enum.HumanoidStateType.Freefall then
            if tracks.fall then playState("fall") elseif tracks.jump then playState("jump") end; return
        end
        if humState == Enum.HumanoidStateType.Jumping   and tracks.jump  then playState("jump");  return end
        if humState == Enum.HumanoidStateType.Climbing  and tracks.climb then playState("climb"); return end
        if humState == Enum.HumanoidStateType.Swimming  and tracks.swim  then playState("swim");  return end
        if moveMag > 0.08 then
            if tracks.run then playState("run") elseif tracks.walk then playState("walk") end; return
        end
        if tracks.idle then playState("idle") end
    end)

    return true
end

function applyFolderDataToFolder(character, folder, folderData, shouldRemember)
    if not folder then return 0 end
    local changed = 0
    local idx = 0
    for _, child in ipairs(folder:GetChildren()) do
        if child:IsA("Animation") then
            idx = idx + 1
            local resolvedId = resolveIdFromFolderData(folderData, child.Name, idx)
            if resolvedId then
                if shouldRemember then rememberOriginal(character, child) end
                child.AnimationId = resolvedId
                changed = changed + 1
            end
        end
    end
    return changed
end

function getFirstAnimationInFolder(folder)
    if not folder then return nil end
    for _, child in ipairs(folder:GetChildren()) do
        if child:IsA("Animation") then return child end
    end
    return nil
end

function applySlotFromSet(character, animate, animationSet, folderName, fallbackId, shouldRemember)
    local folder = animate:FindFirstChild(folderName)
    local setData = animationSet and animationSet[folderName]
    if applyFolderDataToFolder(character, folder, setData, shouldRemember) > 0 then return true end
    local firstAnim = getFirstAnimationInFolder(folder)
    if not firstAnim or not animState.settings.useFallbackWhenMissing then return false end
    local fallback = normalizeAnimationId(fallbackId)
    if not fallback then return false end
    if shouldRemember then rememberOriginal(character, firstAnim) end
    firstAnim.AnimationId = fallback
    return true
end

function applyIdleFromSet(character, animate, idleData, shouldRemember)
    local idleFolder = animate:FindFirstChild("idle")
    if not idleFolder then return false end
    local applied = 0
    local idx = 0
    for _, child in ipairs(idleFolder:GetChildren()) do
        if child:IsA("Animation") then
            idx = idx + 1
            local fb = nil
            if animState.settings.useFallbackWhenMissing then
                fb = (child.Name == "Animation2") and R15_FALLBACK_ANIMATIONS.idle2 or R15_FALLBACK_ANIMATIONS.idle1
            end
            local resolvedIdle = resolveIdFromFolderDataWithFallback(idleData, child.Name, idx, fb)
            if resolvedIdle then
                if shouldRemember then rememberOriginal(character, child) end
                child.AnimationId = resolvedIdle
                applied = applied + 1
            end
        end
    end
    return applied > 0
end

function hardResetAnimator(humanoid)
    if not humanoid then return end
    local tracks = humanoid:GetPlayingAnimationTracks()
    for _, track in ipairs(tracks) do track:Stop(0) end
end

function flushAnimationState(character)
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local tracks = humanoid:GetPlayingAnimationTracks()
    for _, track in ipairs(tracks) do track:Stop(0) end
end

function refreshAnimate(character)
    local animate = character and character:FindFirstChild("Animate")
    if animate and animate:IsA("LocalScript") then
        animate.Disabled = true
        task.wait()
        animate.Disabled = false
    end
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local tracks = humanoid:GetPlayingAnimationTracks()
        for _, track in ipairs(tracks) do track:Stop(0) end
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end
end

function forceAnimationKick(character)
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    humanoid:Move(Vector3.new(0, 0, 0), true)
    humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    task.wait()
    humanoid:ChangeState(Enum.HumanoidStateType.Running)
    task.defer(function()
        if not character.Parent then return end
        local playingTracks = humanoid:GetPlayingAnimationTracks()
        if #playingTracks > 0 then return end
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        task.wait()
        humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end)
end

function scrubTracksForDuration(character, seconds)
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    local tracksStart = humanoid:GetPlayingAnimationTracks()
    for _, track in ipairs(tracksStart) do track:Stop(0) end
    task.wait(seconds or 0.2)
    local tracksEnd = humanoid:GetPlayingAnimationTracks()
    for _, track in ipairs(tracksEnd) do track:Stop(0) end
end

function applyAnimationSetToCharacter(character, animationSet)
    if not character or not animationSet then return false end
    local animate = character:FindFirstChild("Animate")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end

    hardResetAnimator(humanoid)

    local applied = 0
    if animate then
        for _, spec in ipairs(SLOT_SPECS) do
            if applySlotFromSet(character, animate, animationSet, spec.folder, spec.fallback, true) then
                applied = applied + 1
            end
        end
        if applyIdleFromSet(character, animate, animationSet.idle, true) then
            applied = applied + 1
        end
    end

    if applied > 0 then
        stopDirectController(character)
        refreshAnimate(character)
    else
        local descApplied = applyAnimationSetViaDescription(humanoid, animationSet)
        if descApplied then
            stopDirectController(character)
        else
            if not startDirectController(character, animationSet) then return false end
        end
    end

    forceAnimationKick(character)
    replicateAnimationStateForOthers(character, animationSet)
    task.defer(function()
        if not animState.active then return end
        if not (env and env.EmoteMimic and type(env.EmoteMimic.Reapply) == "function") then return end
        pcall(function() env.EmoteMimic.Reapply() end)
    end)
    return true
end

function restoreOwnAnimationsHard(character)
    if not character then return false end
    local ownSet = getAnimationSetFromUserId(LOCAL_PLAYER.UserId)
    if not ownSet then return false end
    local animate = character:FindFirstChild("Animate")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end

    hardResetAnimator(humanoid)

    local applied = 0
    if animate then
        for _, spec in ipairs(SLOT_SPECS) do
            if applySlotFromSet(character, animate, ownSet, spec.folder, spec.fallback, false) then
                applied = applied + 1
            end
        end
        if applyIdleFromSet(character, animate, ownSet.idle, false) then
            applied = applied + 1
        end
    end

    if applied > 0 then
        stopDirectController(character)
        refreshAnimate(character)
    else
        if applyAnimationSetViaDescription(humanoid, ownSet) then
            stopDirectController(character)
        else
            if not animState.active then return false end
            if not startDirectController(character, ownSet) then return false end
        end
    end

    forceAnimationKick(character)
    replicateAnimationStateForOthers(character, ownSet)
    task.defer(function()
        if not animState.active then return end
        if not (env and env.EmoteMimic and type(env.EmoteMimic.Reapply) == "function") then return end
        pcall(function() env.EmoteMimic.Reapply() end)
    end)
    return true
end

function mimicAnimationsFromUserId(userId, forceApply)
    if not animState.active then return false end
    forceApply = forceApply ~= false and forceApply or false

    local numericUserId = tonumber(userId)
    if not numericUserId then return false end


    local character = LOCAL_PLAYER.Character
    if not character then return false end

    pruneStaleCharacterAnimationState(character)

    if not forceApply and animState.lastSourceUserId == numericUserId then
        return true
    end

    animState.applyToken = animState.applyToken + 1
    local applyToken = animState.applyToken


    local targetAvatarType = getUserAvatarType(numericUserId)
    if targetAvatarType == "R6" then
        animState.lastSourceUserId = nil
        restoreOwnAnimationsHard(character)
        flushAnimationState(character)
        return false
    end

    local animationSet = getAnimationSetFromUserIdWithRetry(numericUserId, 3)
    if not animationSet then
        animState.lastSourceUserId = nil
        return false
    end

    if applyToken ~= animState.applyToken then return false end

    local switchedTarget = animState.lastSourceUserId and animState.lastSourceUserId ~= numericUserId
    if switchedTarget then
        restoreOwnAnimationsHard(character)
        flushAnimationState(character)
        scrubTracksForDuration(character, 0.18)
        if applyToken ~= animState.applyToken then return false end
    end

    animState.lastSourceUserId = numericUserId
    animState.pinnedTargetUserId = numericUserId

    local ok = applyAnimationSetToCharacter(character, animationSet)
    if not ok then return false end

    task.defer(function()
        task.wait(0.2)
        if applyToken ~= animState.applyToken then return end
        if not character.Parent then return end
        local hum = character:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if #hum:GetPlayingAnimationTracks() == 0 then
            restoreOwnAnimationsHard(character)
            applyAnimationSetToCharacter(character, animationSet)
        end
    end)

    return ok
end

function mimicAnimationsFromTarget(target)
    if not animState.active then return false end
    local userId = resolveTargetToUserId(target)
    if not userId then return false end
    animState.lastTargetInput = target
    animState.pinnedTargetUserId = userId
    if animState.settings.invalidateAnimationCacheOnTargetSwitch then
        animState.animationSetCache[userId] = nil
    end
    return mimicAnimationsFromUserId(userId, true)
end

function disconnectAllConnections()
    for _, conn in ipairs(animState.connections) do
        if conn and conn.Connected then conn:Disconnect() end
    end
    animState.connections = {}
end

function clearRuntimeCaches()
    animState.animationSetCache = {}
end

function restoreCharacterToSelf(character)
    if not character then return false end
    resetCharacterAnimations(character)
    local restored = restoreOwnAnimationsHard(character)
    flushAnimationState(character)
    return restored
end

function animCleanup()
    if not animState.active then return end
    animState.active = false
    animState.lastSourceUserId = nil
    animState.pinnedTargetUserId = nil
    animState.lastTargetInput = nil
    animState.applyToken = animState.applyToken + 1
    disconnectAllConnections()
    local character = LOCAL_PLAYER.Character
    stopAllDirectControllers()
    restoreCharacterToSelf(character)
    flushAnimationState(character)
    animState.originalByCharacter = {}
    clearRuntimeCaches()
end
animState.cleanup = animCleanup

if env then
    env.CloneAnimationsFromTarget = mimicAnimationsFromTarget
    env.AnimationMimicCleanup = animCleanup
end

if env and env.__EmoteMimicState and type(env.__EmoteMimicState.cleanup) == "function" then
    pcall(env.__EmoteMimicState.cleanup)
end

local function deepCopyTable(value, seen)
    if type(value) ~= "table" then return value end
    seen = seen or {}
    if seen[value] then return seen[value] end
    local out = {}
    seen[value] = out
    for k, v in pairs(value) do
        out[deepCopyTable(k, seen)] = deepCopyTable(v, seen)
    end
    return out
end

local emoteState = {
    active = CharCfg['Enabled'] == true,
    targetInput = CONFIG.target,
    currentUserId = nil,
    applyToken = 0,
    connections = {},
    emoteCache = {},
    cacheTtlSeconds = 20,
    cleanup = nil,
    settings = {
        autoApplyOnRespawn = true,
    },
}

if env then env.__EmoteMimicState = emoteState end

local function disconnectEmoteConnections()
    for _, conn in ipairs(emoteState.connections) do
        if conn and conn.Connected then conn:Disconnect() end
    end
    emoteState.connections = {}
end

local function clearEmoteCaches()
    emoteState.emoteCache = {}
end

local function getEmoteDataFromDescription(desc)
    if not desc then return nil end
    local emotes = nil
    local equipped = nil

    if type(desc.GetEmotes) == "function" then
        local ok, value = pcall(function() return desc:GetEmotes() end)
        if ok and type(value) == "table" then emotes = deepCopyTable(value) end
    end
    if type(desc.GetEquippedEmotes) == "function" then
        local ok, value = pcall(function() return desc:GetEquippedEmotes() end)
        if ok and type(value) == "table" then equipped = deepCopyTable(value) end
    end

    if emotes == nil then
        local ok, value = pcall(function() return desc.Emotes end)
        if ok and type(value) == "table" then emotes = deepCopyTable(value) end
    end
    if equipped == nil then
        local ok, value = pcall(function() return desc.EquippedEmotes end)
        if ok and type(value) == "table" then equipped = deepCopyTable(value) end
    end

    if type(emotes) ~= "table" then emotes = {} end
    if type(equipped) ~= "table" then equipped = {} end

    return { emotes = emotes, equipped = equipped }
end

local function hasAnyTableEntries(value)
    return type(value) == "table" and next(value) ~= nil
end

local function hasUsableEmotePayload(emoteData)
    if type(emoteData) ~= "table" then return false end
    return hasAnyTableEntries(emoteData.emotes) or hasAnyTableEntries(emoteData.equipped)
end

local function getEmoteDataFromLivePlayer(userId)
    local okPlayer, player = pcall(function() return Players:GetPlayerByUserId(userId) end)
    if not okPlayer or not player then return nil end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return nil end
    local okDesc, desc = pcall(function() return humanoid:GetAppliedDescription() end)
    if not okDesc or not desc then return nil end
    local data = getEmoteDataFromDescription(desc)
    pcall(function() desc:Destroy() end)
    return data
end

local function getEmoteDataFromUserId(userId)
    local entry = cacheGetEntry(emoteState.emoteCache, userId, emoteState.cacheTtlSeconds)
    if entry and entry.data then
        return {
            emotes = deepCopyTable(entry.data.emotes),
            equipped = deepCopyTable(entry.data.equipped),
        }
    end

    local data = nil
    local desc = getTargetDescriptionCached(userId)
    if desc then
        data = getEmoteDataFromDescription(desc)
        pcall(function() desc:Destroy() end)
    end
    if not hasUsableEmotePayload(data) then
        data = getEmoteDataFromLivePlayer(userId)
    end
    if not data or not hasUsableEmotePayload(data) then return nil end

    cacheSetEntry(emoteState.emoteCache, userId, { data = data, timestamp = os.clock() }, CACHE_MAX_ENTRIES.emoteData)
    return data
end

local function setEmoteDataOnDescription(description, emoteData)
    if not description or not emoteData then return false end
    local applied = false
    if hasAnyTableEntries(emoteData.emotes) then
        local okSetEmotes = pcall(function()
            description:SetEmotes(deepCopyTable(emoteData.emotes))
        end)
        applied = applied or okSetEmotes
    end
    if hasAnyTableEntries(emoteData.equipped) then
        local okSetEquipped = pcall(function()
            description:SetEquippedEmotes(deepCopyTable(emoteData.equipped))
        end)
        applied = applied or okSetEquipped
    end
    return applied
end

local function applyScaleValuesToDescription(desc, scales)
    if not desc or not scales then return end
    desc.HeightScale = scales.height
    desc.WidthScale = scales.width
    desc.DepthScale = scales.depth
    desc.HeadScale = scales.head
    desc.BodyTypeScale = scales.bodyType
    desc.ProportionScale = scales.proportion
end

local function restoreCharacterColorsSafely(character, colorSnapshot)
    if not colorSnapshot then return end
    restoreCharacterColors(character, colorSnapshot)
    task.defer(function()
        task.wait(0.06)
        if character and character.Parent then
            restoreCharacterColors(character, colorSnapshot)
        end
    end)
    task.defer(function()
        task.wait(0.2)
        if character and character.Parent then
            restoreCharacterColors(character, colorSnapshot)
        end
        destroyBodyColorSnapshot(colorSnapshot)
    end)
end

local function applyEmotesToHumanoid(humanoid, emoteData)
    if not humanoid or not emoteData then return false end
    if not hasUsableEmotePayload(emoteData) then return false end

    local character = humanoid.Parent
    local colorSnapshot = snapshotCharacterColors(character)
    local scaleSnapshot = getCurrentScaleValues(humanoid)
    local liveDescription = humanoid:FindFirstChildOfClass("HumanoidDescription")
        or humanoid:FindFirstChild("HumanoidDescription")

    if liveDescription and setEmoteDataOnDescription(liveDescription, emoteData) then
        destroyBodyColorSnapshot(colorSnapshot)
        task.defer(function()
            if not emoteState.active or not liveDescription.Parent then return end
            setEmoteDataOnDescription(liveDescription, emoteData)
        end)
        return true
    end

    local okDesc, currentDesc = pcall(function() return humanoid:GetAppliedDescription() end)
    if not okDesc or not currentDesc then
        destroyBodyColorSnapshot(colorSnapshot)
        return false
    end

    if not setEmoteDataOnDescription(currentDesc, emoteData) then
        destroyBodyColorSnapshot(colorSnapshot)
        pcall(function() currentDesc:Destroy() end)
        return false
    end

    applyScaleValuesToDescription(currentDesc, scaleSnapshot)

    if humanoid.ApplyDescriptionClientServer then
        local okCS = pcall(function() humanoid:ApplyDescriptionClientServer(currentDesc) end)
        if okCS then
            restoreCharacterColorsSafely(character, colorSnapshot)
            pcall(function() currentDesc:Destroy() end)
            return true
        end
    end

    local okApply = pcall(function() humanoid:ApplyDescription(currentDesc) end)
    restoreCharacterColorsSafely(character, colorSnapshot)
    pcall(function() currentDesc:Destroy() end)
    return okApply
end

local function mimicEmotesFromUserId(userId)
    if not emoteState.active then return false end
    local numericUserId = tonumber(userId)
    if not numericUserId then return false end

    local character = LOCAL_PLAYER.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end

    emoteState.applyToken = emoteState.applyToken + 1
    local applyToken = emoteState.applyToken

    local emoteData = getEmoteDataFromUserId(numericUserId)
    if not emoteData then return false end
    if applyToken ~= emoteState.applyToken or not emoteState.active then return false end

    local ok = false
    for attempt = 1, 3 do
        ok = applyEmotesToHumanoid(humanoid, emoteData)
        if ok then break end
        if attempt < 3 then task.wait(0.12) end
    end
    if ok then
        emoteState.currentUserId = numericUserId
    end
    return ok
end

local function mimicEmotesFromTarget(target)
    if not emoteState.active then return false end
    local userId = resolveTargetToUserId(target)
    if not userId then return false end
    emoteState.targetInput = target
    return mimicEmotesFromUserId(userId)
end

local function reapplyEmotes()
    if emoteState.currentUserId then
        return mimicEmotesFromUserId(emoteState.currentUserId)
    end
    return mimicEmotesFromTarget(emoteState.targetInput or CONFIG.target)
end

local function useDefaultEmoteTarget()
    emoteState.currentUserId = nil
    return mimicEmotesFromTarget(CONFIG.target)
end

local function emoteCleanup()
    if not emoteState.active then return end
    emoteState.active = false
    emoteState.applyToken = emoteState.applyToken + 1
    disconnectEmoteConnections()
    clearEmoteCaches()
    if env and env.__EmoteMimicState == emoteState then
        env.__EmoteMimicState = nil
    end
end
emoteState.cleanup = emoteCleanup

if emoteState.settings.autoApplyOnRespawn then
    local conn = LOCAL_PLAYER.CharacterAdded:Connect(function(char)
        if not emoteState.active then return end
        emoteState.applyToken = emoteState.applyToken + 1
        local respawnToken = emoteState.applyToken
        local hum = char:WaitForChild("Humanoid", 10)
        if not hum or respawnToken ~= emoteState.applyToken or not emoteState.active then return end
        task.spawn(function()
            local delays = { 0.2, 0.45, 0.8 }
            for _, delayTime in ipairs(delays) do
                if not emoteState.active or respawnToken ~= emoteState.applyToken or not char.Parent then return end
                task.wait(delayTime)
                if not emoteState.active or respawnToken ~= emoteState.applyToken or not char.Parent then return end
                if reapplyEmotes() then break end
            end
            task.wait(0.9)
            if not emoteState.active or respawnToken ~= emoteState.applyToken or not char.Parent then return end
            reapplyEmotes()
        end)
    end)
    table.insert(emoteState.connections, conn)
end

if env then
    env.EmoteMimic = {
        SetTarget = mimicEmotesFromTarget,
        SetTargetUserId = mimicEmotesFromUserId,
        Reapply = reapplyEmotes,
        UseDefaultTarget = useDefaultEmoteTarget,
        Cleanup = emoteCleanup,
    }
    env.CloneEmotesFromTarget = mimicEmotesFromTarget
    env.CloneEmotesFromUserId = mimicEmotesFromUserId
    env.EmoteMimicCleanup = emoteCleanup
end

task.defer(function()
    if not emoteState.active then return end
    mimicEmotesFromTarget(CONFIG.target)
end)

local function switchTargetSafe(target)
    if target == nil then return false end
    local outfitTriggered = false
    local outfitApi = env and env.OutfitCopy
    if outfitApi and type(outfitApi.SetTarget) == "function" then
        local ok = pcall(function() outfitApi.SetTarget(target) end)
        outfitTriggered = ok
    elseif env and type(env.CopySetUserId) == "function" then
        local ok = pcall(function() env.CopySetUserId(target) end)
        outfitTriggered = ok
    end
    task.defer(function()
        if animState.active then
            mimicAnimationsFromTarget(target)
        end
        if emoteState.active then
            mimicEmotesFromTarget(target)
        end
    end)
    return outfitTriggered
end

local function fullComboCleanup()
    pcall(teardown)
    pcall(animCleanup)
    pcall(emoteCleanup)
end

if env then
    env.SwitchTargetSafe = switchTargetSafe
    env.SetTargetSafe = switchTargetSafe
    env.FullComboCleanup = fullComboCleanup
    env.CloneFullCleanup = fullComboCleanup
end

task.defer(function()
    if not animState.active then return end
    if animState.pinnedTargetUserId then
        mimicAnimationsFromUserId(animState.pinnedTargetUserId)
    elseif animState.lastSourceUserId then
        mimicAnimationsFromUserId(animState.lastSourceUserId)
    elseif animState.lastTargetInput ~= nil then
        mimicAnimationsFromTarget(animState.lastTargetInput)
    else
        mimicAnimationsFromTarget(CONFIG.target)
    end
end)

if animState.settings.autoApplyOnRespawn then
    local conn = LOCAL_PLAYER.CharacterAdded:Connect(function(newCharacter)
        if not animState.active then return end
        animState.applyToken = animState.applyToken + 1
        local respawnToken = animState.applyToken
        pruneStaleCharacterAnimationState(newCharacter)
        local hum = newCharacter:WaitForChild("Humanoid", 10)
        if not hum or respawnToken ~= animState.applyToken or not animState.active then return end
        task.wait(0.15)
        if respawnToken ~= animState.applyToken or not animState.active or not newCharacter.Parent then return end
        task.spawn(function()
            local backoff = 0.25
            for _ = 1, 4 do
                if not animState.active or respawnToken ~= animState.applyToken or not newCharacter.Parent then return end
                if animState.pinnedTargetUserId and mimicAnimationsFromUserId(animState.pinnedTargetUserId, true) then return end
                if animState.lastSourceUserId and mimicAnimationsFromUserId(animState.lastSourceUserId, true) then return end
                if animState.lastTargetInput ~= nil and mimicAnimationsFromTarget(animState.lastTargetInput) then return end
                task.wait(backoff)
                if not animState.active or respawnToken ~= animState.applyToken then return end
                backoff = math.min(backoff * 2, 2)
            end
        end)
    end)
    table.insert(animState.connections, conn)
end


end;
