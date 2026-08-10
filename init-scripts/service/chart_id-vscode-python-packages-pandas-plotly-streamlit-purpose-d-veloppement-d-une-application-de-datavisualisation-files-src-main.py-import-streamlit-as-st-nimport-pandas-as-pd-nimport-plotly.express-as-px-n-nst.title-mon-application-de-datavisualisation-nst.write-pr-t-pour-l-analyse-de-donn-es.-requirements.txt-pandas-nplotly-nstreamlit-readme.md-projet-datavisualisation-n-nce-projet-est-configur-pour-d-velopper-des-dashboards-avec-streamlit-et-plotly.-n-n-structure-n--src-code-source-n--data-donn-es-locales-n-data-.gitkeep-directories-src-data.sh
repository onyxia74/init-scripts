#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["pandas","plotly","streamlit"],"purpose":"développement d'une application de datavisualisation","files":{"src/main.py":"import streamlit as st\nimport pandas as pd\nimport plotly.express as px\n\nst.title('Mon Application de Datavisualisation')\nst.write('Prêt pour l\'analyse de données.')","requirements.txt":"pandas\nplotly\nstreamlit","README.md":"# Projet Datavisualisation\n\nCe projet est configuré pour développer des dashboards avec Streamlit et Plotly.\n\n## Structure\n- `src/`: Code source\n- `data/`: Données locales\n","data/.gitkeep":""},"directories":["src","data"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
