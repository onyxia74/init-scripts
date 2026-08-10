#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\nimport pandas as pd\nimport numpy as np\nimport plotly.express as px\n\nst.title('Ma Dashboard de Datavisualisation')\n\n# Génération de données factices\ndf = pd.DataFrame({\n    'x': np.random.randn(100),\n    'y': np.random.randn(100),\n    'category': np.random.choice(['A', 'B', 'C'], 100)\n})\n\nst.write('Voici un exemple de visualisation avec Plotly :')\nfig = px.scatter(df, x='x', y='y', color='category', title='Nuage de points aléatoire')\nst.plotly_chart(fig)\n\nst.write('Aperçu des données :')\nst.dataframe(df.head())"},"packages":["streamlit","pandas","numpy","plotly"],"purpose":"Déployer une application de datavisualisation avec Streamlit pour permettre à l'utilisateur de visualiser des données via une interface web interactive.","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
