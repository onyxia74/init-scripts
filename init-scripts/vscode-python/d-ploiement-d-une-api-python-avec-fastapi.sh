#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déploiement d'une API Python avec FastAPI
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_75247990d0cf'
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def read_root():
    return {'Hello': 'Onyxia API'}

@app.get('/items/{item_id}')
def read_item(item_id: int, q: str = None):
    return {'item_id': item_id, 'q': q}
ONYXIA_FILE_75247990d0cf
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_e0e87cbc52f0'
fastapi
uvicorn
requests
ONYXIA_FILE_e0e87cbc52f0

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install fastapi uvicorn requests
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_cc6b365d3e0e'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
uvicorn app:app --host 0.0.0.0 --port 8080
ONYXIA_FILE_cc6b365d3e0e
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

