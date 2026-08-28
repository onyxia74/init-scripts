#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"jupyter-python","packages":["psycopg2-binary"],"purpose":"connect to postgresql","files":{"connection_test.py":"import psycopg2\nimport os\n\n# Note: In Onyxia, connection details are often provided via environment variables\n# or service discovery. This script provides a template.\n\nconn_params = {\n    \"dbname\": os.getenv(\"POSTGRESQL_DATABASE\", \"defaultdb\"),\n    \"user\": os.getenv(\"POSTGRESQL_USER\", \"changeme\"),\n    \"password\": os.getenv(\"POSTGRESQL_PASSWORD\", \"changeme\"),\n    \"host\": os.getenv(\"POSTGRESQL_HOST\", \"localhost\"),\n    \"port\": os.getenv(\"POSTGRESQL_PORT\", \"5432\"),\n}\n\ntry:\n    print(f\"Attempting to connect to {conn_params['host']}...\")\n    conn = psycopg2.connect(**conn_params)\n    print(\"Connection successful!\")\n    conn.close()\nexcept Exception as e:\n    print(f\"Connection failed: {e}\")\n"},\n"start_command":"python connection_test.py"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
