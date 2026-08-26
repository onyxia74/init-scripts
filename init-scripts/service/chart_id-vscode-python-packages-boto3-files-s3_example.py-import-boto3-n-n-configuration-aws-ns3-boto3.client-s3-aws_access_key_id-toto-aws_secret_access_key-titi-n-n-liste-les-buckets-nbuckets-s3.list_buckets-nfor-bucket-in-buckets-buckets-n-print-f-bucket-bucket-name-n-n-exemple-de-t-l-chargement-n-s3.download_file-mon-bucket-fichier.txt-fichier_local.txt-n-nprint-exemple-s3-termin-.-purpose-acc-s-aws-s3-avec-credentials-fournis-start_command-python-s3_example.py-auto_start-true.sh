#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["boto3"],"files":{"s3_example.py":"import boto3\n\n# Configuration AWS\ns3 = boto3.client('s3', aws_access_key_id='toto', aws_secret_access_key='titi')\n\n# Liste les buckets\nbuckets = s3.list_buckets()\nfor bucket in buckets['Buckets']:\n    print(f'Bucket: {bucket["Name"]}')\n\n# Exemple de téléchargement\n# s3.download_file('mon-bucket', 'fichier.txt', 'fichier_local.txt')\n\nprint('Exemple S3 terminé.')"},"purpose":"accès AWS S3 avec credentials fournis","start_command":"python s3_example.py","auto_start":true}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
