#!/bin/sh
# Decompiles functions from the Ghidra project made by analyze.sh into
# build/decomp/<address>.c. With no arguments, every function.
set -e
cd "$(dirname "$0")/../.."
. tools/ghidra/env.sh
"$GHIDRA/support/analyzeHeadless" build/ghidra tomb \
	-process tomb.elf -noanalysis -readOnly \
	-scriptPath tools/ghidra \
	-postScript Decompile.java "$PWD/build/decomp" "$@" \
	> build/ghidra/decompile.log 2>&1
grep REPORT build/ghidra/decompile.log
