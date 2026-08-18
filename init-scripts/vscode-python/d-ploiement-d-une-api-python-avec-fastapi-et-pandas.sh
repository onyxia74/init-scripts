#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déploiement d'une API Python avec FastAPI et pandas
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_e9721ad99873'
from fastapi import FastAPI
import pandas as pd

app = FastAPI()

@app.get('/')
def read_root():
    return {'message': 'API Python opérationnelle sur Onyxia'}

@app.get('/data')
def get_data():
    return {'status': 'success', 'data': [1, 2, 3, 4, 5]}
ONYXIA_FILE_e9721ad99873

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install fastapi pandas uvicorn

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_10834a585f51'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
uvicorn main:app --host 0.0.0.0 --port 8080
ONYXIA_FILE_10834a585f51
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

