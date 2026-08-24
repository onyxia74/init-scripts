#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: fournir un notebook d'exemple pour l'exploration de données
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration_data.ipynb")"
cat > "${WORK_DIR}/exploration_data.ipynb" <<'ONYXIA_FILE_bb53b4fe1b99'
{
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "# Exploration de données\n\nCe notebook est prêt pour l'analyse."
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "import pandas as pd\n",
        "import numpy as np\n",
        "import matplotlib.pyplot as plt\n",
        "import seaborn as sns\n\n",
        "# Création d'un dataset d'exemple\n",
        "df = pd.DataFrame({\n    'A': np.random.randn(100),\n",
        "    'B': np.random.rand(100)\n",
        "})\n",
        "print(df.head())"
      ]
    }
  ],
  "metadata": {
    "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
    }
  },\n  "nbformat": 4,\n  "nbformat_minor": 4\n}
ONYXIA_FILE_bb53b4fe1b99

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas matplotlib seaborn numpy

