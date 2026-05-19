#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: création de structure de dossier avec src, main.py et requirements.txt
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/init.sh")"
cat > "${WORK_DIR}/src/init.sh" <<'ONYXIA_FILE_f8f4ab48efe7'

ONYXIA_FILE_f8f4ab48efe7
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_032e862ba11c'
# Fichier principal
print('Hello Onyxia!')
ONYXIA_FILE_032e862ba11c
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_6afea9e87292'
# Dépendances du projet
ONYXIA_FILE_6afea9e87292

