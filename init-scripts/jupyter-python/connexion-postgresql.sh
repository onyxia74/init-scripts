#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: connexion à PostgreSQL
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/notebook.ipynb")"
cat > "${WORK_DIR}/notebook.ipynb" <<'ONYXIA_FILE_7443033aa866'
{ "cells": [ { "cell_type": "markdown", "metadata": {}, "source": [ "# Connexion à PostgreSQL\n\nExemple de connexion à une base de données PostgreSQL depuis Jupyter." ] }, { "cell_type": "code", "execution_count": null, "metadata": {}, "outputs": [], "source": [ "import psycopg2\n\n# Configuration de connexion\nconn = psycopg2.connect(\n    host='postgresql-cnpg',\n    database='defaultdb',\n    user='changeme',\n    password='changeme',\n    port=5432\n)\n\ncursor = conn.cursor()\n\n# Exemple de requête\ncursor.execute('SELECT version();')\nversion = cursor.fetchone()\nprint('Version PostgreSQL:', version)\n\ncursor.close()\nconn.close()" ] } ], "metadata": { "kernelspec": { "display_name": "Python 3", "language": "python", "name": "python3" }, "language_info": { "codemirror_mode": { "name": "ipython", "version": 3 }, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.13.12" } }
ONYXIA_FILE_7443033aa866

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install psycopg2-binary sqlalchemy

