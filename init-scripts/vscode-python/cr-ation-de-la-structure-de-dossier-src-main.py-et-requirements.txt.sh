#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: création de la structure de dossier src, main.py et requirements.txt
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/init.sh")"
cat > "${WORK_DIR}/src/init.sh" <<'ONYXIA_FILE_0cba91da434f'
mkdir -p src
ONYXIA_FILE_0cba91da434f
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_92664a4f28d7'
print('Hello from main.py!')
ONYXIA_FILE_92664a4f28d7
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_52ab719f4454'
pandas
duckdb
ONYXIA_FILE_52ab719f4454

