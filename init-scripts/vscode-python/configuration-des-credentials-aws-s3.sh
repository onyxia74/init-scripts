#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: configuration des credentials AWS S3
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/aws_setup.py")"
cat > "${WORK_DIR}/aws_setup.py" <<'ONYXIA_FILE_c8cd8612b42d'
import os

# Configuration des credentials AWS
os.environ['AWS_ACCESS_KEY_ID'] = 'toto'
os.environ['AWS_SECRET_ACCESS_KEY'] = 'titi'

print('AWS credentials configured in environment.')
ONYXIA_FILE_c8cd8612b42d

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install boto3

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_7f425c19e61b'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python3 aws_setup.py && code .
ONYXIA_FILE_7f425c19e61b
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


mkdir -p ~/.aws
touch ~/.aws/credentials
