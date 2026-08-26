#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: cartographie et visualisation de données statistiques
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/notebook_carto.ipynb")"
cat > "${WORK_DIR}/notebook_carto.ipynb" <<'ONYXIA_FILE_1f101d0ea426'
{ "cells": [ { "cell_type": "markdown", "metadata": {}, "source": [ "# Cartographie des données statistiques\n\nCe notebook permet de joindre vos données statistiques à un fond de carte." ] }, { "cell_type": "code", "metadata": {}, "source": [ "import geopandas as gpd\nimport folium\nimport matplotlib.pyplot as plt\n\n# Exemple : charger un fichier GeoJSON\nworld = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))\n\n# Exemple : afficher la carte\nworld.plot(figsize=(10, 6))\nplt.show()" ], "execution_count": null, "outputs": [] } ], "metadata": { "kernelspec": { "display_name": "Python 3", "language": "python", "name": "python3" }, "language_info": { "codemirror_mode": { "name": "ipython", "version": 3 }, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.13.12" } } }
ONYXIA_FILE_1f101d0ea426

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas folium matplotlib

