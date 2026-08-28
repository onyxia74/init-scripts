#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: data visualization application skeleton
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_cdf873691ec2'
import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px

st.set_page_config(page_title='Data Visualization App', layout='wide')

st.title('📊 Data Visualization Dashboard')
st.markdown('Welcome to your Onyxia-powered data visualization application!')

# Create dummy data
data = pd.DataFrame({
    'x': np.random.randn(100),
    'y': np.random.randn(100),
    'category': np.random.choice(['A', 'B', 'C'], 100)
})

st.sidebar.header('Settings')
show_scatter = st.sidebar.checkbox('Show Scatter Plot', value=True)

col1, col2 = st.columns(2)

with col1:
    st.subheader('Distribution')
    fig1 = px.histogram(data, x='x', color='category')
    st.plotly_chart(fig1, use_container_width=True)

with col2:
    if show_scatter:
        st.subheader('Relationship')
        fig2 = px.scatter(data, x='x', y='y', color='category')
        st.plotly_chart(fig2, use_container_width=True)
    else:
        st.info('Scatter plot disabled in sidebar.')

st.divider()
st.write('Data Preview:', data.head())
ONYXIA_FILE_cdf873691ec2
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_5344d55d37d3'
streamlit
pandas
numpy
plotly
matplotlib
seaborn
ONYXIA_FILE_5344d55d37d3
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_55ca4ff42000'
# Data Visualization App

This application was automatically prepared for your Onyxia environment.

## How to run
1. Open the terminal in VS Code.
2. Run the following command:
   ```bash
   streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}
   ```
3. Access the application via the provided URL.
ONYXIA_FILE_55ca4ff42000

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas plotly streamlit matplotlib seaborn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_9c4aad69aeff'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}
ONYXIA_FILE_9c4aad69aeff
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Add a VSCode task for the prepared project.
mkdir -p "${WORK_DIR}/.vscode"
cat > "${WORK_DIR}/.vscode/tasks.json" <<'ONYXIA_FILE_0a74afde5062'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run prepared project",
      "type": "shell",
      "command": "${workspaceFolder}/onyxia/run.sh",
      "problemMatcher": [],
      "group": "build"
    }
  ]
}
ONYXIA_FILE_0a74afde5062

