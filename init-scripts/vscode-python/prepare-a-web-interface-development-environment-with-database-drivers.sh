#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: prepare a web interface development environment with database drivers
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/app.py")"
cat > "${WORK_DIR}/app.py" <<'ONYXIA_FILE_3ca6f4e43a7c'
import os
import psycopg2
from neo4j import GraphDatabase

def check_connections():
    print("Checking database connections...")
    # This is a placeholder for connection logic
    print("PostgreSQL and Neo4j connection logic ready.")

if __name__ == '__main__':
    check_connections()
ONYXIA_FILE_3ca6f4e43a7c

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary flask requests neo4j

