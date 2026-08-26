#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","purpose":"application web avec rechargement automatique","files":{"app.py":"import streamlit as st\n\nst.title('Application de démonstration')\n\nif st.button('Actualiser'):\n    st.write('L\'application a été actualisée.')\n\nst.write('Modifie le code et observe le rechargement automatique.')"},"packages":["streamlit"],"start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}","auto_start":true}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
