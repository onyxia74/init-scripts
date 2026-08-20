#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["psycopg2-binary","py2neo"],"purpose":"connexion aux bases de données postgresql et neo4j","setup_commands":["echo "Environnement prêt pour PostgreSQL et Neo4j" > README.md"]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
