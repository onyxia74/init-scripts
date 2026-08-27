#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: Configure VSCode theme to Dark Visual Studio
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/.vscode"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/.vscode/settings.json")"
cat > "${WORK_DIR}/.vscode/settings.json" <<'ONYXIA_FILE_9b790b9af477'
{"workbench.colorTheme": "Dark Visual Studio"}
ONYXIA_FILE_9b790b9af477

