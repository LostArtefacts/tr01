#!/bin/sh
# Imports the flattened executable (build/tomb.elf, from `just analyze`)
# into a headless Ghidra project, with the functions of
# build/functions.csv and Watcom's register calling convention, and
# exports its function list.
set -e
cd "$(dirname "$0")/../.."
. tools/ghidra/env.sh
mkdir -p build/ghidra
"$GHIDRA/support/analyzeHeadless" build/ghidra tomb \
	-import build/tomb.elf -overwrite \
	-processor x86:LE:32:default -cspec gcc \
	-scriptPath tools/ghidra \
	-preScript Watcom.java \
	-postScript Watcom.java "$PWD/build/functions.csv" \
	-postScript ExportFunctions.java "$PWD/build/functions_ghidra.csv" \
	> build/ghidra/analyze.log 2>&1
grep REPORT build/ghidra/analyze.log
