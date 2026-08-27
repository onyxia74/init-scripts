#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: fournir un notebook d'exploration de données prêt à l'emploi avec un dataset d'exemple
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration_notebook.ipynb")"
cat > "${WORK_DIR}/exploration_notebook.ipynb" <<'ONYXIA_FILE_6920673dd606'
{
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        "# Exploration de données\n\nCe notebook est prêt pour votre analyse."
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {},
      "outputs": [],
      "source": [
        "import pandas as pd\nimport numpy as np\nimport matplotlib.pyplot as plt\nimport seaborn as sns\n\n# Création d'un dataset d'exemple\ndata = pd.DataFrame({\n    'A': np.random.randn(100),\n    'B': np.random.rand(100),\n    'C': np.random.randint(0, 10, 100)\n})\n\nprint('Aperçu des données :')\nprint(data.head())\n\n# Visualisation rapide\nplt.figure(figsize=(10, 6))\nsns.scatterplot(data=data, x='A', y='B', hue='C')\nplt.title('Nuage de points d\'exemple')\nplt.show()"
      ]
    }
  ],
  "metadata": {
    "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "nbformat": 4,
  "nbformat_minor": 5
}
ONYXIA_FILE_6920673dd606

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas numpy matplotlib seaborn

