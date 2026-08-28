#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"jupyter-python","packages":["pandas","boto3","s3fs","dask","pyarrow"],"purpose":"large file S3 processing with streaming and chunking","files":{"s3_streaming_example.py":"import pandas as pd\nimport s3fs\nimport dask.dataframe as dd\n\n# Example 1: Using pandas with chunksize for streaming\ndef process_with_pandas_chunks(s3_path):\n    # s3fs is used under the hood by pandas\n    chunks = pd.read_csv(s3_path, chunksize=10000)\n    for chunk in chunks:\n        # Process each chunk without loading the whole file into memory\n        print(f'Processing chunk with shape: {chunk.shape}')\n\n# Example 2: Using Dask for parallel/out-of-core processing\ndef process_with_dask(s3_path):\n    # Dask handles large datasets by breaking them into partitions\n    ddf = dd.read_csv(s3_path)\n    result = ddf.groupby('some_column').mean().compute()\n    print(result)\n\nif __name__ == '__main__':\n    print('S3 streaming script ready. Replace s3_path with your actual S3 URI.')\n"},"commands":["pip install pandas boto3 s3fs dask pyarrow"],"start_command":"jupyter lab"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
