#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{app.py:"import streamlit as st\nimport pandas as pd\nimport numpy as np\nimport plotly.express as px\n\nst.set_page_config(page_title='Ma Dataviz', layout='wide')\n\nst.title('📊 Dashboard de Datavisualisation')\nst.write('Ceci est un squelette d\'application Streamlit prêt à l\'emploi.')\n\n# Simulation de données\ndata = pd.DataFrame({\n    'x': np.random.randn(100),\n    'y': np.random.randn(100),\n    'category': np.random.choice(['A', 'B', 'C'], 100)\n})\n\ncol1, col2 = st.columns(2)\n\nwith col1:\n    st.subheader('Nuage de points')\n    fig1 = px.scatter(data, x='x', y='y', color='category')\n    st.plotly_chart(fig1, use_container_width=True)\n\nwith col2:\n    st.subheader('Distribution')\n    fig2 = px.histogram(data, x='x', color='category')\n    st.plotly_chart(fig2, use_container_width=True)\n", "requirements.txt":"streamlit\npandas\nnumpy\nplotly\n"},"packages":["streamlit","pandas","plotly"],"purpose":"déploiement d'une application de datavisualisation avec Streamlit","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
