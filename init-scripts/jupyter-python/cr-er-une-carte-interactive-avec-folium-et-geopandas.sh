#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Créer une carte interactive avec folium et geopandas
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carte_interactive.py")"
cat > "${WORK_DIR}/carte_interactive.py" <<'ONYXIA_FILE_11c14b2888cf'
import folium
from folium import plugins

# Créer une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajouter un bouton de recherche
folium.plugins.Search().add_to(m)

# Ajouter un marqueur
folium.Marker([48.8566, 2.3522], popup='Paris', icon=folium.Icon(color='red')).add_to(m)

# Sauvegarder la carte
m.save('carte_interactive.html')
print('Carte interactive sauvegardée sous carte_interactive.html')
ONYXIA_FILE_11c14b2888cf

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas pandas numpy

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_2a3c87d36650'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab carte_interactive.html
ONYXIA_FILE_2a3c87d36650
chmod +x "${WORK_DIR}/onyxia/run.sh"

