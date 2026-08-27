#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: demonstration de gestion de secrets via .env
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_fe6422b562d1'
# Projet avec gestion de secrets

Pour ajouter des secrets, créez un fichier `.env` dans `/home/onyxia/work/`.

Exemple de contenu :
```
API_KEY=votre_cle_secrete
DB_PASSWORD=mon_mot_de_passe
```

Ensuite, utilisez la bibliothèque `python-dotenv` pour les charger dans votre code Python.

```python
from dotenv import load_dotenv
import os

load_dotenv()
api_key = os.getenv('API_KEY')
print(f'API Key chargée : {api_key}')
```
ONYXIA_FILE_fe6422b562d1
mkdir -p "$(dirname "${WORK_DIR}/main.py")"
cat > "${WORK_DIR}/main.py" <<'ONYXIA_FILE_20e6ca71969d'
import os
from dotenv import load_dotenv

# Charger les variables du fichier .env
load_dotenv()

print('--- Test de chargement de secrets ---')
api_key = os.getenv('API_KEY')

if api_key:
    print('✅ Succès : La clé API a été récupérée.')
else:
    print('❌ Échec : La clé API est absente. Vérifiez votre fichier .env')

print('------------------------------------')
ONYXIA_FILE_20e6ca71969d

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install python-dotenv

