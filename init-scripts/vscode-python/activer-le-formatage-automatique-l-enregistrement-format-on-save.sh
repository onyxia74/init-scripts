#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Activer le formatage automatique à l'enregistrement (Format on Save)
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/home/onyxia/work"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/home/onyxia/work/vscode-settings.json")"
cat > "${WORK_DIR}/home/onyxia/work/vscode-settings.json" <<'ONYXIA_FILE_3e44185ababf'
{
  "editor.formatOnSave": true
}
ONYXIA_FILE_3e44185ababf


code --user-data-dir /home/onyxia/work/.vscode-server --settings /home/onyxia/work/.vscode-settings.json
