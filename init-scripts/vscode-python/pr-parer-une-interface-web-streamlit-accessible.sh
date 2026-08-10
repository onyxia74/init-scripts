#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparer une interface web Streamlit accessible
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_640cc03e11e1'
import streamlit as st
import pandas as pd
import numpy as np

st.title('Interface Web Onyxia')
st.write('Ceci est une application Streamlit prête à l'emploi.')

data = pd.DataFrame(np.random.randn(10, 2), columns=['x', 'y'])
st.line_chart(data)
ONYXIA_FILE_640cc03e11e1

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas streamlit
if [ -f requirements.txt ]; then
  "${PYTHON_BIN}" -m pip install -r requirements.txt
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_4013fd019fda'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port=5000
ONYXIA_FILE_4013fd019fda
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

