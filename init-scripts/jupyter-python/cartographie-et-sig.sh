#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: cartographie et SIG
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/map_example.py")"
cat > "${WORK_DIR}/map_example.py" <<'ONYXIA_FILE_3307e3135e96'
import geopandas as gpd
import folium

# Exemple de structure pour joindre des données à un fond de carte
def create_map(geojson_path, csv_path):
    # Charger le fond de carte
    gdf = gpd.read_file(geojson_path)
    # Charger les données statistiques
    df = pd.read_csv(csv_path)
    # Jointure
    merged = gdf.merge(df, on='id')
    # Création de la carte
    m = folium.Map(location=[46.6, 2.2], zoom_start=6)
    folium.Choropleth(geo_data=merged, data=merged, columns=['id', 'valeur'], key_on='feature.properties.id', fill_color='YlOrRd').add_to(m)
    return m

print('Environnement SIG prêt.')
ONYXIA_FILE_3307e3135e96

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install folium geopandas matplotlib shapely contextily geoviews

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_476e4fdd9bb7'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
ONYXIA_FILE_476e4fdd9bb7
chmod +x "${WORK_DIR}/onyxia/run.sh"

