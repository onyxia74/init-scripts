#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: création de cartes interactives avec Python
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/map_demo.py")"
cat > "${WORK_DIR}/map_demo.py" <<'ONYXIA_FILE_0cfdf1f52fe7'
import folium
import geopandas as gpd
import matplotlib.pyplot as plt

# Exemple de création d'une carte simple
def create_map():
    m = folium.Map(location=[48.8566, 2.3522], zoom_start=12)
    m.save('map.html')
    print('Carte sauvegardée dans map.html')

if __name__ == '__main__':
    create_map()
ONYXIA_FILE_0cfdf1f52fe7

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib contextily shapely pyproj

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_476e4fdd9bb7'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
ONYXIA_FILE_476e4fdd9bb7
chmod +x "${WORK_DIR}/onyxia/run.sh"

