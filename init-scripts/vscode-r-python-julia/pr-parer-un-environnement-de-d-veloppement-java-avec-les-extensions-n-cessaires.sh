#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-r-python-julia on Onyxia.
# Purpose: préparer un environnement de développement Java avec les extensions nécessaires
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install VSCode/code-server extensions.
code-server --install-extension vscjava.vscode-java-pack

