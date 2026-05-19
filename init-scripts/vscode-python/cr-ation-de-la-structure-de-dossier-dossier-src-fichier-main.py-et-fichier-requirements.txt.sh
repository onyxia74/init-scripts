#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Création de la structure de dossier : dossier src, fichier main.py et fichier requirements.txt
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/init.sh")"
cat > "${WORK_DIR}/src/init.sh" <<'ONYXIA_FILE_009e4aafcdfa'
directory
ONYXIA_FILE_009e4aafcdfa
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_032e862ba11c'
# Fichier principal
print('Hello Onyxia!')
ONYXIA_FILE_032e862ba11c
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_6c02ebc3cda4'
# Liste des dépendances
ONYXIA_FILE_6c02ebc3cda4

