#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: API Python avec FastAPI prête à lancer
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_706fc15a5cde'
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def read_root():
    return {'Hello': 'World'}
ONYXIA_FILE_706fc15a5cde

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install fastapi uvicorn

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_6077b4d93c7e'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
uvicorn app:app --host 0.0.0.0 --port ${PORT:-8000}
ONYXIA_FILE_6077b4d93c7e
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

