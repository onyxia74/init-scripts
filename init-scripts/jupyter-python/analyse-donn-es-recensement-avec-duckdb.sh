#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: analyse données recensement avec duckdb
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/data"
mkdir -p "${WORK_DIR}/src"
mkdir -p "${WORK_DIR}/notebooks"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_3a205f5dadab'
import duckdb
import pandas as pd

# Exemple de connexion
con = duckdb.connect('data/recensement.duckdb')
print('Connexion DuckDB établie')
ONYXIA_FILE_3a205f5dadab

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install duckdb pandas numpy

