#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python-gpu on Onyxia.
# Purpose: installer un agent de code comme GitHub Copilot
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install VSCode/code-server extensions.
code-server --install-extension GitHub.copilot


code --install-extension GitHub.copilot
echo 'Agent de code installé avec succès'
code
