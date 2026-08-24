#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déploiement d'une application de datavisualisation avec Streamlit
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_f15dca3ef1a1'
import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px

st.set_page_config(page_title='Data Viz Demo', layout='wide')

st.title('📊 Dashboard de Datavisualisation')
st.write('Ceci est un squelette d'application prêt à l'emploi.')

# Génération de données factices
df = pd.DataFrame({
    'x': np.random.randn(100),
    'y': np.random.randn(100),
    'category': np.random.choice(['A', 'B', 'C'], 100)
})

col1, col2 = st.columns(2)

with col1:
    st.subheader('Nuage de points')
    fig1 = px.scatter(df, x='x', y='y', color='category')
    st.plotly_chart(fig1, use_container_width=True)

with col2:
    st.subheader('Distribution')
    fig2 = px.histogram(df, x='x', color='category')
    st.plotly_chart(fig2, use_container_width=True)

st.success('Application chargée avec succès ! Utilisez le terminal pour lancer : streamlit run app.py --server.address=0.0.0.0')
ONYXIA_FILE_f15dca3ef1a1

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas plotly streamlit

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

