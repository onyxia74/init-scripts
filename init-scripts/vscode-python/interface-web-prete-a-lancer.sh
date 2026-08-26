#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: interface web prete a lancer
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_7b676a6ce6b3'
import streamlit as st

st.title('Mon Application Web')
st.write('Ceci est une interface web deployee via Onyxia.')

import pandas as pd

# Exemple de donnees
st.subheader('Donnees de demonstration')
df = pd.DataFrame({
    'Nom': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'Ville': ['Paris', 'Lyon', 'Marseille']
})
st.dataframe(df)

st.success('Application demarree avec succes !')
ONYXIA_FILE_7b676a6ce6b3

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas streamlit

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_9c4aad69aeff'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}
ONYXIA_FILE_9c4aad69aeff
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

# Start the prepared project in the background.
mkdir -p "${WORK_DIR}/.onyxia"
nohup bash "${WORK_DIR}/onyxia/run.sh" > "${WORK_DIR}/.onyxia/run.log" 2>&1 &

