#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\nimport pandas as pd\nimport numpy as np\n\nst.title('Mon Interface Web Onyxia')\nst.write('Bienvenue sur votre application Streamlit !')\n\ndata = pd.DataFrame(np.random.randn(10, 2), columns=['x', 'y'])\nst.line_chart(data)"},packages:["streamlit","pandas","numpy"],purpose:"préparer un environnement Streamlit prêt à l'emploi avec un fichier app.py et une commande de lancement",start_command:"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
