#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["boto3"],"files":{"s3_example.py":"import boto3\n\n# Configuration AWS\ns3 = boto3.client('s3', aws_access_key_id='toto', aws_secret_access_key='titi')\n\n# Liste les buckets\nbuckets = s3.list_buckets()\nfor bucket in buckets['Buckets']:\n    print(f'Bucket: {bucket["Name"]}')\n\n# Liste les objets dans un bucket spécifique\n# response = s3.list_objects_v2(Bucket='mon-bucket')\n# for obj in response.get('Contents', []):\n#     print(f'Objet: {obj["Key"]}')"},"purpose":"Accès AWS S3 avec credentials fournis","start_command":"python s3_example.py","auto_start":true}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
