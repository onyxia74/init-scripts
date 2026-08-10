#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: fournir un notebook d'exemple pour l'exploration de données
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration_data.ipynb")"
cat > "${WORK_DIR}/exploration_data.ipynb" <<'ONYXIA_FILE_4f2567b68ef5'
# Notebook d'exploration de données\nimport pandas as pd\nimport numpy as np\nimport matplotlib.pyplot as plt\nimport seaborn as sns\n\n# Exemple de création de données\ndf = pd.DataFrame({'A': np.random.randn(100), 'B': np.random.randn(100)})\nprint(df.head())\nplt.plot(df['A'])\nplt.show()
ONYXIA_FILE_4f2567b68ef5

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas numpy matplotlib seaborn scipy

