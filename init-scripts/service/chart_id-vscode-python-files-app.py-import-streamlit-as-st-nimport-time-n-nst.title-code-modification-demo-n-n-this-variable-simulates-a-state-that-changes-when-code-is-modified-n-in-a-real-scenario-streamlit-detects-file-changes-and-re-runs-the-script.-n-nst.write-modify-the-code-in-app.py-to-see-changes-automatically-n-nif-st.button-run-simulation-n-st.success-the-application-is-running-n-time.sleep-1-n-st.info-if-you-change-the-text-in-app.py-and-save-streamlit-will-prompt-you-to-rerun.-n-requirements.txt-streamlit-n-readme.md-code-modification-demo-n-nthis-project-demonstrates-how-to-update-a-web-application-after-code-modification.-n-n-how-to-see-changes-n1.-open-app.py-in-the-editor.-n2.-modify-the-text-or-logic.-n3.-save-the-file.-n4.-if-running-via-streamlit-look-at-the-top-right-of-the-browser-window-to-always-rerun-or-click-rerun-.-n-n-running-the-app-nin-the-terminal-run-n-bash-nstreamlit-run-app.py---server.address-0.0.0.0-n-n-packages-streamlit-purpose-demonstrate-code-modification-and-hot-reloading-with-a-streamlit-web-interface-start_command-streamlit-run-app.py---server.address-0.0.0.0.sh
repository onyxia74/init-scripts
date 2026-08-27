#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"import streamlit as st\nimport time\n\nst.title('Code Modification Demo')\n\n# This variable simulates a state that changes when code is modified\n# In a real scenario, Streamlit detects file changes and re-runs the script.\n\nst.write('Modify the code in `app.py` to see changes automatically!')\n\nif st.button('Run Simulation'):\n    st.success('The application is running!')\n    time.sleep(1)\n    st.info('If you change the text in app.py and save, Streamlit will prompt you to rerun.')\n","requirements.txt":"streamlit\n","README.md":"# Code Modification Demo\n\nThis project demonstrates how to update a web application after code modification.\n\n## How to see changes:\n1. Open `app.py` in the editor.\n2. Modify the text or logic.\n3. Save the file.\n4. If running via Streamlit, look at the top right of the browser window to 'Always rerun' or click 'Rerun'.\n\n## Running the app:\nIn the terminal, run:\n```bash\nstreamlit run app.py --server.address=0.0.0.0\n```\n"},packages:["streamlit"],purpose:"demonstrate code modification and hot-reloading with a Streamlit web interface",start_command:"streamlit run app.py --server.address=0.0.0.0"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
