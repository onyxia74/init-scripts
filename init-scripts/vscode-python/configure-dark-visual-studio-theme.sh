#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Configure Dark Visual Studio theme
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/.vscode"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/.vscode/settings.json")"
cat > "${WORK_DIR}/.vscode/settings.json" <<'ONYXIA_FILE_3e34c2644554'
{
  "workbench.colorTheme": "Visual Studio Dark"
}
ONYXIA_FILE_3e34c2644554

