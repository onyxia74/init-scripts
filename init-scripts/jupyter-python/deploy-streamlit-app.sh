#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Deploy Streamlit app
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_e4fd55dd72a6'
import streamlit as st

st.title('Hello Streamlit')
st.write('Ceci est une application de d\'e\'monstration d\'eploy\'ee sur Onyxia.')

if st.button('Cliquez-moi'):
    st.success('Le bouton a \'et\'e cliqu\'e !')
ONYXIA_FILE_e4fd55dd72a6

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install streamlit

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_9c4aad69aeff'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}
ONYXIA_FILE_9c4aad69aeff
chmod +x "${WORK_DIR}/onyxia/run.sh"

