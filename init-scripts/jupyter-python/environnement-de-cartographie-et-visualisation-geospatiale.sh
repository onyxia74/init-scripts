#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Environnement de cartographie et visualisation geospatiale
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_demo.py")"
cat > "${WORK_DIR}/carto_demo.py" <<'ONYXIA_FILE_82853562111e'
import folium
import geopandas as gpd

# Exemple de carte basique
m = folium.Map(location=[48.8566, 2.3522], zoom_start=12)
folium.Marker([48.8566, 2.3522], popup='Paris').add_to(m)
m.save('carte_paris.html')
print('Carte sauvegardee dans carte_paris.html')
ONYXIA_FILE_82853562111e

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib plotly contextily

