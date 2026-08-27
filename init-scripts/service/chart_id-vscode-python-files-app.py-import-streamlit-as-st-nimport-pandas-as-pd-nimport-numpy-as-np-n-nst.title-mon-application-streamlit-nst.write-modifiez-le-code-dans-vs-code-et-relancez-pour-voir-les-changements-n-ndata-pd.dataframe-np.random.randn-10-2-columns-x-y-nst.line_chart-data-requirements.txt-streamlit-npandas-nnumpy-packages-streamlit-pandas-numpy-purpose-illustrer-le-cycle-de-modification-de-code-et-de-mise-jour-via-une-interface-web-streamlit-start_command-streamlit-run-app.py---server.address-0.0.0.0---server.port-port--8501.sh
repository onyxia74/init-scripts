#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\nimport pandas as pd\nimport numpy as np\n\nst.title('Mon Application Streamlit')\nst.write('Modifiez le code dans VS Code et relancez pour voir les changements !')\n\ndata = pd.DataFrame(np.random.randn(10, 2), columns=['x', 'y'])\nst.line_chart(data)", "requirements.txt":"streamlit\npandas\nnumpy"},"packages":["streamlit","pandas","numpy"],"purpose":"illustrer le cycle de modification de code et de mise à jour via une interface web streamlit","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
