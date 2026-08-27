#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"hello_world.py":"print('Hello Onyxia!')\nimport sys\nprint(f'Python version: {sys.version}')"},"purpose":"Initialisation d'un environnement VS Code avec un script de test et une configuration de formatage automatique."},{packages:["pandas","numpy","matplotlib"],"purpose":"Installation de bibliothèques de base pour la data science"},{files:{".vscode/settings.json":"{\"editor.formatOnSave\": true}"},"purpose":"Configuration de VS Code pour formater le code à la sauvegarde"}
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

