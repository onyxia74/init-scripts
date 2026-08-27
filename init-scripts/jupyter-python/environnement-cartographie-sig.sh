#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: environnement cartographie SIG
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_demo.py")"
cat > "${WORK_DIR}/carto_demo.py" <<'ONYXIA_FILE_d7ae7243c3b6'
import folium
import geopandas as gpd

# Exemple simple de carte
m = folium.Map(location=[48.8566, 2.3522], zoom_start=12)
folium.Marker([48.8566, 2.3522], popup='Paris').add_to(m)
m.save('carte_paris.html')
print('Carte sauvegardee dans carte_paris.html')
ONYXIA_FILE_d7ae7243c3b6

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib contextily

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_ce068bc4ca3d'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab
ONYXIA_FILE_ce068bc4ca3d
chmod +x "${WORK_DIR}/onyxia/run.sh"

