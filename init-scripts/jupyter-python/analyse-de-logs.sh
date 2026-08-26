#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: analyse de logs
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/logs"
mkdir -p "${WORK_DIR}/notebooks"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/logs/demo.log")"
cat > "${WORK_DIR}/logs/demo.log" <<'ONYXIA_FILE_6b61da0a4d14'
2024-01-01 10:00:00 INFO: Application started
2024-01-01 10:01:00 ERROR: Failed to connect to database
2024-01-01 10:02:00 INFO: Database connection restored
2024-01-01 10:03:00 WARNING: High memory usage detected
2024-01-01 10:04:00 INFO: Process completed successfully
ONYXIA_FILE_6b61da0a4d14
mkdir -p "$(dirname "${WORK_DIR}/notebooks/log_analysis.ipynb")"
cat > "${WORK_DIR}/notebooks/log_analysis.ipynb" <<'ONYXIA_FILE_03f031efbc41'
{ "cells": [ { "cell_type": "markdown", "metadata": {}, "source": [ "# Analyse de logs\n\nCe notebook permet d'analyser des fichiers de logs avec des commandes shell et Python." ] }, { "cell_type": "code", "execution_count": null, "metadata": {}, "outputs": [], "source": [ "!tail -n 10 logs/demo.log\n\n!grep 'ERROR' logs/demo.log\n\n!grep 'WARNING' logs/demo.log\n\nimport pandas as pd\n\n# Lire le log dans un DataFrame\nlog_lines = pd.read_csv('logs/demo.log', sep='\s+', header=None, names=['timestamp', 'level', 'message'])\n\n# Afficher les 5 premières lignes\nlog_lines.head()" ] } ], "metadata": { "kernelspec": { "display_name": "Python 3", "language": "python", "name": "python3" }, "language_info": { "codemirror_mode": { "name": "ipython", "version": 3 }, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.13.12" } }
ONYXIA_FILE_03f031efbc41

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install tail grep less logrotate

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_b84e5458c244'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
jupyter lab --ip=0.0.0.0 --port=${PORT:-8888} --allow-root --NotebookApp.token='' --NotebookApp.password=''
ONYXIA_FILE_b84e5458c244
chmod +x "${WORK_DIR}/onyxia/run.sh"


sudo apt-get update && sudo apt-get install -y tail grep less logrotate
cd logs && tail -f demo.log
