#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",files:{"app.py":"from fastapi import FastAPI\nimport uvicorn\n\napp = FastAPI()\n\n@app.get(\"/\")\ndef read_root():\n    return {\"Hello\": \"Onyxia API\"}\n\n@app.get(\"/items/{item_id}\")\ndef read_item(item_id: int, q: str = None):\n    return {\"item_id\": item_id, \"q\": q}\n\nif __name__ == \"__main__\":\n    uvicorn.run(app, host=\"0.0.0.0\", port=8080)\n","requirements.txt":"fastapi\nuvicorn","README.md":"# FastAPI Project\n\nCe projet est une API Python prête à l'emploi.\n\n## Lancement\n\nPour lancer l'API, utilisez la commande suivante dans le terminal :\n```bash\npython app.py\n```\n"},purpose: "déploiement d'une API Python avec FastAPI"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
