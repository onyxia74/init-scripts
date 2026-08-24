#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: développement avec accès S3 via variables d'environnement
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/s3_test.py")"
cat > "${WORK_DIR}/s3_test.py" <<'ONYXIA_FILE_2f729413a484'
import boto3
import os

# Les secrets sont injectés via les variables d'environnement Onyxia
# (ex: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)

def test_s3_connection():
    try:
        s3 = boto3.client('s3')
        buckets = s3.list_buckets()
        print('Connexion réussie ! Liste des buckets :')
        for bucket in buckets['Buckets']:
            print(f' - {bucket["Name"]}')
    except Exception as e:
        print(f'Erreur de connexion : {e}')
        print('Vérifiez que vos variables d\'environnement AWS sont correctement configurées.')

if __name__ == '__main__':
    test_s3_connection()
ONYXIA_FILE_2f729413a484

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_a883124d74e4'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python s3_test.py
ONYXIA_FILE_a883124d74e4
chmod +x "${WORK_DIR}/onyxia/run.sh"

# Add a VSCode task for the prepared project.
mkdir -p "${WORK_DIR}/.vscode"
cat > "${WORK_DIR}/.vscode/tasks.json" <<'ONYXIA_FILE_0a74afde5062'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run prepared project",
      "type": "shell",
      "command": "${workspaceFolder}/onyxia/run.sh",
      "problemMatcher": [],
      "group": "build"
    }
  ]
}
ONYXIA_FILE_0a74afde5062

