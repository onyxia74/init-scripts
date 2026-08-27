#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déploiement d'une application de datavisualisation interactive avec Streamlit
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_1bdba07a7bc1'
import streamlit as st
import pandas as pd
import plotly.express as px
import numpy as np

st.set_page_config(page_title='Ma DataViz App', layout='wide')

st.title('🚀 Ma première application de Datavisualisation')
st.write('Bienvenue sur votre environnement Onyxia prêt à l'emploi !')

# Génération de données factices
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['A', 'B', 'C']
)

st.subheader('Graphique interactif avec Plotly')
fig = px.line(chart_data, y=['A', 'B', 'C'], title='Évolution des données')
st.plotly_chart(fig, use_container_width=True)

st.subheader('Données brutes')
st.dataframe(chart_data)
ONYXIA_FILE_1bdba07a7bc1
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_88d27fb5a6cf'
streamlit
pandas
plotly
matplotlib
ONYXIA_FILE_88d27fb5a6cf
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_4484a9328cc5'
# Mon Application de Datavisualisation

Pour lancer l'application, utilisez la commande suivante dans le terminal :
`streamlit run app.py --server.address=0.0.0.0`

L'application est déjà configurée pour démarrer automatiquement.
ONYXIA_FILE_4484a9328cc5

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas plotly streamlit matplotlib
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

