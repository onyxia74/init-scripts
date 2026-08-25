#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\n\nst.title('Mon Interface Web Onyxia')\nst.write('Cette application est prête à être déployée.')\n\nname = st.text_input('Quel est votre nom ?')\nif name:\n    st.write(f'Bonjour {name} !')"},"packages":["streamlit"],"purpose":"préparer un environnement Streamlit accessible avec un fichier d'exemple et une commande de lancement","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
