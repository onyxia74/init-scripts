#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-pytorch-gpu<|"|>,purpose:<|"|>préparation d'un environnement de deep learning avec les bibliothèques essentielles et une structure de projet standard<|"|>,python_packages:[<|"|>torch<|"|>,<|"|>torchvision<|"|>,<|"|>torchaudio<|"|>,<|"|>numpy<|"|>,<|"|>pandas<|"|>,<|"|>matplotlib<|"|>,<|"|>scikit-learn<|"|>,<|"|>tqdm<|"|>]}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
