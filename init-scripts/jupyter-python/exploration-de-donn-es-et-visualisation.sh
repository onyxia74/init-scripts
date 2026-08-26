#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Exploration de données et visualisation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration_notebook.ipynb")"
cat > "${WORK_DIR}/exploration_notebook.ipynb" <<'ONYXIA_FILE_7f143e28e91d'
{"cells": [{"cell_type": "markdown", "metadata": {}, "source": [\"# Exploration de données\\n\"]}, {"cell_type": "code", "execution_count": null, "metadata": {}, "outputs": [], "source": [\"import pandas as pd\\nimport numpy as np\\nimport matplotlib.pyplot as plt\\nimport seaborn as sns\\n\\n# Exemple de chargement de données\\n# df = pd.read_csv('data.csv')\\n# df.head()\\n\"]}], "metadata": {\"kernelspec": {\"display_name": \"Python 3\", \"language": \"python\", \"name": \"python3\"}, \"language_info": {\"name": \"python\", \"version": \"3.10.0\"}}, \"nbformat\": 4, \"nbformat_minor\": 4}
ONYXIA_FILE_7f143e28e91d

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas numpy matplotlib seaborn scikit-learn


pip install pandas numpy matplotlib seaborn scikit-learn
