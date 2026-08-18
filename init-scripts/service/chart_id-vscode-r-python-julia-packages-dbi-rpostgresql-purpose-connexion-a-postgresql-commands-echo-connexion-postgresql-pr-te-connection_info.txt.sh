#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-r-python-julia","packages":["DBI","RPostgreSQL"],"purpose":"connexion a postgresql","commands":["echo "Connexion PostgreSQL prête" > connection_info.txt"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
