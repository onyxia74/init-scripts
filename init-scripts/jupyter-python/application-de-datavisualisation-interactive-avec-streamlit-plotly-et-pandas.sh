#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Application de datavisualisation interactive avec Streamlit, Plotly et Pandas
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_430cbbe886c1'
import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px

st.title('Application de Datavisualisation')
st.write('Ceci est une application de démonstration avec Streamlit, Plotly et Pandas.')

# Génération de données aléatoires
df = pd.DataFrame(
    np.random.randn(200, 3),
    columns=['a', 'b', 'c']
)

# Visualisation avec Plotly
fig = px.scatter(df, x='a', y='b', size='c', color='c', title='Nuage de points interactif')
st.plotly_chart(fig)

# Visualisation avec Matplotlib
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
ax.plot(df['a'], label='Line A')
ax.set_title('Graphique linéaire avec Matplotlib')
st.pyplot(fig)
ONYXIA_FILE_430cbbe886c1
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_5344d55d37d3'
streamlit
pandas
numpy
plotly
matplotlib
seaborn
ONYXIA_FILE_5344d55d37d3

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib numpy pandas plotly streamlit seaborn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_9c4aad69aeff'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}
ONYXIA_FILE_9c4aad69aeff
chmod +x "${WORK_DIR}/onyxia/run.sh"

