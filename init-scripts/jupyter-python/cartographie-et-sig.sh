#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: cartographie et SIG
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/demo_map.py")"
cat > "${WORK_DIR}/demo_map.py" <<'ONYXIA_FILE_373270027a06'
import geopandas as gpd
import folium

# Exemple de structure pour joindre des données
# df_stats = ... (vos données statistiques)
# gdf_map = gpd.read_file('votre_fond_de_carte.geojson')
# merged = gdf_map.merge(df_stats, on='id')

print('Environnement SIG prêt.')
ONYXIA_FILE_373270027a06

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib shapely contextily

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_ce068bc4ca3d'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab
ONYXIA_FILE_ce068bc4ca3d
chmod +x "${WORK_DIR}/onyxia/run.sh"

