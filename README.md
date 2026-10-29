# tr01

A matching decompilation of Tomb Raider (Core Design, 1996), the DOS
version, built and verified on Linux through Wine.

The goal is C source that compiles, with the original toolchain, into
functions that are byte-for-byte identical to the original executable's,
and links into a DOS executable that runs the game.

This repository contains no game code or data. You need your own copy of
the game, see [`orig/README.md`](orig/README.md).

## Sources

This is not a clean-room project. Core's game source, as later ported to
Windows, is used as a reference for names, structures and logic. It is a
reference only: the source here is written to match the binary, which
differs from the port in many places, and carries none of its comments.

## Target

The retail `TOMB.EXE`, dated 1996-10-30, which the GOG and Steam
releases ship as `TOMBRAID/TOMBno3Dfx.EXE`:

- 32-bit LE executable for the DOS/4GW extender, entry point `0x4a574`
- Object 1, code, at `0x10000`, `0x7fa3e` bytes
- Object 2, 16-bit code, at `0x90000`
- Objects 3 and 4, stack and small data, at `0xa0000` and `0xb0000`
- Object 5, data, at `0xc0000`, `0x808e0` bytes of which most is
  zero-initialized

The game code comes first, at `0x10010`–`0x46e00`, one module after the
other in alphabetical order of the source files (`CAMERA`, `DRAW`,
`EFFECTS`, ..., `WOLF`, then the PC-specific `3D_GEN` and on). The
Watcom C library, the Escape FMV player (`RPL*.C`, `124*.ASM`, `$Id`
strings by MFC and MDV), the VGA and VESA code and the HMI sound
library follow.

```sh
just analyze   # writes build/functions_ghidra.csv, seeds config/symbols.csv
```

## Toolchain

Watcom C/C++ 10.6. Its run-time copyright strings say 1988-1995, which
fits 10.0a through 10.6; the C library settles it. Searching the
original for each function of each version's `CLIB3R.LIB` and
`MATH387R.LIB`, with the bytes under fixups as wildcards, finds 199 of
10.6's functions against 188 of 10.5's, and where the two versions'
functions differ, 13 match 10.6 and 2 match 10.5.

The game is compiled with `wcc386 -bt=dos -5r -oneatx`: register
calling convention, Pentium scheduling, and `-ox` with numerically
unstable floating-point optimizations, inlining of user functions,
relaxed alias checking and speed over size on top. Compiling the
reference source with `wpp386` and each set of flags, the number of its
functions found unchanged in the original:

| Flags | Functions |
| --- | ---: |
| `-3r -ox` | 37 |
| `-5r -ox` | 97 |
| `-5r -oaxt` | 211 |
| `-5r -oneatx` | 222 |

`-4r`, `-fp5`, `-oe` alone and `-zp4` match fewer; `-zp1`, `-zp2`, `-fp3`,
`-or` and `-ol+` change nothing.

## Workflow

Everything runs headless. `just` lists the recipes.

1. Analyze the original (`just analyze`). `tools/le.py` flattens the LE
   into `build/tomb.elf`, with every object at its address and the
   fixups applied, and lists the fixups in `build/tomb.elf.fixups`.
   `tools/functions.py` finds the functions: call targets, code
   pointers, and dead code after a return. Headless Ghidra imports the
   ELF with them, gives every function Watcom's register calling
   convention (`__watcall`: `eax`, `edx`, `ebx`, `ecx`, then the stack,
   callee pops, everything but `eax` preserved) and the new ones are
   added to `config/symbols.csv` as `FuncXXXXX`. Library functions are
   named from the Watcom libraries.
2. Write C for a function in `src/`. `just decompile [ADDR...]` writes
   Ghidra's pseudocode to `build/decomp/<address>.c`.
3. Record the function and every function and global it uses in
   [`config/symbols.csv`](config/symbols.csv): address, size, name and
   the Watcom symbol (`Name_` for a function, `_name` for data).
4. Compare (`just compare`): builds with `wcc386` under Wine and checks
   each function against the original byte for byte, with nothing
   masked. Each fixup must be at a place where the original has one
   and resolve to the same address: externals through `symbols.csv`,
   the module's own segments, such as its string literals, through
   where the original puts them. The literals' bytes are compared too.
   `just compare SYMBOL` shows a disassembly diff.
5. Play (`just run`): `tools/patch_exe.py` copies every compiled
   function into a new LE object of the original and puts a jump to it
   at the original's entry, with fixups for its calls and references,
   so the game runs the new code whether it matches yet or not.
   `tools/play.py` runs it in dosbox-staging, headless under Xvfb, with
   the CD image mounted. Steps drive it and take screenshots, e.g.
   `just run wait:20 key:Return wait:2 shot:menu` writes
   `build/shots/menu.png`. `just run-orig` runs the unmodified original.

`tools/le.py roundtrip` checks the LE writer: rewriting the original
without changes gives the same file.
