#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparation environnement pour PostgreSQL, Neo4j et interface web
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_1c990bb2c80c'
import pandas as pd
import sqlalchemy
import neo4j

print('Environnement prêt pour PostgreSQL et Neo4j!')
# Exemple de connexion placeholder
# engine = sqlalchemy.create_engine('postgresql://user:pass@host:port/db')
# driver = neo4j.GraphDatabase.driver('bolt://host:port', auth=('user', 'pass'))
ONYXIA_FILE_1c990bb2c80c

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas sqlalchemy numpy psycopg2-binary neo4j

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_f336b03ad610'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python app.py
ONYXIA_FILE_f336b03ad610
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

