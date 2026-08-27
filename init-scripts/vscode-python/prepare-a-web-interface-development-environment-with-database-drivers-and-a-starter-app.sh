#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: prepare a web interface development environment with database drivers and a starter app
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_2746a27920e7'
import os
import psycopg2
from neo4j import GraphDatabase

def check_connections():
    print("Checking database connections...")
    # This is a placeholder for connection logic
    # In a real scenario, you would use the service hostnames provided by Onyxia discovery
    print("PostgreSQL and Neo4j connectivity logic ready.")

if __name__ == '__main__':
    check_connections()
ONYXIA_FILE_2746a27920e7
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_b13c6a810887'
flask\nrequests\npsycopg2-binary\nneo4j\n
ONYXIA_FILE_b13c6a810887

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary flask requests neo4j
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

