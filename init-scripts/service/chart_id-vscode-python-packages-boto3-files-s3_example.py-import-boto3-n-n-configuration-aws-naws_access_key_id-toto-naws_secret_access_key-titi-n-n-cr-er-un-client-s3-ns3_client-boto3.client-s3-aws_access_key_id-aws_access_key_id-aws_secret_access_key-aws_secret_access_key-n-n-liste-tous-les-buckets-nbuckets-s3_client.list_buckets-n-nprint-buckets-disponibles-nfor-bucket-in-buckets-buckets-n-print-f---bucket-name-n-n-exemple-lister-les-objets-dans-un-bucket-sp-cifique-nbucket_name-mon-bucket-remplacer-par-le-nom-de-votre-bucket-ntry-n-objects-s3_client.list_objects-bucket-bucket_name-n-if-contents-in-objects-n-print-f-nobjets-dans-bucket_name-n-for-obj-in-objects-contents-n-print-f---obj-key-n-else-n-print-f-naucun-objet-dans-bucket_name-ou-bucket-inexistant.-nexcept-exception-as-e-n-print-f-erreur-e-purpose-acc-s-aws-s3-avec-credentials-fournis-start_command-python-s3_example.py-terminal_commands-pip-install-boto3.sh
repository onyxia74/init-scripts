#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["boto3"],"files":{"s3_example.py":"import boto3\n\n# Configuration AWS\naws_access_key_id = 'toto'\naws_secret_access_key = 'titi'\n\n# Créer un client S3\ns3_client = boto3.client('s3', aws_access_key_id=aws_access_key_id, aws_secret_access_key=aws_secret_access_key)\n\n# Liste tous les buckets\nbuckets = s3_client.list_buckets()\n\nprint('Buckets disponibles :')\nfor bucket in buckets['Buckets']:\n    print(f'  - {bucket["Name"]}')\n\n# Exemple : lister les objets dans un bucket spécifique\nbucket_name = 'mon-bucket'  # Remplacer par le nom de votre bucket\ntry:\n    objects = s3_client.list_objects(Bucket=bucket_name)\n    if 'Contents' in objects:\n        print(f'\nObjets dans {bucket_name} :')\n        for obj in objects['Contents']:\n            print(f'  - {obj["Key"]}')\n    else:\n        print(f'\nAucun objet dans {bucket_name} ou bucket inexistant.')\nexcept Exception as e:\n    print(f'Erreur : {e}')"},"purpose":"Accès AWS S3 avec credentials fournis","start_command":"python s3_example.py","terminal_commands":["pip install boto3"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
