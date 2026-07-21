#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Préparation d'un environnement de développement pour le build et le déploiement d'images Docker via Git
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_79194d0a5182'
docker
requests
python-dotenv
pytest
ONYXIA_FILE_79194d0a5182

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install docker


mkdir -p src data tests
touch src/main.py requirements.txt README.md
echo 'Dockerizing project...' > src/deploy.py
