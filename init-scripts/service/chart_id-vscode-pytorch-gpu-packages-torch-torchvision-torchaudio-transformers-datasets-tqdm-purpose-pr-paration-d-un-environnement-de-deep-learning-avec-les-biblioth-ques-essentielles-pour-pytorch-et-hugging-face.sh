#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id:<|"|>vscode-pytorch-gpu<|"|>,packages:[<|"|>torch<|"|>,<|"|>torchvision<|"|>,<|"|>torchaudio<|"|>,<|"|>transformers<|"|>,<|"|>datasets<|"|>,<|"|>tqdm<|"|>],purpose:<|"|>préparation d'un environnement de deep learning avec les bibliothèques essentielles pour PyTorch et Hugging Face<|"|>}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
