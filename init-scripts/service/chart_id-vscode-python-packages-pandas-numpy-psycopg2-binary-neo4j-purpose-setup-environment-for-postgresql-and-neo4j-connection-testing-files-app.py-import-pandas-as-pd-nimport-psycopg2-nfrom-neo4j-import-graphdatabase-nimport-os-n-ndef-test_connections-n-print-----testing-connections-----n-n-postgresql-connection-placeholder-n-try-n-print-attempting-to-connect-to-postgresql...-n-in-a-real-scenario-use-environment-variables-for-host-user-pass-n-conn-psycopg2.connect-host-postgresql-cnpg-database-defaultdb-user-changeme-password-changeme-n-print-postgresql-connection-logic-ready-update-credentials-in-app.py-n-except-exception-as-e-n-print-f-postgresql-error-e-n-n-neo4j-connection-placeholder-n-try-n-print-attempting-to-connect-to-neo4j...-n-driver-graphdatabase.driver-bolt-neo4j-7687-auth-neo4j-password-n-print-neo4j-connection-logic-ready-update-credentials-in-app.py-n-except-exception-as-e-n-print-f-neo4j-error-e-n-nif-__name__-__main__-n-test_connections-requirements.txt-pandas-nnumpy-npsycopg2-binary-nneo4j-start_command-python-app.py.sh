#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["pandas","numpy","psycopg2-binary","neo4j"],"purpose":"setup environment for postgresql and neo4j connection testing","files":{"app.py":"import pandas as pd\nimport psycopg2\nfrom neo4j import GraphDatabase\nimport os\n\ndef test_connections():\n    print(\"--- Testing Connections ---\")\n    \n    # PostgreSQL connection placeholder\n    try:\n        print(\"Attempting to connect to PostgreSQL...\")\n        # In a real scenario, use environment variables for host/user/pass\n        # conn = psycopg2.connect(host='postgresql-cnpg', database='defaultdb', user='changeme', password='changeme')\n        print(\"PostgreSQL: Connection logic ready (Update credentials in app.py)\")\n    except Exception as e:\n        print(f\"PostgreSQL error: {e}\")\n\n    # Neo4j connection placeholder\n    try:\n        print(\"Attempting to connect to Neo4j...\")\n        # driver = GraphDatabase.driver(\"bolt://neo4j:7687\", auth=(\"neo4j\", \"password\"))\n        print(\"Neo4j: Connection logic ready (Update credentials in app.py)\")\n    except Exception as e:\n        print(f\"Neo4j error: {e}\")\n\nif __name__ == '__main__':\n    test_connections()\",\"requirements.txt\":\"pandas\\nnumpy\\npsycopg2-binary\\nneo4j\"},"start_command":"python app.py"}'}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
