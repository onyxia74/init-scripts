#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: datavisualisation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/viz_demo.py")"
cat > "${WORK_DIR}/viz_demo.py" <<'ONYXIA_FILE_8f08a4b4f839'
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Exemple de visualisation simple
data = pd.DataFrame({'x': [1, 2, 3, 4, 5], 'y': [10, 20, 15, 25, 30]})
plt.figure(figsize=(10, 5))
sns.lineplot(data=data, x='x', y='y')
plt.title('Exemple de Datavisualisation')
plt.savefig('plot.png')
print('Graphique sauvegardé sous plot.png')
ONYXIA_FILE_8f08a4b4f839

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install matplotlib pandas seaborn plotly

