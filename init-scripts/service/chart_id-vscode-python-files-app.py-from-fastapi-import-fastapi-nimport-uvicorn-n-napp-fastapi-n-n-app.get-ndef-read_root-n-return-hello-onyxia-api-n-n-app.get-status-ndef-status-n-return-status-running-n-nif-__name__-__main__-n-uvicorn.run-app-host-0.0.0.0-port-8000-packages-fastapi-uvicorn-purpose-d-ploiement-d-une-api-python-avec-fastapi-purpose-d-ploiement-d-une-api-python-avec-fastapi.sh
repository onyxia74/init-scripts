#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{app.py:"from fastapi import FastAPI\nimport uvicorn\n\napp = FastAPI()\n\n@app.get('/')\ndef read_root():\n    return {'Hello': 'Onyxia API'}\n\n@app.get('/status')\ndef status():\n    return {'status': 'running'}\n\nif __name__ == '__main__':\n    uvicorn.run(app, host='0.0.0.0', port=8000)"},packages:["fastapi","uvicorn"],purpose:"déploiement d'une API Python avec FastAPI"},purpose: "déploiement d'une API Python avec FastAPI"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
