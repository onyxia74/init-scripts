#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: environnement de cartographie geospatiale avec exemples
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/carto_demo.py")"
cat > "${WORK_DIR}/carto_demo.py" <<'ONYXIA_FILE_f386b931f3f3'
import geopandas as gpd
import folium
from folium import Choropleth, Circle, Marker
from folium.plugins import HeatMap
import matplotlib.pyplot as plt

# Exemple de création d'une carte basique avec Folium
# On part d'une carte du monde centrée sur la France
m = folium.Map(location=[46.603354, 1.888334], zoom_start=6)

# Ajout d'un marqueur
folium.Marker(
    location=[48.8566, 2.3522],
    popup='Paris',
    icon=folium.Icon(color='red')
).add_to(m)

# Sauvegarde de la carte
m.save('carte_folium.html')
print('Carte générée : carte_folium.html')

# Exemple avec GeoPandas (données mondiales incluses)
world = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))
france = world[world.name == 'France']

# Affichage simple
fig, ax = plt.subplots(figsize=(10, 10))
world.plot(ax=ax, color='lightgrey', edgecolor='black')
france.plot(ax=ax, color='blue', edgecolor='black')
plt.title('Carte de la France avec GeoPandas')
plt.axis('off')
plt.savefig('carte_geopandas.png', dpi=300, bbox_inches='tight')
print('Carte GeoPandas générée : carte_geopandas.png')
ONYXIA_FILE_f386b931f3f3

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib contextily shapely

