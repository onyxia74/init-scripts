#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Environnement de travail pour données géographiques volumineuses
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/geodata_loader.py")"
cat > "${WORK_DIR}/geodata_loader.py" <<'ONYXIA_FILE_87c81073fde7'
import geopandas as gpd
import dask.dataframe as dd

def load_geoparquet(path):
    # Exemple de chargement avec Dask pour du volumineux
    gdf = dd.read_parquet(path)
    return gdf.to_geopandas()

if __name__ == '__main__':
    print('Prêt à charger des données géographiques volumineuses.')
ONYXIA_FILE_87c81073fde7

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install geopandas dask pyarrow duckdb fsspec s3fs

