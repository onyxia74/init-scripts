#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\nimport pandas as pd\nimport numpy as np\n\nst.title('Mon Interface Web Onyxia')\nst.write('Ceci est une application Streamlit prête à l'emploi !')\n\ndata = pd.DataFrame(np.random.randn(10, 2), columns=['x', 'y'])\nst.line_chart(data)\n","requirements.txt":"streamlit\npandas\nnumpy\n"},"purpose":"préparer un environnement de développement pour une interface web Streamlit accessible de l'extérieur","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
