#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: création de structure de projet avec dossier src, main.py et requirements.txt
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_17d83818dfc4'
print('Hello from VSCode Onyxia!')
ONYXIA_FILE_17d83818dfc4
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_39402881f776'
pandas
ONYXIA_FILE_39402881f776

