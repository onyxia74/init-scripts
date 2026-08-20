#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["flask","requests","pandas","sqlalchemy","psycopg2-binary"],"files":{"app.py":"from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Interface Web connectée aux bases de données !'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
","requirements.txt":"flask\nrequests\npandas\nsqlalchemy\npsycopg2-binary"},"start_command":"python app.py","purpose":"préparer un environnement de développement pour une interface web connectée à PostgreSQL et Neo4j"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
