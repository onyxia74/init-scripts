#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Création d'un script Python avec logique de probabilité pour l'utilisateur
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/definition.py")"
cat > "${WORK_DIR}/definition.py" <<'ONYXIA_FILE_6dfa3236c2f7'
import random

def message_avec_probabilite():
    base = "André Socard a perdu ses clés"
    options = [
        "et mohamed lui a ramené les clés chez lui",
        "Mohamed ne le lui a pas ramené les clés"
    ]
    return base + " " + random.choice(options)

if __name__ == "__main__":
    print(message_avec_probabilite())
ONYXIA_FILE_6dfa3236c2f7

