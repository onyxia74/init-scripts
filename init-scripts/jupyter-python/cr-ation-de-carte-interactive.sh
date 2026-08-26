#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: création de carte interactive
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/notebook_cartographie.ipynb")"
cat > "${WORK_DIR}/notebook_cartographie.ipynb" <<'ONYXIA_FILE_bfcf1d3cf0e8'
{ "cells": [ { "cell_type": "markdown", "metadata": {}, "source": [ "# Carte interactive avec Folium et GeoPandas\n\nCe notebook permet de visualiser des données géospatiales de manière interactive." ] }, { "cell_type": "code", "execution_count": null, "metadata": {}, "outputs": [], "source": [ "import geopandas as gpd\nimport folium\n\n# Charger un exemple de données géospatiales (par exemple, les limites des départements français)\n# Vous pouvez remplacer par vos propres données\ngdf = gpd.read_file('https://raw.githubusercontent.com/gboeing/urban-data/main/data/geojson/france-departements.geojson')\n\n# Créer une carte interactive\nmap = folium.Map(location=[46.6, 2.0], zoom_start=6)\n\n# Ajouter les données géospatiales à la carte\ngdf.explore(map=map, column='nom', cmap='Set1', legend=True).save('carte_interactive.html')\n\n# Afficher la carte dans le notebook\nfolium_static = folium.Map(location=[46.6, 2.0], zoom_start=6)\ngdf.explore(map=folium_static, column='nom', cmap='Set1', legend=True)\nfolium_static" ] } ], "metadata": { "kernelspec": { "display_name": "Python 3", "language": "python", "name": "python3" }, "language_info": { "codemirror_mode": { "name": "ipython", "version": 3 }, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.13.12" } } }
ONYXIA_FILE_bfcf1d3cf0e8

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas folium matplotlib

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_c9285dc17ec2'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.base_url=/
ONYXIA_FILE_c9285dc17ec2
chmod +x "${WORK_DIR}/onyxia/run.sh"

