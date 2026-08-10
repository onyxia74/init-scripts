#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: déploiement application Streamlit
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_6edcc0756add'
import streamlit as st
import pandas as pd
import numpy as np

st.title('Mon Application Streamlit sur Onyxia')
st.write('Bienvenue dans votre environnement de développement !')

data = pd.DataFrame(np.random.randn(10, 2), columns=['x', 'y'])
st.line_chart(data)
ONYXIA_FILE_6edcc0756add
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_bc46648b54c5'
streamlit
pandas
numpy
ONYXIA_FILE_bc46648b54c5
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_8fb95a2186e1'
# Projet Streamlit

Ce projet a été initialisé automatiquement pour faciliter le développement d'une application Streamlit sur Onyxia.

## Lancement
Pour lancer l'application, utilisez la commande suivante dans le terminal :
```bash
streamlit run app.py
```
ONYXIA_FILE_8fb95a2186e1

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install streamlit pandas numpy


mkdir -p src data
