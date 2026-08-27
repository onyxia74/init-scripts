#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: environnement de cartographie et visualisation geospatiale
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_demo.py")"
cat > "${WORK_DIR}/carto_demo.py" <<'ONYXIA_FILE_ad5d904b86d3'
import folium
import geopandas as gpd

# Exemple simple de carte
gdf = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))
m = folium.Map(location=[20, 0], zoom_start=2)
gdf.to_crs(epsg=4326).plot(ax=m.axes, color='green')
m.save('carte.html')
print('Carte sauvegardee dans carte.html')
ONYXIA_FILE_ad5d904b86d3

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib contextily

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_c388ee21a0a1'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --port=${PORT:-8888} --no-browser --allow-root
ONYXIA_FILE_c388ee21a0a1
chmod +x "${WORK_DIR}/onyxia/run.sh"

