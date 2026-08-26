#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["boto3"],"purpose":"test S3 connection with boto3","files":{"s3_test.py":"import boto3\nimport os\n\n# Exemple d'utilisation via variables d'environnement\ns3 = boto3.client('s3')\n\ntry:\n    print('Tentative de listage des buckets...')\n    response = s3.list_buckets()\n    print('Succès ! Buckets trouvés :')\n    for bucket in response['Buckets']:\n        print(f' - {bucket[\"Name\"]}')\nexcept Exception as e:\n    print(f'Erreur lors de la connexion S3 : {e}')\n    print('Vérifiez que vos secrets S3 sont correctement configurés dans l\\'environnement Onyxia.')\n"},{"readme.md":"# Test S3\nCe projet contient un script pour tester la connexion à S3 via `boto3`. \nExécutez `python s3_test.py` dans le terminal."}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
