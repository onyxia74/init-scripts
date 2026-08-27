#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{app.py:"from fastapi import FastAPI\n\napp = FastAPI()\n\n@app.get('/')\ndef read_root():\n    return {'Hello': 'World'}\n\n@app.get('/items/{item_id}')\ndef read_item(item_id: int, q: str = None):\n    return {'item_id': item_id, 'q': q}"},packages:["fastapi","uvicorn"],purpose:"deploy a Python API with FastAPI"},purpose: "deploy a Python API with FastAPI"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
