#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-r-python-julia","packages":["DBI","RPostgres"],"purpose":"connect to postgresql","files":{"connection_test.R":"library(DBI)
library(RPostgres)

# Note: The host, port, dbname, user and password 
# will depend on the PostgreSQL service discovery.
# In Onyxia, services are often discoverable via environment variables 
# or internal DNS.

print("Attempting to connect to PostgreSQL...")
# This is a template, actual connection details are injected via discovery
# or manual configuration in the script.
"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
