#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: cartographie géospatiale avec GeoPandas et Folium
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/notebook_cartographie.ipynb")"
cat > "${WORK_DIR}/notebook_cartographie.ipynb" <<'ONYXIA_FILE_8a6d1b7c2730'
{ "cells": [ { "cell_type": "markdown", "metadata": {}, "source": [ "# Cartographie avec GeoPandas et Folium\n\nExemple de visualisation géospatiale avec des données de test." ] }, { "cell_type": "code", "metadata": {}, "source": [ "import geopandas as gpd\nimport folium\nimport pandas as pd\nimport numpy as np\n\n# Créer des données de test\ncoords = np.random.rand(10, 2) * 100\ndata = pd.DataFrame(coords, columns=['x', 'y'])\n\n# Créer un GeoDataFrame\ngdf = gpd.GeoDataFrame(data, geometry=gpd.points_from_xy(data.x, data.y))\n\n# Créer une carte avec Folium\nmap = folium.Map(location=[50, 50], zoom_start=10)\nfolium.GeoJson(gdf).add_to(map)\nmap" ], "execution_count": null, "outputs": [] } ], "metadata": { "kernelspec": { "display_name": "Python 3", "language": "python", "name": "python3" }, "language_info": { "codemirror_mode": { "name": "ipython", "version": 3 }, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.13.12" } } }
ONYXIA_FILE_8a6d1b7c2730
mkdir -p "$(dirname "${WORK_DIR}/data/test_data.csv")"
cat > "${WORK_DIR}/data/test_data.csv" <<'ONYXIA_FILE_90f04c52722c'
x,y
50,50
60,60
70,70
80,80
90,90
10,10
20,20
30,30
40,40
50,50
ONYXIA_FILE_90f04c52722c

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas folium matplotlib pandas numpy

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_0bf176d34f41'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --port=${PORT:-8888} --allow-root --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.base_url=/
ONYXIA_FILE_0bf176d34f41
chmod +x "${WORK_DIR}/onyxia/run.sh"

