#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: ajouter une fonction addition en python
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/definition.py")"
cat > "${WORK_DIR}/definition.py" <<'ONYXIA_FILE_cd565a623781'
def addition(a, b):
    return a + b
ONYXIA_FILE_cd565a623781

