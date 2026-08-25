#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",purpose: "interface web pour interagir avec postgresql et neo4j",start_command: "streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}",files:{"app.py":"import streamlit as st\nimport psycopg2\nimport neo4j\n\nst.title('Data Explorer Dashboard')\n\nst.write('Connectez-vous à vos bases de données PostgreSQL et Neo4j.')\n\n# Placeholder pour la logique de connexion\nif st.button('Tester les connexions'):\n    st.success('Connectivité prête (simulée)')\n","requirements.txt":"streamlit\npsycopg2-binary\nneo4j\n"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
