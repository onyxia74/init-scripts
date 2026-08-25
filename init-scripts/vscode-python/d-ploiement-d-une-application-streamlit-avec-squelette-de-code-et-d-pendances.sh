#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déploiement d'une application Streamlit avec squelette de code et dépendances
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_d82c6429474b'
import streamlit as st
import pandas as pd
import numpy as np

st.title('Ma première application Streamlit sur Onyxia')
st.write('Bienvenue dans votre environnement de développement !')

# Exemple de graphique
chart_data = pd.DataFrame(np.random.randn(20, 3), columns=['a', 'b', 'c'])
st.line_chart(chart_data)
ONYXIA_FILE_d82c6429474b
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_bc46648b54c5'
streamlit
pandas
numpy
ONYXIA_FILE_bc46648b54c5
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_3e4e95a81864'
# Mon Projet Streamlit

Ce projet a été initialisé automatiquement.

## Lancement
Pour lancer l'application, utilisez la commande suivante dans le terminal :
```bash
streamlit run app.py --server.address=0.0.0.0
```
ONYXIA_FILE_3e4e95a81864

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas streamlit
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_246563a83312'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port="${PORT:-8501}"
ONYXIA_FILE_246563a83312
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

