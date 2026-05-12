#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: création de structure de projet avec dossier src, main.py et requirements.txt
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src")"
cat > "${WORK_DIR}/src" <<'ONYXIA_FILE_da64d768c88e'
{}
ONYXIA_FILE_da64d768c88e
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_376981640adb'
print('Hello Onyxia!')
ONYXIA_FILE_376981640adb
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_52ab719f4454'
pandas
duckdb
ONYXIA_FILE_52ab719f4454

