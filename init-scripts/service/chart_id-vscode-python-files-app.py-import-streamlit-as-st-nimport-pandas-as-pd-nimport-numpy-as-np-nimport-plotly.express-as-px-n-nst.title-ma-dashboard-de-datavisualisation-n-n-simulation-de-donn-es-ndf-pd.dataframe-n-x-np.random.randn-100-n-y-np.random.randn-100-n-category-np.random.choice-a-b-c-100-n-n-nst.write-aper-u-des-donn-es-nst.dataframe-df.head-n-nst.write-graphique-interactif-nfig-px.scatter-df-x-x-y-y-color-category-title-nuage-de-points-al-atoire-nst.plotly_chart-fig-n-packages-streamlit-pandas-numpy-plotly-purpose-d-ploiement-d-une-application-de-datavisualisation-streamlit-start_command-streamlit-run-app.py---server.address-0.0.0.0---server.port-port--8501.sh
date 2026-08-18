#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\nimport pandas as pd\nimport numpy as np\nimport plotly.express as px\n\nst.title('Ma Dashboard de Datavisualisation')\n\n# Simulation de données\ndf = pd.DataFrame({\n    'x': np.random.randn(100),\n    'y': np.random.randn(100),\n    'category': np.random.choice(['A', 'B', 'C'], 100)\n})\n\nst.write('### Aperçu des données')\nst.dataframe(df.head())\n\nst.write('### Graphique interactif')\nfig = px.scatter(df, x='x', y='y', color='category', title='Nuage de points aléatoire')\nst.plotly_chart(fig)\n"},"packages":["streamlit","pandas","numpy","plotly"],"purpose":"déploiement d'une application de datavisualisation Streamlit","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
