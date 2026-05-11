#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: exercice addition
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/addition.py")"
cat > "${WORK_DIR}/addition.py" <<'ONYXIA_FILE_b4a2df3992d7'
def addition(a, b):
    return a + b
ONYXIA_FILE_b4a2df3992d7

