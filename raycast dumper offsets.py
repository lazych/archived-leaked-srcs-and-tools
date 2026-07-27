import idaapi
import ida_bytes
import ida_nalt
import ida_segment
import idautils

TARGET = "Raycast"
ANCHORS = ("FindPartOnRay", "Blockcast", "Spherecast", "Shapecast")
FN_OFFS = (0x80, 0x78, 0x88, 0x70, 0x90)


def base():
    return ida_nalt.get_imagebase()


def q(ea):
    return ida_bytes.get_qword(ea)


def is_exec(ea):
    seg = ida_segment.getseg(ea)
    return bool(seg and (seg.perm & ida_segment.SEGPERM_EXEC))


def cstr(ea, n=96):
    if not ea or ea == idaapi.BADADDR:
        return ""
    b = bytearray()
    for i in range(n):
        c = ida_bytes.get_byte(ea + i)
        if c == 0:
            break
        if 32 <= c < 127:
            b.append(c)
        else:
            return ""
    return b.decode() if b else ""


def find_exact_string(name):
    for s in idautils.Strings():
        try:
            if str(s) == name:
                return int(s.ea)
        except Exception:
            pass
    return idaapi.BADADDR


def bin_find_all(needle: bytes, limit=256):
    b = base()
    end = b + 0x20000000
    pats = ida_bytes.compiled_binpat_vec_t()
    hexpat = " ".join(f"{x:02X}" for x in needle)
    ida_bytes.parse_binpat_str(pats, b, hexpat, 16)
    if len(pats) == 0:
        return []
    out = []
    ea = b
    while ea < end and len(out) < limit:
        r = ida_bytes.bin_search(ea, end, pats, ida_bytes.BIN_SEARCH_FORWARD)
        found = r[0] if isinstance(r, tuple) else r
        if found == idaapi.BADADDR or found < ea:
            break
        if (found & 7) == 0:
            out.append(found)
        ea = found + 1
    return out


def walk_worldroot_methods(start_ea, mode="cm"):
    names = []
    ea = start_ea
    while True:
        a = cstr(q(ea))
        b = cstr(q(ea + 8))
        if mode == "cm":
            if a != "WorldRoot" or not b:
                break
            names.append(b)
        else:
            if b != "WorldRoot" or not a:
                break
            names.append(a)
        ea += 16
    return names


def find_worldroot_method_table():
    wr = find_exact_string("WorldRoot")
    if wr == idaapi.BADADDR:
        raise RuntimeError('exact string "WorldRoot" not found')

    best = None
    for hit in bin_find_all(wr.to_bytes(8, "little"), limit=128):
        for mode in ("cm", "mc"):
            names = walk_worldroot_methods(hit, mode)
            if TARGET not in names:
                continue
            if not all(a in names for a in ANCHORS):
                continue
            score = (len(names), -hit)
            if best is None or score > best[0]:
                best = (score, hit, mode, names)

    if not best:
        raise RuntimeError("WorldRoot method-name table not found")
    _, ea, mode, names = best
    return ea, mode, names


def looks_like_desc_ptr(v):
    b = base()
    if v < b or v >= b + 0x20000000:
        return False
    if (v - b) < 0x4000000:
        return False
    if is_exec(v):
        return False
    seg = ida_segment.getseg(v)
    return seg is not None


def find_desc_pointer_table(method_count):
    anchor = find_exact_string("FindPartOnRay")
    if anchor == idaapi.BADADDR:
        anchor = find_exact_string(TARGET)
    if anchor == idaapi.BADADDR:
        raise RuntimeError("method string cluster not found")

    best = []
    run = []
    start = (anchor - 0x400) & ~7
    for ea in range(start, anchor, 8):
        v = q(ea)
        if looks_like_desc_ptr(v):
            run.append((ea, v))
            continue
        if len(run) > len(best):
            best = run[:]
        run = []
    if len(run) > len(best):
        best = run[:]

    if len(best) == method_count:
        return best

    exact = []
    run = []
    for ea in range(start, anchor, 8):
        v = q(ea)
        if looks_like_desc_ptr(v):
            run.append((ea, v))
        else:
            if len(run) == method_count:
                exact.append(run[:])
            run = []
    if len(run) == method_count:
        exact.append(run[:])
    if exact:
        exact.sort(key=lambda r: -r[-1][0])
        return exact[0]

    if abs(len(best) - method_count) <= 2 and best:
        print(f"[!] desc table len {len(best)} != methods {method_count}; using closest run")
        return best

    raise RuntimeError(
        f"BoundFuncDesc pointer table not found (got {len(best)}, need {method_count})"
    )


def try_live_fn_off(desc_va):
    name = cstr(q(desc_va + 8))
    if name and name != TARGET:
        return None, name
    for off in FN_OFFS:
        fn = q(desc_va + off)
        if fn and is_exec(fn):
            return off, name or TARGET
    return None, name


def main():
    b = base()
    print("imagebase", hex(b))

    tbl_ea, mode, methods = find_worldroot_method_table()
    idx = methods.index(TARGET)
    print(f"WorldRoot name table @ {tbl_ea:#x} mode={mode} count={len(methods)}")
    print(f"  {TARGET} index = {idx}")

    desc_tbl = find_desc_pointer_table(len(methods))
    print(
        f"BoundFuncDesc ptr table @ {desc_tbl[0][0]:#x} .. {desc_tbl[-1][0]:#x} "
        f"count={len(desc_tbl)}"
    )

    if idx >= len(desc_tbl):
        raise RuntimeError("Raycast index out of range for desc pointer table")

    desc_va = desc_tbl[idx][1]
    desc_rva = desc_va - b
    fn_off, live_name = try_live_fn_off(desc_va)
    if fn_off is None:
        fn_off = 0x80

    print()
    print("=== RESULT ===")
    print(f"RaycastBoundDesc = {desc_rva:#x}")
    print(f"RaycastBoundFn   = {fn_off:#x}")
    print(f"desc VA         = {desc_va:#x}")
    if live_name:
        print(f"live name@+8    = {live_name!r}")
    else:
        print("live name@+8    = <empty on disk; normal for BSS desc>")
    print()
    print("Offsets.h:")
    print(f"  inline constexpr uintptr_t RaycastBoundDesc = {desc_rva:#x};")
    print(f"  inline constexpr uintptr_t RaycastBoundFn   = {fn_off:#x};")

    print()
    print("--- nearby methods (index -> rva) ---")
    for i in range(max(0, idx - 2), min(len(methods), idx + 3)):
        rva = desc_tbl[i][1] - b if i < len(desc_tbl) else -1
        mark = " <<<" if i == idx else ""
        print(f"  [{i:02d}] {methods[i]:<32} {rva:#x}{mark}")


if __name__ == "__main__":
    main()
