#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: travailler sur des datasets volumineux avec outillage de traitement par morceaux (chunking) et parallélisation
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/big_data_demo.py")"
cat > "${WORK_DIR}/big_data_demo.py" <<'ONYXIA_FILE_c80dfe66e75b'
import pandas as pd
import numpy as np
import dask.dataframe as dd
import polars as pl

# Exemple de lecture par morceaux avec Pandas
def read_in_chunks(file_path, chunk_size=10000):
    for chunk in pd.read_csv(file_path, chunksize=chunk_size):
        yield chunk

# Exemple avec Dask pour le parallélisme
def dask_example(file_path):
    ddf = dd.read_csv(file_path)
    return ddf.compute()

# Exemple avec Polars pour la performance
def polars_example(file_path):
    df = pl.scan_csv(file_path)
    return df.collect()

print('Environnement prêt pour le Big Data !')
ONYXIA_FILE_c80dfe66e75b

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas dask pyarrow polars

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_15b0fe97d5b0'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --allow-root --no-browser
ONYXIA_FILE_15b0fe97d5b0
chmod +x "${WORK_DIR}/onyxia/run.sh"

