#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Créer une carte interactive avec folium et geopandas
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/map.py")"
cat > "${WORK_DIR}/map.py" <<'ONYXIA_FILE_9f67f54a21dd'
import folium

# Créer une carte centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajouter un marqueur pour Paris
folium.Marker([48.8566, 2.3522], popup='Paris', tooltip='Paris').add_to(m)

# Sauvegarder la carte interactive
m.save('map.html')
print('La carte interactive a été générée : map.html')
ONYXIA_FILE_9f67f54a21dd

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas pandas

