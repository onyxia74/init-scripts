#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: set dark theme
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/settings.json")"
cat > "${WORK_DIR}/settings.json" <<'ONYXIA_FILE_03cb4ea3fdbf'
{"workbench.colorTheme": "Visual Studio Dark"}
ONYXIA_FILE_03cb4ea3fdbf

