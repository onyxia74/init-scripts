#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Configurer un environnement de développement Java complet dans VS Code
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Install VSCode/code-server extensions.
code-server --install-extension vscjava.vscode-java-pack


apt-get update && apt-get install -y default-jdk
