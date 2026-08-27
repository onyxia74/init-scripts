#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: Enable Format on Save in VS Code
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/.vscode"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/.vscode/settings.json")"
cat > "${WORK_DIR}/.vscode/settings.json" <<'ONYXIA_FILE_0325085badab'
{
  "editor.formatOnSave": true
}
ONYXIA_FILE_0325085badab

