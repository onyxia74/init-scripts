#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["boto3"],"purpose":"développement avec accès S3 via variables d'environnement","files":{"s3_test.py":"import boto3\nimport os\n\n# Les secrets sont injectés via les variables d'environnement par Onyxia\n# ou via le paramètre 's3' du chart.\n\ns3 = boto3.client(\n    's3',\n    aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'),\n    aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'),\n    endpoint_url=os.getenv('S3_ENDPOINT')\n)\n\ndef test_connection():\n    try:\n        buckets = s3.list_buckets()\n        print('Connexion réussie ! Buckets trouvés :')\n        for bucket in buckets['Buckets']:\n            print(f' - {bucket[\'Name\']}')\n    except Exception as e:\n        print(f'Erreur de connexion : {e}')\n\nif __name__ == '__main__':\n    test_connection()"},"start_command":"python s3_test.py"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
