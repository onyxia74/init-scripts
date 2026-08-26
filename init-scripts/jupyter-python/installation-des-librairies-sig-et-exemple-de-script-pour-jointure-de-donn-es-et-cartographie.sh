#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Installation des librairies SIG et exemple de script pour jointure de données et cartographie
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/map_join_example.py")"
cat > "${WORK_DIR}/map_join_example.py" <<'ONYXIA_FILE_4d67cfff306d'
import geopandas as gpd
import pandas as pd
import matplotlib.pyplot as plt

# Exemple de chargement de données
# gdf = gpd.read_file('path/to/shapefile.shp')
# df = pd.read_csv('path/to/data.csv')

# Exemple de jointure (à adapter selon vos données)
# gdf = gdf.merge(df, left_on='id', right_on='id')

# Exemple de visualisation
# gdf.plot(column='statistic_column', cmap='Blues')
# plt.show()

print('Librairies geopandas, folium, matplotlib, shapely installées.')
ONYXIA_FILE_4d67cfff306d

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas matplotlib pandas folium shapely

