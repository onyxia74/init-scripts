#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: activer le formatage automatique à l'enregistrement
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p ~/.vscode/extensions && echo '{"editor.formatOnSave": true}' > ~/.vscode/settings.json
