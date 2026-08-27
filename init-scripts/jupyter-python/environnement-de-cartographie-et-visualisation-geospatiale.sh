#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: environnement de cartographie et visualisation geospatiale
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_demo.py")"
cat > "${WORK_DIR}/carto_demo.py" <<'ONYXIA_FILE_8f86d5858918'
import folium

# Creer une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=5)

# Ajouter un marqueur
folium.Marker([48.8566, 2.3522], popup='Paris', tooltip='Capitale de la France').add_to(m)

# Sauvegarder la carte
m.save('carte_france.html')
print('Carte sauvegardee dans carte_france.html')
ONYXIA_FILE_8f86d5858918

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib plotly

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_ce068bc4ca3d'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab
ONYXIA_FILE_ce068bc4ca3d
chmod +x "${WORK_DIR}/onyxia/run.sh"

