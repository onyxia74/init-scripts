#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: installation d'extensions VS Code pour l'assistance IA (ex: GitHub Copilot, Codeium, ou extensions Python/Jupyter)
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install VSCode/code-server extensions.
code-server --install-extension GitHub.copilot
code-server --install-extension GitHub.copilot-chat
code-server --install-extension ms-python.python
code-server --install-extension ms-toolsai.jupyter

