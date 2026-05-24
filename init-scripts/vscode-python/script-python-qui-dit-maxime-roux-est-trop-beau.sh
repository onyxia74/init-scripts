#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: script python qui dit Maxime Roux est trop beau
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/script.py")"
cat > "${WORK_DIR}/script.py" <<'ONYXIA_FILE_c70c476ba02e'
print('Maxime Roux est trop beau')
ONYXIA_FILE_c70c476ba02e

