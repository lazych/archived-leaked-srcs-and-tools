import subprocess
import sys
import ctypes
import os

def _ensure_admin():
    try:
        is_admin = ctypes.windll.shell32.IsUserAnAdmin()
    except Exception:
        is_admin = False
    if not is_admin:
        print("\n  Not running as Administrator — relaunching with elevation...", flush=True)
        try:
            ctypes.windll.shell32.ShellExecuteW(
                None, "runas",
                sys.executable,
                " ".join(f'"{a}"' for a in sys.argv),
                None, 1
            )
        except Exception as e:
            print(f"  Failed to elevate: {e}", flush=True)
            input("  Press Enter to continue without admin (some features disabled)...")
        sys.exit(0)

_ensure_admin()

def install_deps():
    pkgs = ["pefile", "yara-python", "colorama"]
    for pkg in pkgs:
        mod = pkg.replace("-python", "").replace("-", "_")
        try:
            __import__(mod)
        except ImportError:
            print(f"  Installing {pkg}...", flush=True)
            subprocess.check_call(
                [sys.executable, "-m", "pip", "install", pkg, "--quiet"],
                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
            )

print("\n  Please wait — setting up dependencies...", flush=True)
install_deps()
print("  Dependencies ready.\n", flush=True)

import re
import mmap
import time
import threading
from pathlib import Path
from datetime import datetime, timedelta
from concurrent.futures import ThreadPoolExecutor, as_completed
from collections import defaultdict

try:
    import pefile
    HAS_PEFILE = True
except ImportError:
    HAS_PEFILE = False

try:
    import yara
    HAS_YARA = True
except ImportError:
    HAS_YARA = False

from colorama import init, Fore, Style
init(autoreset=True)
RED    = Fore.RED
YELLOW = Fore.YELLOW
GREEN  = Fore.GREEN
CYAN   = Fore.CYAN
BOLD   = Style.BRIGHT
RESET  = Style.RESET_ALL
DIM    = Style.DIM

C2_DOMAINS = [
    "i-like.boats", "powercat.dog", "devruntime.cy", "zetolacs-cloud.top",
    "frozi.cc", "exo-api.tf", "nuzzyservices.com", "darkside.cy",
    "balista.lol", "phobos.top", "phobosransom.com", "pee-files.nl",
    "vcc-library.uk", "luckyware.co", "luckyware.cc", "luckyware.pw",
    "dhszo.darkside.cy", "risesmp.net", "luckystrike.pw", "krispykreme.top",
    "vcc-redistrbutable.help", "i-slept-with-ur.mom", "luckyware.queenmc.pl",
]

C2_IPS = ["91.92.243.218", "188.114.96.11"]

MALICIOUS_PROCESSES = ["Berok.exe", "Retev.exe", "Zetolac.exe", "HPSR.exe"]

IMGUI_HEX_BLOB    = re.compile(rb'std::string\s+F[a-zA-Z0-9]{5,}\s*=\s*"(\\x[0-9a-fA-F]{2}){20,}"')
IMGUI_SYSTEM_CALL = re.compile(rb'\bsystem\s*\(\s*[A-Za-z_]')

VCXPROJ_PATTERNS = [
    (re.compile(rb'powershell\s+-WindowStyle\s+Hidden', re.IGNORECASE), "hidden powershell"),
    (re.compile(rb'iwr\s+-Uri',                         re.IGNORECASE), "iwr download"),
    (re.compile(rb'cmd\.exe\s+/b\s+/c',                re.IGNORECASE), "cmd /b /c"),
    (re.compile(rb'cmd\.exe\s+/c\s+/b',                re.IGNORECASE), "cmd /c /b"),
    (re.compile(rb'Invoke-WebRequest',                  re.IGNORECASE), "Invoke-WebRequest"),
]

VCXPROJ_QUICKCHECK = (b"powershell", b"iwr", b"cmd.exe", b"invoke-webrequest")

SDK_PATTERN = re.compile(
    rb'namespace\s+VccLibaries|namespace\s+SDKInfector|'
    rb'Bombakla|Rundollay|InfectSDK|InfectINIT',
    re.IGNORECASE
)

SDK_STRINGS_DISPLAY = {
    b"namespace vcclibar":  "namespace VccLibaries",
    b"namespace sdkinfect": "namespace SDKInfector",
    b"bombakla":            "Bombakla",
    b"rundollay":           "Rundollay",
    b"infectsdk":           "InfectSDK",
    b"infectinit":          "InfectINIT",
}

TEMP_FILE_RE = re.compile(r'^[A-Z]{2,3}\d{10,13}(\.exe)?$')

TARGET_EXTENSIONS = {
    ".exe", ".dll",
    ".vcxproj", ".csproj",
    ".suo",
    ".h", ".hpp", ".cpp",
}

IMGUI_FILENAMES_SET = {
    "imgui_impl_win32.cpp",
    "imgui_impl_win32.h",
    "imgui.cpp",
    "imgui_widgets.cpp",
    "imgui_draw.cpp",
}

SKIP_DIRS = {
    "quarantine", "luckykiller", ".git", "node_modules",
    "__pycache__", ".vs",
}

SKIP_PATH_FRAGMENTS = (
    "\\windows kits\\",
    "\\microsoft visual studio\\",
    "\\qt\\tools\\",
    "\\qt\\examples\\",
    "\\pyside",
    "\\luau\\cli\\",
)

XOR_KEY_BYTES = b"NtExploreProcess"
MZ_MAGIC      = b"MZ"
PE_MIN_SIZE   = 64
MMAP_THRESH   = 512 * 1024


def is_admin():
    try:
        return bool(ctypes.windll.shell32.IsUserAnAdmin())
    except Exception:
        return False


def clear():
    os.system("cls" if os.name == "nt" else "clear")


def pause():
    input(f"\n  {DIM}Press Enter to return to menu...{RESET}")


def fmt_eta(seconds):
    if seconds <= 0 or seconds > 86400:
        return "--:--"
    return str(timedelta(seconds=int(seconds)))[2:]


def _read_file(path, size):
    if size == 0:
        return b""
    if size > MMAP_THRESH:
        try:
            with open(path, "rb") as f:
                mm = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
                data = mm[:]
                mm.close()
            return data
        except Exception:
            pass
    with open(path, "rb") as f:
        return f.read()


class Threat:
    __slots__ = ("path", "reason", "action_taken", "_printed")

    def __init__(self, path, reason):
        self.path         = path
        self.reason       = reason
        self.action_taken = "none"
        self._printed     = False


class LuckyKiller:
    def __init__(self, scan_roots, auto_remove=True, block=True,
                 dry_run=False, workers=0):
        self.scan_roots  = scan_roots
        self.auto_remove = auto_remove
        self.block       = block
        self.dry_run     = dry_run
        self.workers     = workers or (os.cpu_count() or 4) * 4

        self.threats         = []
        self._lock           = threading.Lock()
        self._files_scanned  = 0
        self._start_time     = 0.0
        self._yara_rules     = None
        self._pending_logs   = []

        if HAS_YARA:
            self._compile_yara()

    def _compile_yara(self):
        src = r"""
rule Luckyware_C2 {
    strings:
        $d1="devruntime.cy" nocase $d2="zetolacs-cloud.top" nocase
        $d3="frozi.cc" nocase $d4="exo-api.tf" nocase
        $d5="nuzzyservices.com" nocase $d6="darkside.cy" nocase
        $d7="balista.lol" nocase $d8="phobos.top" nocase
        $d9="vcc-library.uk" nocase $d10="luckyware.co" nocase
        $d11="luckyware.cc" nocase $d12="91.92.243.218" nocase
        $d13="188.114.96.11" nocase $d14="risesmp.net" nocase
        $d15="luckystrike.pw" nocase $d16="krispykreme.top" nocase
        $d17="i-slept-with-ur.mom" nocase $d18="vcc-redistrbutable.help" nocase
    condition: any of them
}
rule Luckyware_XOR_Key {
    strings: $k = "NtExploreProcess"
    condition: $k
}
rule Luckyware_SDK {
    strings:
        $ns1 = "namespace VccLibaries" nocase
        $ns2 = "namespace SDKInfector" nocase
        $f1 = "Bombakla" nocase $f2 = "Rundollay" nocase
        $f3 = "InfectSDK" nocase $f4 = "InfectINIT" nocase
    condition: any of them
}
rule Luckyware_BuildEvent {
    strings:
        $ps  = "powershell -WindowStyle Hidden" nocase
        $iwr = "iwr -Uri" nocase
        $cmd = "cmd.exe /b /c" nocase
    condition: any of them
}
rule Luckyware_ImGui {
    strings:
        $h = /std::string F[a-zA-Z0-9]{5,}\s*=\s*"(\\x[0-9a-fA-F]{2}){20,}"/
    condition: $h
}
"""
        try:
            self._yara_rules = yara.compile(source=src)
        except Exception as e:
            self._ilog("WARN", f"YARA compile failed: {e}")

    def _fmt_line(self, level, msg):
        ts = datetime.now().strftime("%H:%M:%S")
        icons = {
            "FOUND": f"{RED}[!]{RESET}",
            "CLEAN": f"{GREEN}[+]{RESET}",
            "INFO":  f"{CYAN}[*]{RESET}",
            "WARN":  f"{YELLOW}[~]{RESET}",
            "ACT":   f"{BOLD}{YELLOW}[>]{RESET}",
        }
        return f"  {icons.get(level, '[?]')} [{ts}] {msg}"

    def _ilog(self, level, msg):
        print(self._fmt_line(level, msg))

    def _qlog(self, level, msg):
        with self._lock:
            self._pending_logs.append(self._fmt_line(level, msg))

    def _flush_logs(self):
        with self._lock:
            lines = self._pending_logs[:]
            self._pending_logs.clear()
        for line in lines:
            print(line)

    def _add_threat(self, path, reason):
        t = Threat(path, reason)
        with self._lock:
            self.threats.append(t)
        return t

    def _is_noisy_path(self, path_lower):
        return path_lower.startswith(SKIP_PATH_FRAGMENTS) or \
               any(frag in path_lower for frag in SKIP_PATH_FRAGMENTS)

    def _wipe_file(self, t):
        if self.dry_run:
            t.action_taken = "dry-run (would wipe)"
            return
        try:
            size = os.path.getsize(t.path)
            with open(t.path, "wb") as f:
                f.write(b"\x00" * size)
            os.remove(t.path)
            t.action_taken = "wiped & deleted"
            self._qlog("ACT", f"WIPED: {t.path}")
        except Exception as e:
            t.action_taken = f"wipe failed: {e}"

    def _clean_vcxproj(self, t):
        if self.dry_run:
            t.action_taken = "dry-run (would clean vcxproj)"
            return
        try:
            with open(t.path, "rb") as f:
                raw = f.read()
            lines   = raw.split(b"\n")
            cleaned = [l for l in lines
                       if not any(p.search(l) for p, _ in VCXPROJ_PATTERNS)]
            if len(cleaned) != len(lines):
                with open(t.path, "wb") as f:
                    f.write(b"\n".join(cleaned))
                n = len(lines) - len(cleaned)
                t.action_taken = f"cleaned ({n} malicious lines removed)"
                self._qlog("ACT", f"CLEANED vcxproj ({n} lines): {t.path}")
            else:
                t.action_taken = "no changes needed"
        except Exception as e:
            t.action_taken = f"clean failed: {e}"

    def _patch_pe(self, t):
        if not HAS_PEFILE:
            t.action_taken = "pefile not installed"
            return
        if self.dry_run:
            t.action_taken = "dry-run (would patch PE)"
            return
        try:
            pe      = pefile.PE(t.path)
            patched = False
            for sec in pe.sections:
                name = sec.Name.decode(errors="replace").strip("\x00")
                if name.startswith(".rcd") and name != ".rcdata":
                    if sec.Characteristics & 0x20000000:
                        sec.Characteristics &= ~0x20000000
                        patched = True
            if patched:
                pe.write(t.path)
                t.action_taken = "PE patched (execute bits cleared)"
                self._qlog("ACT", f"PE PATCHED: {t.path}")
            pe.close()
        except Exception as e:
            t.action_taken = f"patch failed: {e}"

    def _kill_process(self, name):
        if self.dry_run:
            return
        try:
            r = subprocess.run(["taskkill", "/F", "/IM", name],
                               capture_output=True, timeout=5)
            if r.returncode == 0:
                self._ilog("ACT", f"Killed process: {name}")
        except Exception:
            pass

    def _clean_imgui(self, t):
        if self.dry_run:
            t.action_taken = "dry-run (would clean imgui)"
            return
        try:
            with open(t.path, "rb") as f:
                raw = f.read()
            cleaned = IMGUI_HEX_BLOB.sub(b"/* LUCKYKILLER_REMOVED */", raw)
            cleaned = IMGUI_SYSTEM_CALL.sub(b"/* LUCKYKILLER_REMOVED */", cleaned)
            if cleaned != raw:
                with open(t.path, "wb") as f:
                    f.write(cleaned)
                t.action_taken = "imgui cleaned"
                self._qlog("ACT", f"CLEANED imgui: {t.path}")
            else:
                t.action_taken = "no changes made"
        except Exception as e:
            t.action_taken = f"clean failed: {e}"

    def _remove_sdk_injection(self, t, matched_lower):
        if self.dry_run:
            t.action_taken = "dry-run (would restore SDK header)"
            return
        try:
            with open(t.path, "rb") as f:
                lines = f.readlines()
            cleaned = [l for l in lines if matched_lower not in l.lower()]
            if len(cleaned) != len(lines):
                with open(t.path, "wb") as f:
                    f.writelines(cleaned)
                t.action_taken = "SDK injection line removed"
                self._qlog("ACT", f"SDK CLEANED: {t.path}")
        except Exception as e:
            t.action_taken = f"SDK clean failed: {e}"

    def _scan_pe(self, path, size):
        if not HAS_PEFILE or size < PE_MIN_SIZE:
            return
        try:
            with open(path, "rb") as f:
                magic = f.read(2)
            if magic != MZ_MAGIC:
                return

            pe = pefile.PE(path, fast_load=True)
            flagged = False
            for sec in pe.sections:
                name = sec.Name.decode(errors="replace").strip("\x00")
                if name.startswith(".rcd") and name != ".rcdata":
                    entropy    = sec.get_entropy()
                    executable = bool(sec.Characteristics & 0x20000000)
                    t = self._add_threat(
                        path,
                        f"PE infection: malicious section '{name}' "
                        f"entropy={entropy:.2f} exec={executable}"
                    )
                    if self.auto_remove:
                        self._patch_pe(t)
                    flagged = True
                    break

            if not flagged and pe.__data__.count(MZ_MAGIC) > 1:
                t = self._add_threat(path, "PE infection: multiple MZ headers (dropper)")
                if self.auto_remove:
                    self._patch_pe(t)
            pe.close()
        except Exception:
            pass

    def _scan_vcxproj(self, path, size):
        if size == 0:
            return
        try:
            data      = _read_file(path, size)
            data_low  = data.lower()
            if not any(kw in data_low for kw in VCXPROJ_QUICKCHECK):
                return
            hits = [label for pat, label in VCXPROJ_PATTERNS if pat.search(data)]
            if hits:
                t = self._add_threat(path, f"VCXPROJ infection: {', '.join(hits)}")
                if self.auto_remove:
                    self._clean_vcxproj(t)
        except Exception:
            pass

    def _scan_suo(self, path, size):
        if size == 0:
            return
        try:
            with open(path, "rb") as f:
                chunk = f.read(min(4096, size))
            if XOR_KEY_BYTES in chunk:
                t = self._add_threat(path, "SUO hijack: XOR key found in .suo file")
                if self.auto_remove:
                    self._wipe_file(t)
        except Exception:
            pass

    def _scan_imgui(self, path, size, path_lower):
        if size == 0:
            return
        try:
            data = _read_file(path, size)

            has_xor  = XOR_KEY_BYTES in data
            has_blob = b"std::string" in data and bool(IMGUI_HEX_BLOB.search(data))

            if not (has_xor or has_blob):
                return

            has_system = bool(IMGUI_SYSTEM_CALL.search(data))

            if has_blob and (has_system or has_xor):
                parts = ["obfuscated hex blob"]
                if has_xor:
                    parts.append("XOR key")
                if has_system:
                    parts.append("system() dropper call")
                t = self._add_threat(path, f"ImGui infection: {' + '.join(parts)}")
                if self.auto_remove:
                    self._clean_imgui(t)
            elif has_xor and not self._is_noisy_path(path_lower):
                t = self._add_threat(path, "Source infection: XOR key NtExploreProcess found")
                if self.auto_remove:
                    self._clean_imgui(t)
        except Exception:
            pass

    def _scan_sdk_header(self, path, size, path_lower):
        if size == 0:
            return
        try:
            data = _read_file(path, size)
            m    = SDK_PATTERN.search(data)
            if not m:
                return
            matched_lower = m.group(0).lower()
            display = matched_lower.decode(errors="replace")
            for key, label in SDK_STRINGS_DISPLAY.items():
                if matched_lower.startswith(key):
                    display = label
                    break
            t = self._add_threat(path, f"SDK poisoning: '{display}' injected into header")
            if self.auto_remove:
                self._remove_sdk_injection(t, matched_lower)
        except Exception:
            pass

    def _scan_yara(self, path):
        if not self._yara_rules:
            return
        try:
            matches = self._yara_rules.match(path)
            for m in matches:
                self._add_threat(path, f"YARA: {m.rule}")
        except Exception:
            pass

    def _scan_temp_dirs(self):
        dirs = set()
        for env in ("TEMP", "TMP"):
            val = os.environ.get(env)
            if val:
                dirs.add(val)
        local = os.environ.get("LOCALAPPDATA")
        if local:
            dirs.add(os.path.join(local, "Temp"))
        roaming = os.environ.get("APPDATA")
        if roaming:
            dirs.add(roaming)

        for d in dirs:
            if not os.path.isdir(d):
                continue
            try:
                for entry in os.scandir(d):
                    if entry.is_file(follow_symlinks=False) and TEMP_FILE_RE.match(entry.name):
                        t = self._add_threat(entry.path, "Temp dropper: Luckyware chrono-named file")
                        if self.auto_remove:
                            self._wipe_file(t)
            except Exception:
                pass

    def _scan_windows_sdk(self):
        roots = []
        for base in [r"C:\Program Files (x86)\Windows Kits",
                     r"C:\Program Files\Windows Kits"]:
            if os.path.isdir(base):
                roots.append(base)
        if not roots:
            return

        tasks = []
        for root in roots:
            for entry in _fast_walk(root, skip_dirs=set()):
                if entry.name.endswith((".h", ".hpp")):
                    try:
                        sz = entry.stat(follow_symlinks=False).st_size
                    except Exception:
                        sz = 0
                    tasks.append((entry.path, sz, entry.path.lower()))

        self._ilog("INFO",
                   f"Scanning Windows SDK — {len(tasks):,} header files, please wait...")
        with ThreadPoolExecutor(max_workers=self.workers) as ex:
            futs = {ex.submit(self._scan_sdk_header, p, s, pl): p
                    for p, s, pl in tasks}
            for _ in as_completed(futs):
                pass
        self._flush_logs()

    def _kill_malicious_processes(self):
        self._ilog("INFO", "Checking for running Luckyware processes...")
        for proc in MALICIOUS_PROCESSES:
            self._kill_process(proc)

    def block_network(self):
        if not is_admin():
            self._ilog("WARN", "Admin required to modify HOSTS / firewall.")
            return
        hosts_path = r"C:\Windows\System32\drivers\etc\hosts"
        try:
            with open(hosts_path, "r", encoding="utf-8", errors="ignore") as f:
                current = f.read()
        except Exception as e:
            self._ilog("WARN", f"Could not read HOSTS: {e}")
            current = ""

        added = 0
        try:
            with open(hosts_path, "a", encoding="utf-8") as f:
                for d in C2_DOMAINS:
                    if d not in current:
                        f.write(f"\n0.0.0.0 {d}")
                        added += 1
        except Exception as e:
            self._ilog("WARN", f"HOSTS write error: {e}")

        self._ilog("CLEAN",
                   f"HOSTS: {added} new C2 domains blocked "
                   f"({len(C2_DOMAINS) - added} already present).")

        added_ips = 0
        for ip in C2_IPS:
            rule = f"LUCKYKILLER_BLOCK_{ip.replace('.', '_')}"
            chk = subprocess.run(
                ["netsh", "advfirewall", "firewall", "show", "rule", f"name={rule}"],
                capture_output=True
            )
            if chk.returncode != 0:
                r = subprocess.run([
                    "netsh", "advfirewall", "firewall", "add", "rule",
                    f"name={rule}", "dir=out", "action=block", f"remoteip={ip}"
                ], capture_output=True)
                if r.returncode == 0:
                    added_ips += 1

        self._ilog("CLEAN", f"Firewall: {added_ips} new IP block rules added.")
        subprocess.run(["ipconfig", "/flushdns"], capture_output=True)
        self._ilog("CLEAN", "DNS cache flushed.")

    def _dispatch(self, entry_tuple):
        path, ext, name, size = entry_tuple
        path_lower = path.lower()
        self._files_scanned += 1

        if name in IMGUI_FILENAMES_SET:
            self._scan_imgui(path, size, path_lower)
            return

        if ext == ".exe" or ext == ".dll":
            self._scan_pe(path, size)
            self._scan_yara(path)
        elif ext == ".vcxproj" or ext == ".csproj":
            self._scan_vcxproj(path, size)
        elif ext == ".suo":
            self._scan_suo(path, size)
        elif ext == ".h" or ext == ".hpp":
            self._scan_sdk_header(path, size, path_lower)
        elif ext == ".cpp":
            self._scan_imgui(path, size, path_lower)

    def _collect_files_with_spinner(self):
        SPINNERS = "⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
        found   = [0]
        stopped = [False]
        result  = []

        def _walk():
            for root in self.scan_roots:
                if not os.path.exists(root):
                    continue
                for entry in _fast_walk(root, SKIP_DIRS):
                    ext = os.path.splitext(entry.name)[1].lower()
                    if ext in TARGET_EXTENSIONS:
                        try:
                            size = entry.stat(follow_symlinks=False).st_size
                        except Exception:
                            size = 0
                        result.append((
                            entry.path,
                            ext,
                            entry.name.lower(),
                            size,
                        ))
                        found[0] += 1
            stopped[0] = True

        t = threading.Thread(target=_walk, daemon=True)
        t.start()
        i = 0
        while not stopped[0]:
            sp = SPINNERS[i % len(SPINNERS)]
            print(
                f"\r  {CYAN}{sp}{RESET}  Please wait — collecting files to scan...  "
                f"{CYAN}{found[0]:,}{RESET} found so far",
                end="", flush=True
            )
            i += 1
            time.sleep(0.08)
        t.join()

        print(
            f"\r  {GREEN}✓{RESET}  Collection complete — "
            f"{CYAN}{len(result):,}{RESET} relevant files found.               "
        )
        return result

    def run(self):
        self._start_time = time.time()

        if self.dry_run:
            self._ilog("WARN", "DRY RUN — no files will be modified.")

        self._kill_malicious_processes()
        if self.block:
            self.block_network()

        print()
        all_files = self._collect_files_with_spinner()
        total     = len(all_files)

        if total == 0:
            self._ilog("WARN", "No relevant files found in the specified path(s).")
            self._print_report()
            return

        sample_rate = 600
        est_str     = fmt_eta(total / sample_rate)
        print(
            f"\n  {DIM}Estimated scan time: ~{est_str}  "
            f"({self.workers} threads, {total:,} files){RESET}\n"
        )

        done      = 0
        _lock     = threading.Lock()
        BAR_W     = 38

        from collections import deque
        _rate_window = deque()
        _WINDOW_SECS = 15.0
        _prev_lines  = [0]   # lines drawn in last redraw, for cursor rewind

        def _smooth_rate():
            now = time.time()
            _rate_window.append((now, done))
            while len(_rate_window) > 1 and now - _rate_window[0][0] > _WINDOW_SECS:
                _rate_window.popleft()
            if len(_rate_window) < 2:
                elapsed = now - self._start_time
                return max(done / elapsed, 1) if elapsed > 0 else 1
            dt    = _rate_window[-1][0] - _rate_window[0][0]
            delta = _rate_window[-1][1] - _rate_window[0][1]
            return max(delta / dt, 1) if dt > 0 else 1

        def _trunc_path(path, maxlen=90):
            if len(path) <= maxlen:
                return path
            parts = path.split(os.sep)
            if len(parts) > 4:
                head = os.sep.join(parts[:2])
                tail = os.sep.join(parts[-2:])
                c = f"{head}{os.sep}\u2026{os.sep}{tail}"
                if len(c) <= maxlen:
                    return c
            return "\u2026" + path[-(maxlen - 1):]

        def _redraw():
            rate   = _smooth_rate()
            pct    = done / total
            bar_d  = int(pct * BAR_W)
            bar    = f"{GREEN}{chr(9608) * bar_d}{RESET}{chr(9617) * (BAR_W - bar_d)}"
            remain = (total - done) / rate
            t_col  = RED + BOLD if self.threats else GREEN + BOLD

            lines = []
            lines.append(
                f"  [{bar}]  {CYAN}{pct * 100:5.1f}%{RESET}  "
                f"{done:>7,}/{total:,}  "
                f"{rate:>5.0f} f/s  "
                f"ETA {YELLOW}{fmt_eta(remain)}{RESET}  "
                f"threats: {t_col}{len(self.threats)}{RESET}"
            )
            lines.append("")
            if self.threats:
                lines.append(f"  {BOLD}Infected files:{RESET}")
                for t in self.threats:
                    lines.append(f"    {RED}\u2022{RESET}  {_trunc_path(t.path)}")
            else:
                lines.append(f"  {DIM}Infected files: none{RESET}")

            # Rewind cursor to overwrite previous draw
            if _prev_lines[0]:
                sys.stdout.write(f"\033[{_prev_lines[0]}A")

            out = ""
            for ln in lines:
                out += ln + "\033[K\n"   # \033[K clears to end of line
            sys.stdout.write(out)
            sys.stdout.flush()
            _prev_lines[0] = len(lines)

        _redraw()

        def _scan_tick(entry_tuple):
            nonlocal done
            self._dispatch(entry_tuple)
            with _lock:
                done += 1
                if done % 200 == 0 or done == total:
                    _redraw()
                    _autoscroll_to_bottom()

        with ThreadPoolExecutor(max_workers=self.workers) as ex:
            futures = {ex.submit(_scan_tick, e): e for e in all_files}
            for _ in as_completed(futures):
                pass

        _redraw()
        print()

        self._ilog("INFO", "Scanning Temp / AppData for chrono-named droppers...")
        self._scan_temp_dirs()
        self._flush_logs()

        self._scan_windows_sdk()

        self._print_report()

    def _print_report(self):
        elapsed = time.time() - self._start_time
        print()
        print(f"{BOLD}{CYAN}{'─'*62}{RESET}")
        print(
            f"  {BOLD}SCAN COMPLETE{RESET}  ({elapsed:.1f}s)  |  "
            f"Files scanned: {CYAN}{self._files_scanned:,}{RESET}  |  "
            f"Threats: {(RED + BOLD) if self.threats else (GREEN + BOLD)}"
            f"{len(self.threats)}{RESET}"
        )
        print(f"{BOLD}{CYAN}{'─'*62}{RESET}")
        print()

        if not self.threats:
            print(f"  {GREEN}{BOLD}✓  No Luckyware infection detected.{RESET}")
        else:
            print(f"  {RED}{BOLD}✗  {len(self.threats)} THREAT(S) FOUND:{RESET}")
            print()
            groups = defaultdict(list)
            for t in self.threats:
                groups[t.reason.split(":")[0]].append(t)

            for category, items in sorted(groups.items()):
                print(f"  {YELLOW}{BOLD}[{category}]{RESET}  —  {len(items)} file(s)")
                for t in items:
                    acted = any(k in t.action_taken
                                for k in ("clean", "wipe", "patch", "removed"))
                    col = GREEN if acted else YELLOW
                    print(f"    {RED}•{RESET} {t.path}")
                    print(f"      {col}└─ {t.action_taken}{RESET}")
                print()

            print(f"  {YELLOW}Tip: Run Bitdefender after patching for final verification.{RESET}")
            print(f"  {YELLOW}Severely infected systems may require a clean Windows reinstall.{RESET}")
        print()


def _fast_walk(top, skip_dirs):
    try:
        with os.scandir(top) as it:
            entries = list(it)
    except PermissionError:
        return

    for entry in entries:
        if entry.is_file(follow_symlinks=False):
            yield entry
        elif entry.is_dir(follow_symlinks=False):
            if entry.name.lower() not in skip_dirs:
                yield from _fast_walk(entry.path, skip_dirs)


def get_all_drives():
    drives = []
    for letter in "CDEFGHIJKLMNOPQRSTUVWXYZ":
        d = f"{letter}:\\"
        if os.path.exists(d):
            drives.append(d)
    return drives or [os.path.expanduser("~")]


_CHINESE_FRAMES = [
    "危险软件清除系统  //  恶意代码检测",
    "病毒扫描进行中  //  系统防护激活",
    "网络威胁封锁中  //  幸运软件终结者",
    "恶意进程终止  //  注册表清洁完成",
    "系统完整性验证  //  数字守护者",
    "渗透检测引擎  //  幸运杀手启动",
    "代码注入防护  //  实时威胁分析",
    "内存扫描激活  //  安全屏障就绪",
    "根除恶意软件  //  系统净化完成",
    "威胁情报更新  //  零日防护启用",
]

_GLITCH_CHARS = "ﾊﾐﾋｰｳｼﾅﾓﾆｻﾜﾂｵﾘｱﾎﾃﾏｹﾒｴｶｷﾑﾕﾗｾﾈｽﾀﾇﾍ危险恶病扫检清护毒码网"

_title_stop  = threading.Event()
_title_frame = [0]


def _set_transparency(alpha: int = 218):
    try:
        hwnd = ctypes.windll.kernel32.GetConsoleWindow()
        if not hwnd:
            return
        GWL_EXSTYLE   = -20
        WS_EX_LAYERED = 0x00080000
        LWA_ALPHA      = 0x00000002
        style = ctypes.windll.user32.GetWindowLongW(hwnd, GWL_EXSTYLE)
        ctypes.windll.user32.SetWindowLongW(hwnd, GWL_EXSTYLE, style | WS_EX_LAYERED)
        ctypes.windll.user32.SetLayeredWindowAttributes(hwnd, 0, alpha, LWA_ALPHA)
        ctypes.windll.user32.MoveWindow(hwnd, 0, 0, 843, 837, True)
    except Exception:
        pass


def _lock_scroll():
    """Remove scrollback buffer and disable QuickEdit so user cannot scroll."""
    try:
        import ctypes.wintypes as wt
        k32 = ctypes.windll.kernel32

        # ── 1. Disable QuickEdit + Insert mode so mouse can't grab the scroll ──
        STD_INPUT  = -10
        STD_OUTPUT = -11
        hin  = k32.GetStdHandle(STD_INPUT)
        hout = k32.GetStdHandle(STD_OUTPUT)

        ENABLE_EXTENDED_FLAGS = 0x0080
        ENABLE_QUICK_EDIT     = 0x0040
        ENABLE_INSERT_MODE    = 0x0020
        mode = wt.DWORD(0)
        k32.GetConsoleMode(hin, ctypes.byref(mode))
        new_mode = (mode.value | ENABLE_EXTENDED_FLAGS) & ~(ENABLE_QUICK_EDIT | ENABLE_INSERT_MODE)
        k32.SetConsoleMode(hin, new_mode)

        # ── 2. Collapse the screen buffer to the window height → no scrollback ──
        class COORD(ctypes.Structure):
            _fields_ = [("X", wt.SHORT), ("Y", wt.SHORT)]

        class SMALL_RECT(ctypes.Structure):
            _fields_ = [("Left", wt.SHORT), ("Top", wt.SHORT),
                        ("Right", wt.SHORT), ("Bottom", wt.SHORT)]

        class CONSOLE_SCREEN_BUFFER_INFO(ctypes.Structure):
            _fields_ = [("dwSize",              COORD),
                        ("dwCursorPosition",     COORD),
                        ("wAttributes",          wt.WORD),
                        ("srWindow",             SMALL_RECT),
                        ("dwMaximumWindowSize",  COORD)]

        info = CONSOLE_SCREEN_BUFFER_INFO()
        k32.GetConsoleScreenBufferInfo(hout, ctypes.byref(info))
        win_h = info.srWindow.Bottom - info.srWindow.Top + 1
        win_w = info.srWindow.Right  - info.srWindow.Left + 1

        # Set buffer to exactly the window size → no hidden rows to scroll to
        new_size = COORD(win_w, win_h)
        k32.SetConsoleScreenBufferSize(hout, new_size)

        # Re-anchor the window view to row 0
        win_rect = SMALL_RECT(0, 0, win_w - 1, win_h - 1)
        k32.SetConsoleWindowInfo(hout, True, ctypes.byref(win_rect))
    except Exception:
        pass


def _autoscroll_to_bottom():
    """Force the console view to stay pinned at the cursor row."""
    try:
        import ctypes.wintypes as wt
        k32 = ctypes.windll.kernel32

        class COORD(ctypes.Structure):
            _fields_ = [("X", wt.SHORT), ("Y", wt.SHORT)]

        class SMALL_RECT(ctypes.Structure):
            _fields_ = [("Left", wt.SHORT), ("Top", wt.SHORT),
                        ("Right", wt.SHORT), ("Bottom", wt.SHORT)]

        class CONSOLE_SCREEN_BUFFER_INFO(ctypes.Structure):
            _fields_ = [("dwSize",             COORD),
                        ("dwCursorPosition",    COORD),
                        ("wAttributes",         wt.WORD),
                        ("srWindow",            SMALL_RECT),
                        ("dwMaximumWindowSize", COORD)]

        STD_OUTPUT = -11
        hout = k32.GetStdHandle(STD_OUTPUT)
        info = CONSOLE_SCREEN_BUFFER_INFO()
        k32.GetConsoleScreenBufferInfo(hout, ctypes.byref(info))

        win_h    = info.srWindow.Bottom - info.srWindow.Top + 1
        cur_row  = info.dwCursorPosition.Y
        buf_h    = info.dwSize.Y
        win_w    = info.srWindow.Right - info.srWindow.Left + 1

        # Pin view so cursor is always at the bottom row
        top  = max(0, cur_row - win_h + 2)
        bot  = top + win_h - 1
        if bot >= buf_h:
            bot = buf_h - 1
            top = max(0, bot - win_h + 1)

        win_rect = SMALL_RECT(0, top, win_w - 1, bot)
        k32.SetConsoleWindowInfo(hout, True, ctypes.byref(win_rect))
    except Exception:
        pass


def _title_animator():
    import random
    phrases = _CHINESE_FRAMES
    idx     = 0
    while not _title_stop.is_set():
        phrase = phrases[idx % len(phrases)]
        ctypes.windll.kernel32.SetConsoleTitleW(f" LuckyKiller  │  {phrase}")
        _title_frame[0] = idx
        idx += 1
        time.sleep(1.8)


def _start_effects():
    _set_transparency(218)
    _lock_scroll()
    _title_stop.clear()
    t = threading.Thread(target=_title_animator, daemon=True)
    t.start()


def _glitch_line():
    import random
    width  = 70
    frame  = _title_frame[0]
    random.seed(frame)
    chars  = [random.choice(_GLITCH_CHARS) if random.random() < 0.35 else " "
              for _ in range(width)]
    phrase = _CHINESE_FRAMES[frame % len(_CHINESE_FRAMES)]
    centre = phrase.center(width)
    merged = "".join(
        c if centre[i] != " " else chars[i]
        for i, c in enumerate(centre)
    )
    return merged


def print_banner():
    clear()
    print(f"""
{RED}{BOLD}
  ██╗     ██╗   ██╗ ██████╗██╗  ██╗██╗   ██╗██╗  ██╗██╗██╗     ██╗     ███████╗██████╗
  ██║     ██║   ██║██╔════╝██║ ██╔╝╚██╗ ██╔╝██║ ██╔╝██║██║     ██║     ██╔════╝██╔══██╗
  ██║     ██║   ██║██║     █████╔╝  ╚████╔╝ █████╔╝ ██║██║     ██║     █████╗  ██████╔╝
  ██║     ██║   ██║██║     ██╔═██╗   ╚██╔╝  ██╔═██╗ ██║██║     ██║     ██╔══╝  ██╔══██╗
  ███████╗╚██████╔╝╚██████╗██║  ██╗   ██║   ██║  ██╗██║███████╗███████╗███████╗██║  ██║
  ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
{RESET}""")
    print()
    print(f"  {DIM}Luckyware RAT — Full Detection, Removal & Blocking Tool{RESET}")
    status = (f"{GREEN}Administrator{RESET}" if is_admin()
              else f"{YELLOW}User (limited — some features require admin){RESET}")
    print(f"  Running as: {status}")
    print(f"  {DIM}{'─'*70}{RESET}")
    print()


def prompt_path():
    print(f"  {CYAN}Enter a folder path to scan, or press Enter to scan all drives:{RESET}")
    val = input(f"  {BOLD}>{RESET} ").strip().strip('"')
    if not val:
        return None
    if not os.path.exists(val):
        print(f"\n  {YELLOW}Path not found. Defaulting to all drives.{RESET}")
        return None
    return val


def menu():
    _start_effects()
    while True:
        print_banner()
        print(f"  {BOLD}MAIN MENU{RESET}\n")
        options = [
            ("1", "Full Scan + Auto-Remove + Block C2",
             "Recommended — scans everything, removes threats, blocks network"),
            ("2", "Full Scan Only (no removal)",
             "Detect threats and show report without making changes"),
            ("3", "Block C2 Domains & IPs Only",
             "Update HOSTS file and add Firewall rules immediately"),
            ("4", "Kill Luckyware Processes Only",
             "Terminate Berok.exe, Retev.exe, Zetolac.exe, HPSR.exe"),
            ("5", "Scan Specific Folder",
             "Choose a custom directory to scan"),
            ("6", "Dry Run (preview only)",
             "Show what would be detected/removed without touching files"),
            ("0", "Exit", ""),
        ]
        for num, label, desc in options:
            col = RED if num == "1" else CYAN
            print(f"  {col}{BOLD}[{num}]{RESET}  {BOLD}{label}{RESET}")
            if desc:
                print(f"       {DIM}{desc}{RESET}")
            print()

        choice = input(f"  {BOLD}Choose an option: {RESET}").strip()
        print()

        if choice == "0":
            print(f"  {GREEN}Goodbye.{RESET}\n")
            break

        elif choice == "1":
            LuckyKiller(scan_roots=get_all_drives(),
                        auto_remove=True, block=True, dry_run=False).run()
            pause()

        elif choice == "2":
            LuckyKiller(scan_roots=get_all_drives(),
                        auto_remove=False, block=False, dry_run=False).run()
            pause()

        elif choice == "3":
            if not is_admin():
                print(f"  {RED}Admin privileges required.{RESET}")
            else:
                tmp = LuckyKiller(scan_roots=[], block=True)
                tmp.block_network()
                print(f"\n  {GREEN}Done.{RESET}")
            pause()

        elif choice == "4":
            tmp = LuckyKiller(scan_roots=[])
            tmp._kill_malicious_processes()
            print(f"\n  {GREEN}Process sweep complete.{RESET}")
            pause()

        elif choice == "5":
            path = prompt_path()
            roots = [path] if path else get_all_drives()
            print()
            print(f"  {CYAN}Remove threats automatically?{RESET}")
            print(f"  {BOLD}[1]{RESET} Yes — scan and remove")
            print(f"  {BOLD}[2]{RESET} No  — scan and report only")
            print()
            sub = input(f"  {BOLD}>{RESET} ").strip()
            LuckyKiller(scan_roots=roots, auto_remove=(sub == "1"),
                        block=True, dry_run=False).run()
            pause()

        elif choice == "6":
            path = prompt_path()
            roots = [path] if path else get_all_drives()
            LuckyKiller(scan_roots=roots, auto_remove=False,
                        block=False, dry_run=True).run()
            pause()

        else:
            print(f"  {YELLOW}Invalid option. Try again.{RESET}")
            time.sleep(1)


if __name__ == "__main__":
    menu()