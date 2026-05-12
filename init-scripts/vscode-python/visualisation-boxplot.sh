#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: visualisation boxplot
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/boxplot.py")"
cat > "${WORK_DIR}/boxplot.py" <<'ONYXIA_FILE_f7a92e0cffd4'
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np

# Génération de données fictives
data = np.random.normal(size=100)

# Création du boxplot
plt.figure(figsize=(8, 6))
sns.boxplot(x=data)
plt.title('Exemple de Boxplot avec Seaborn')
plt.show()
ONYXIA_FILE_f7a92e0cffd4

