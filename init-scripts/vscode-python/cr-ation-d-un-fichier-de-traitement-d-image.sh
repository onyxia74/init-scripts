#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: création d'un fichier de traitement d'image
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/traitement_image.py")"
cat > "${WORK_DIR}/traitement_image.py" <<'ONYXIA_FILE_85ccc26b75bb'
import cv2
import numpy as np

def process_image(image_path):
    # Chargement de l'image
    img = cv2.imread(image_path)
    if img is None:
        return "Erreur: Image non trouvée"
    
    # Conversion en niveaux de gris
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    
    # Application d'un flou
    blurred = cv2.GaussianBlur(gray, (5, 5), 0)
    
    return "Traitement terminé avec succès"

if __name__ == '__main__':
    print(process_image('test.jpg'))
ONYXIA_FILE_85ccc26b75bb

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install opencv-python numpy

