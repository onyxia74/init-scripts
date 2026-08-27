#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: S3 large file management without exhausting memory
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_large_files.py")"
cat > "${WORK_DIR}/s3_large_files.py" <<'ONYXIA_FILE_618d89993be8'
# S3 Large File Management Examples
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import dask.dataframe as dd
import boto3
import s3fs

# Example 1: Using PyArrow for Parquet files (Recommended for large files)
def read_parquet_s3(bucket, key):
    s3 = s3fs.S3FileSystem()
    with s3.open(f's3://{bucket}/{key}', 'rb') as f:
        table = pq.read_table(f)
        return table.to_pandas()

# Example 2: Using Dask for large CSV/Parquet files
def read_large_csv_s3(bucket, key):
    fs = s3fs.S3FileSystem()
    return dd.read_csv(f's3://{bucket}/{key}', storage_options={'key': '...', 'secret': '...'})

# Example 3: Using S3FS with Pandas for smaller chunks
def read_csv_s3_chunked(bucket, key):
    fs = s3fs.S3FileSystem()
    with fs.open(f's3://{bucket}/{key}', 'rb') as f:
        return pd.read_csv(f, chunksize=100000)

print('S3 large file management examples loaded.')
ONYXIA_FILE_618d89993be8

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas s3fs pyarrow dask boto3

