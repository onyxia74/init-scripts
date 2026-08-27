#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Demonstrate connection to PostgreSQL using environment variables
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_postgres.py")"
cat > "${WORK_DIR}/connect_postgres.py" <<'ONYXIA_FILE_cd010817e5fc'
import os
import psycopg2

# Onyxia typically injects environment variables for connected services
# or you can define them manually if connecting to an external DB.
host = os.environ.get('POSTGRESQL_HOST', 'localhost')
port = os.environ.get('POSTGRESQL_PORT', '5432')
user = os.environ.get('POSTGRESQL_USER', 'postgres')
password = os.environ.get('POSTGRESQL_PASSWORD', '')
database = os.environ.get('POSTGRESQL_DATABASE', 'postgres')

try:
    conn = psycopg2.connect(host=host, port=port, user=user, password=password, dbname=database)
    print(f"Successfully connected to PostgreSQL at {host}:{port}")
    cur = conn.cursor()
    cur.execute('SELECT version();')
    db_version = cur.fetchone()
    print(f"PostgreSQL version: {db_version}")
    cur.close()
    conn.close()
except Exception as e:
    print(f"Connection failed: {e}")
    print("Ensure environment variables are set correctly.")
ONYXIA_FILE_cd010817e5fc

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary

