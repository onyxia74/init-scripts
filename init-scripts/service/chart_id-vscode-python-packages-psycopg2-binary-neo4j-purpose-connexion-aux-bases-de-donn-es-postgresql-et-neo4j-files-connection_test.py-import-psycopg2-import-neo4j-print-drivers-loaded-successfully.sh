#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["psycopg2-binary","neo4j"],"purpose":"connexion aux bases de données postgresql et neo4j","files":{"connection_test.py":"import psycopg2
import neo4j
print('Drivers loaded successfully!')"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
