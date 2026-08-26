#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"jupyter-python","packages":["geopandas","folium","matplotlib"],"purpose":"cartographie et visualisation geospatiale","files":{"notebook_cartographie.ipynb":"{ \"cells\": [ { \"cell_type\": \"markdown\", \"metadata\": {}, \"source\": [ \"# Cartographie avec GeoPandas et Folium\\n\\nExemple de visualisation géospatiale : carte de la France avec des points de données.\" ] }, { \"cell_type\": \"code\", \"metadata\": {}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
