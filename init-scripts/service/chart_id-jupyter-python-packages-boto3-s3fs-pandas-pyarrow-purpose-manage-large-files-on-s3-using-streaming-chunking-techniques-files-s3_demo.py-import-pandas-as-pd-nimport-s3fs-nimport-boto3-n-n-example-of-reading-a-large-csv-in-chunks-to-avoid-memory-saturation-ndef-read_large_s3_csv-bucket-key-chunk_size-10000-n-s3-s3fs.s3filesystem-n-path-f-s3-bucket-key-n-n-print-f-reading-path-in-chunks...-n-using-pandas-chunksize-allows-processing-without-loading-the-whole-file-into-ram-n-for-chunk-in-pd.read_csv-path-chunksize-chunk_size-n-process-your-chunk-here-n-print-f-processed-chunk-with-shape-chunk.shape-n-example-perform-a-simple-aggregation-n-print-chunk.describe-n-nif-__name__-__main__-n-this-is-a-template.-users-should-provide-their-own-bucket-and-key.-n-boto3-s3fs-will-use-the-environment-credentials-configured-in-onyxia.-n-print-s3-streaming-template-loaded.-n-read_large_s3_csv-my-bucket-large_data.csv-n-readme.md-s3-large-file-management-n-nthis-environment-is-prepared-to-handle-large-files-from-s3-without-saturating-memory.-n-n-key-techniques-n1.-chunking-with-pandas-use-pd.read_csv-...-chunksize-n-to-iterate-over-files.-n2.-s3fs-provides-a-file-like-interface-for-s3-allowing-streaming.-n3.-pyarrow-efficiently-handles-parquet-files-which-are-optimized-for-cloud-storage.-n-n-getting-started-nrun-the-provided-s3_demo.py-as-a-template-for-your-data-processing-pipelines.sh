#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"jupyter-python","packages":["boto3","s3fs","pandas","pyarrow"],"purpose":"manage large files on S3 using streaming/chunking techniques","files":{"s3_demo.py":"import pandas as pd\nimport s3fs\nimport boto3\n\n# Example of reading a large CSV in chunks to avoid memory saturation\ndef read_large_s3_csv(bucket, key, chunk_size=10000):\n    s3 = s3fs.S3FileSystem()\n    path = f's3://{bucket}/{key}'\n    \n    print(f'Reading {path} in chunks...')\n    # Using pandas chunksize allows processing without loading the whole file into RAM\n    for chunk in pd.read_csv(path, chunksize=chunk_size):\n        # Process your chunk here\n        print(f'Processed chunk with shape: {chunk.shape}')\n        # Example: perform a simple aggregation\n        # print(chunk.describe())\n\nif __name__ == '__main__':\n    # This is a template. Users should provide their own bucket and key.\n    # Boto3/s3fs will use the environment credentials configured in Onyxia.\n    print('S3 Streaming Template Loaded.')\n    # read_large_s3_csv(\"my-bucket\", \"large_data.csv\")\n"},"README.md":"# S3 Large File Management\n\nThis environment is prepared to handle large files from S3 without saturating memory.\n\n## Key Techniques\n1. **Chunking with Pandas**: Use `pd.read_csv(..., chunksize=N)` to iterate over files.\n2. **S3FS**: Provides a file-like interface for S3, allowing streaming.\n3. **PyArrow**: Efficiently handles Parquet files which are optimized for cloud storage.\n\n## Getting Started\nRun the provided `s3_demo.py` as a template for your data processing pipelines."}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
