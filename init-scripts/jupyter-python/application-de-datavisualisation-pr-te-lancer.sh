#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: application de datavisualisation prête à lancer
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_6d903493edfc'
import streamlit as st
import pandas as pd
import numpy as np

st.title('Application de Datavisualisation')

# Exemple de données
data = pd.DataFrame({'x': np.random.randn(100), 'y': np.random.randn(100)})

st.write('### Données aléatoires')
st.dataframe(data)

st.write('### Graphique de dispersion')
st.scatter_chart(data, x='x', y='y')

st.write('### Histogramme')
st.bar_chart(data['x'])
ONYXIA_FILE_6d903493edfc
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_b8ae06875850'
# Application de Datavisualisation

Cet environnement Jupyter Python est préparé pour la visualisation de données.

## Fonctionnalités
- Bibliothèques installées : pandas, matplotlib, seaborn, plotly, streamlit
- Exemple d'application web avec Streamlit

## Lancement
1. Ouvrir JupyterLab
2. Exécuter `streamlit run app.py` dans un terminal
3. Accéder à l'application via l'URL générée

## Utilisation
- Modifier `app.py` pour personnaliser la visualisation
- Charger vos propres données dans le dossier `data/`
- Utiliser Jupyter pour explorer les données

## Documentation
- [Streamlit Documentation](https://docs.streamlit.io/)
ONYXIA_FILE_b8ae06875850

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas streamlit matplotlib seaborn plotly

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_9c4aad69aeff'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}
ONYXIA_FILE_9c4aad69aeff
chmod +x "${WORK_DIR}/onyxia/run.sh"

