#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: clonage de projet GitHub
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
git clone https://github.com/votre-utilisateur/votre-projet.git /home/onyxia/work/mon-projet
