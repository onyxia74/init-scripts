#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pyspark on Onyxia.
# Purpose: gestion de gros fichiers S3 via streaming et chunking
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3 s3fs dask pyarrow

