#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: demonstration de gestion de secrets via fichier .env et variables d'environnement
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_d2dede7d047c'
import os
from dotenv import load_dotenv

# Charger les variables du fichier .env
load_dotenv()

api_key = os.getenv('MY_SECRET_API_KEY', 'non configuré')
db_password = os.getenv('DB_PASSWORD', 'non configuré')

print(f'--- Test de lecture de secrets ---')
print(f'API Key récupérée : {api_key}')
print(f'DB Password récupéré : {db_password}')
print(f'----------------------------------')

if api_key == 'non configuré':
    print('⚠️ Attention : La clé API n'a pas été trouvée.')
else:
    print('✅ Succès : La clé API est bien chargée.')
ONYXIA_FILE_d2dede7d047c
mkdir -p "$(dirname "${WORK_DIR}/.env")"
cat > "${WORK_DIR}/.env" <<'ONYXIA_FILE_185547aed24c'
# Simulation de secrets
MY_SECRET_API_KEY=sk-onyxia-demo-12345
DB_PASSWORD=super-secret-password
ONYXIA_FILE_185547aed24c
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_d7f74b6fdf4c'
# Démo Secrets Onyxia

Ce projet montre comment utiliser un fichier `.env` pour gérer vos secrets.

## Étapes
1. Vérifiez que le fichier `.env` contient vos clés.
2. Lancez le script avec `python app.py`.
ONYXIA_FILE_d7f74b6fdf4c

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install python-dotenv

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_f336b03ad610'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python app.py
ONYXIA_FILE_f336b03ad610
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Add a VSCode task for the prepared project.
mkdir -p "${WORK_DIR}/.vscode"
cat > "${WORK_DIR}/.vscode/tasks.json" <<'ONYXIA_FILE_0a74afde5062'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run prepared project",
      "type": "shell",
      "command": "${workspaceFolder}/onyxia/run.sh",
      "problemMatcher": [],
      "group": "build"
    }
  ]
}
ONYXIA_FILE_0a74afde5062

