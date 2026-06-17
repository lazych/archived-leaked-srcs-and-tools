import struct, sys, os, ctypes, json
from ctypes import wintypes
from typing import Optional, List, Tuple

try:
    import pymem, pymem.process
except ImportError:
    print("[!] pip install pymem")
    sys.exit(1)


class FFlagsDumper:
    PREFIXES = ('FFlag', 'DFFlag', 'SFFlag', 'FInt', 'DFInt', 'SFInt',
                'FString', 'DFString', 'SFString', 'FLog', 'DFLog', 'SFLog')

    def __init__(self, process_name="RobloxPlayerBeta.exe"):
        self.process_name = process_name
        self.pm = None
        self.module = None
        self.base = 0
        self.size = 0
        self.fflags_ptr_rva = 0
        self.container_addr = 0
        self.version = ""

    def read_u64(self, addr):
        try:
            return struct.unpack('<Q', self.pm.read_bytes(addr, 8))[0]
        except:
            return 0

    def is_valid_ptr(self, val):
        return 0x10000 < val < 0x7FFFFFFFFFFF

    def read_std_string(self, addr):
        try:
            raw = self.pm.read_bytes(addr, 0x20)
        except:
            return None
        sz = struct.unpack_from('<Q', raw, 0x10)[0]
        cap = struct.unpack_from('<Q', raw, 0x18)[0]
        if sz == 0 or sz > 4096 or cap > 0xFFFFFF:
            return None
        try:
            if cap >= 16:
                ptr = struct.unpack_from('<Q', raw, 0)[0]
                if not self.is_valid_ptr(ptr):
                    return None
                buf = self.pm.read_bytes(ptr, min(sz, 512))
            else:
                buf = raw[:sz]
            return buf.decode('utf-8', errors='strict')
        except:
            return None

    def get_roblox_version(self):
        try:
            buf = ctypes.create_unicode_buffer(260)
            size = wintypes.DWORD(260)
            ctypes.windll.kernel32.QueryFullProcessImageNameW(
                self.pm.process_handle, 0, buf, ctypes.byref(size))
            folder = os.path.basename(os.path.dirname(buf.value))
            return folder if folder.startswith("version-") else ""
        except:
            return ""

    def attach(self):
        try:
            print(f"[*] Attaching to {self.process_name}...")
            self.pm = pymem.Pymem(self.process_name)
            self.module = pymem.process.module_from_name(
                self.pm.process_handle, self.process_name)
            self.base = self.module.lpBaseOfDll
            self.size = self.module.SizeOfImage
            print(f"[+] Attached!  Base: 0x{self.base:X}  Size: 0x{self.size:X}")
            self.version = self.get_roblox_version()
            if self.version:
                print(f"[+] Roblox Version: {self.version}")
            return True
        except pymem.exception.ProcessNotFound:
            print(f"[!] {self.process_name} not found")
            return False
        except Exception as e:
            print(f"[!] Attach error: {e}")
            return False

    def find_fflags_pointer(self):
        print("\n[*] Scanning for FFlags container...")
        chunk_sz = 0x100000
        scan_start = self.size // 2

        for rva_off in range(scan_start, self.size, chunk_sz):
            try:
                chunk = self.pm.read_bytes(self.base + rva_off, min(chunk_sz, self.size - rva_off))
            except:
                continue

            for i in range(0, len(chunk) - 7, 8):
                ptr = struct.unpack_from('<Q', chunk, i)[0]
                if not self.is_valid_ptr(ptr):
                    continue
                try:
                    hdr = self.pm.read_bytes(ptr, 0x40)
                except:
                    continue

                v00 = struct.unpack_from('<I', hdr, 0x00)[0]
                v08 = struct.unpack_from('<Q', hdr, 0x08)[0]
                v10 = struct.unpack_from('<Q', hdr, 0x10)[0]
                v30 = struct.unpack_from('<Q', hdr, 0x30)[0]
                v38 = struct.unpack_from('<Q', hdr, 0x38)[0]

                if (v00 == 0x3F800000 and self.is_valid_ptr(v08) and
                    5000 < v10 < 50000 and v30 == 0x7FFF and v38 == 0x8000):
                    self.fflags_ptr_rva = rva_off + i
                    self.container_addr = ptr
                    print(f"[+] FFlagList RVA: 0x{self.fflags_ptr_rva:X}")
                    print(f"[+] Container @ 0x{self.container_addr:X}  ({v10} elements)")
                    return True

            pct = (rva_off - scan_start) / (self.size - scan_start) * 100
            print(f"[*] Scanning... {pct:.0f}%", end='\r')

        print("\n[!] FFlags container not found!")
        return False

    def resolve_flag_rva(self, desc_ptr):
        if not self.is_valid_ptr(desc_ptr):
            return 0
        addr = self.read_u64(desc_ptr + 0xC0)
        if self.base <= addr < self.base + self.size:
            return addr - self.base
        return 0

    def dump_fflags(self):
        list_head = self.read_u64(self.container_addr + 0x08)
        count = self.read_u64(self.container_addr + 0x10)
        if not self.is_valid_ptr(list_head):
            print("[!] Invalid list head!")
            return []

        fflags, seen, visited = [], set(), set()
        node = self.read_u64(list_head)

        while self.is_valid_ptr(node) and node != list_head and len(visited) < count + 100:
            if node in visited:
                break
            visited.add(node)

            for off_name, off_desc in [(0x10, 0x30), (0x50, 0x70)]:
                name = self.read_std_string(node + off_name)
                if name and name not in seen:
                    rva = self.resolve_flag_rva(self.read_u64(node + off_desc))
                    seen.add(name)
                    if rva:
                        fflags.append((name, rva))

            node = self.read_u64(node)
            if len(fflags) % 1000 == 0 and fflags:
                print(f"[*] {len(fflags)} flags resolved", end='\r')

        print(f"\n[+] Resolved {len(fflags)} flags")
        return fflags

    def _noah_art(self, prefix="//"):
        lines = [
            "  ██████   █████                    █████     ",
            " ▒▒██████ ▒▒███                    ▒▒███      ",
            "  ▒███▒███ ▒███   ██████   ██████   ▒███████  ",
            "  ▒███▒▒███▒███  ███▒▒███ ▒▒▒▒▒███  ▒███▒▒███ ",
            "  ▒███ ▒▒██████ ▒███ ▒███  ███████  ▒███ ▒███ ",
            "  ▒███  ▒▒█████ ▒███ ▒███ ███▒▒███  ▒███ ▒███ ",
            "  █████  ▒▒█████▒▒██████ ▒▒████████ ████ █████",
            " ▒▒▒▒▒    ▒▒▒▒▒  ▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒ ",
        ]
        return "\n".join(f"{prefix}{l}" for l in lines) + "\n"

    def _clean(self, name):
        return name.replace('-', '_').replace('.', '_').replace(' ', '_')

    def save_header(self, fflags, filename="offsets.hpp"):
        fflags_sorted = sorted(fflags, key=lambda x: x[0])
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("#pragma once\n")
            f.write("#include <string>\n")
            f.write(f"// Roblox Version = {self.version}\n")
            f.write(f"// FFlagList RVA: 0x{self.fflags_ptr_rva:X}\n")
            f.write(f"// Total flags: {len(fflags)}\n")
            f.write("// Discord: https://discord.gg/Dqtb9kY5uR\n")
            f.write(self._noah_art("//"))
            f.write("\n\n\n")
            f.write("namespace FFlags\n{\n")
            f.write(f"\tuintptr_t FFlagList = 0x{self.fflags_ptr_rva:X};\n")
            for name, rva in fflags_sorted:
                f.write(f"\tuintptr_t {self._clean(name)} = 0x{rva:X};\n")
            f.write("}\n")
        print(f"[+] Saved {filename}")

    def save_python(self, fflags, filename="offsets.py"):
        fflags_sorted = sorted(fflags, key=lambda x: x[0])
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(f"# Roblox Version = {self.version}\n")
            f.write(f"# FFlagList RVA: 0x{self.fflags_ptr_rva:X}\n")
            f.write(f"# Total flags: {len(fflags)}\n")
            f.write("# Discord: https://discord.gg/Dqtb9kY5uR\n")
            f.write(self._noah_art("#"))
            f.write("\n\n")
            f.write(f"FFlagList = 0x{self.fflags_ptr_rva:X}\n\n")
            for name, rva in fflags_sorted:
                f.write(f"{self._clean(name)} = 0x{rva:X}\n")
        print(f"[+] Saved {filename}")

    def save_json(self, fflags, filename="offsets.json"):
        fflags_sorted = sorted(fflags, key=lambda x: x[0])
        data = {
            "version": self.version,
            "fflag_list_rva": f"0x{self.fflags_ptr_rva:X}",
            "total_flags": len(fflags),
            "discord": "https://discord.gg/Dqtb9kY5uR",
            "flags": {}
        }
        for name, rva in fflags_sorted:
            data["flags"][name] = f"0x{rva:X}"
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2)
        print(f"[+] Saved {filename}")

    def save_csharp(self, fflags, filename="Offsets.cs"):
        fflags_sorted = sorted(fflags, key=lambda x: x[0])
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(f"// Roblox Version = {self.version}\n")
            f.write(f"// FFlagList RVA: 0x{self.fflags_ptr_rva:X}\n")
            f.write(f"// Total flags: {len(fflags)}\n")
            f.write("// Discord: https://discord.gg/Dqtb9kY5uR\n")
            f.write(self._noah_art("//"))
            f.write("\n")
            f.write("namespace Noah\n{\n")
            f.write("    public static class FFlags\n    {\n")
            f.write(f"        public const long FFlagList = 0x{self.fflags_ptr_rva:X};\n")
            for name, rva in fflags_sorted:
                f.write(f"        public const long {self._clean(name)} = 0x{rva:X};\n")
            f.write("    }\n")  
            f.write("}\n")
        print(f"[+] Saved {filename}")

    def run(self):
        print("=" * 50)
        print("  Noah FFlags Dumper")
        print("=" * 50)

        if not self.attach() or not self.find_fflags_pointer():
            return False

        fflags = self.dump_fflags()
        if not fflags:
            print("[!] No FFlags found!")
            return False

        valid = [(n, r) for n, r in fflags
                 if len(n) >= 3 and n[0].isalpha() and
                 n.replace('-','').replace('.','').replace('_','').isalnum()]

        print(f"[+] Valid flags: {len(valid)}")
        self.save_header(valid)
        self.save_python(valid)
        self.save_json(valid)
        self.save_csharp(valid)

        print(f"\n{'='*50}")
        print(f"  FFlagList RVA: 0x{self.fflags_ptr_rva:X}")
        print(f"  Total: {len(valid)} flags")
        print(f"{'='*50}")
        return True


def main():
    dumper = FFlagsDumper()
    try:
        if dumper.run():
            print("\n[+] Done! Check offsets.hpp / offsets.py / offsets.json / Offsets.cs")
        else:
            print("\n[!] Dump failed!")
            sys.exit(1)
    except KeyboardInterrupt:
        print("\n[!] Interrupted")
        sys.exit(1)
    except Exception as e:
        print(f"\n[!] Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
