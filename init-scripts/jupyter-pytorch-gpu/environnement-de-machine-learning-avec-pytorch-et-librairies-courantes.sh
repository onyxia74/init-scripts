#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch-gpu on Onyxia.
# Purpose: Environnement de machine learning avec PyTorch et librairies courantes
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/train.py")"
cat > "${WORK_DIR}/train.py" <<'ONYXIA_FILE_8a46bc27af34'
import torch
import torch.nn as nn
import torch.optim as optim

# Exemple simple de modèle
class SimpleModel(nn.Module):
    def __init__(self):
        super(SimpleModel, self).__init__()
        self.fc1 = nn.Linear(10, 5)
        self.fc2 = nn.Linear(5, 1)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = self.fc2(x)
        return x

print("Environnement ML prêt pour l'entraînement.")
print(f"PyTorch version: {torch.__version__}")
print(f"CUDA disponible: {torch.cuda.is_available()}")
ONYXIA_FILE_8a46bc27af34

# Install missing language runtimes.
APT_GET="apt-get"
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  APT_GET="sudo apt-get"
fi
if ! command -v javac >/dev/null 2>&1 || ! command -v java >/dev/null 2>&1; then
  echo "Installing Java JDK"
  ${APT_GET} update
  ${APT_GET} install -y default-jdk
fi

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install torch torchvision torchaudio pandas scikit-learn matplotlib seaborn xgboost lightgbm

