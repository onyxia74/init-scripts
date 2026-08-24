#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déployer une application de datavisualisation avec Streamlit et Plotly
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_12f9cbda688e'
import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px

st.set_page_config(page_title='Data Viz Demo', layout='wide')

st.title('📊 Dashboard de Datavisualisation')
st.write('Ceci est un squelette d'application prêt à l'emploi.')

# Génération de données factices
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['A', 'B', 'C']
)

col1, col2 = st.columns(2)

with col1:
    st.subheader('Graphique Linéaire')
    fig1 = px.line(chart_data, y=['A', 'B'])
    st.plotly_chart(fig1, use_container_width=True)

with col2:
    st.subheader('Graphique à Barres')
    fig2 = px.bar(chart_data, y='A')
    st.plotly_chart(fig2, use_container_width=True)

st.divider()
st.write('Modifiez `app.py` pour personnaliser votre dashboard.')
ONYXIA_FILE_12f9cbda688e
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_9d8d2255b9db'
streamlit
pandas
numpy
plotly
ONYXIA_FILE_9d8d2255b9db
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_78eb1a3a64a6'
# Mon Application de Datavisualisation

Ce projet est un squelette Streamlit pour la visualisation de données.

## Lancement
Pour lancer l'application, utilisez la commande suivante dans le terminal :
```bash
streamlit run app.py --server.address=0.0.0.0
```
ONYXIA_FILE_78eb1a3a64a6

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas plotly streamlit
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

