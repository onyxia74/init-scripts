#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: demonstrate code modification and auto-reload with a Streamlit app
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_2e47bfbb5cd9'
import streamlit as st
import time

st.title('Code Modification Demo')

# This variable simulates a state that changes
if 'counter' not in st.session_state:
    st.session_state.counter = 0

st.write(f'Current count: {st.session_state.counter}')

if st.button('Increment'):
    st.session_state.counter += 1
    st.rerun()

st.info('To see changes after modifying app.py, simply save the file. Streamlit will detect the change and reload automatically!')
ONYXIA_FILE_2e47bfbb5cd9
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_b2213137fde0'
streamlit
ONYXIA_FILE_b2213137fde0
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_1b2b4fc0d007'
# Streamlit Demo

This application is designed to demonstrate how code modifications are applied.

## How to update:
1. Open `app.py` in the VS Code editor.
2. Modify the text or logic.
3. Save the file (`Ctrl+S` or `Cmd+S`).
4. Streamlit will automatically detect the change and refresh the web interface.

## Running the app:
If it's not running, open a terminal and type:
`streamlit run app.py --server.address=0.0.0.0`
ONYXIA_FILE_1b2b4fc0d007

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install streamlit
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_8e99b36e0bb1'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0
ONYXIA_FILE_8e99b36e0bb1
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

