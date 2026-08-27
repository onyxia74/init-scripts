#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Squelette de pipeline machine learning
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_e268616ffe9a'
pandas
scikit-learn
numpy
matplotlib
seaborn
ONYXIA_FILE_e268616ffe9a
mkdir -p "$(dirname "${WORK_DIR}/src/pipeline.py")"
cat > "${WORK_DIR}/src/pipeline.py" <<'ONYXIA_FILE_e0f658f3c715'
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score, classification_report

# 1. Chargement des données
def load_data(path):
    """Charge les données depuis un fichier CSV."""
    print(f"Chargement des données depuis {path}...")
    # Exemple : df = pd.read_csv(path)
    # Pour l'instant, on simule des données
    data = np.random.rand(1000, 5)
    df = pd.DataFrame(data, columns=[f'feature_{i}' for i in range(5)])
    df['target'] = np.random.randint(0, 2, 1000)
    return df

# 2. Prétraitement
def preprocess_data(df):
    """Nettoie et prépare les données pour l'entraînement."""
    print("Prétraitement des données...")
    X = df.drop('target', axis=1)
    y = df['target']
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    scaler = StandardScaler()
    X_train = scaler.fit_transform(X_train)
    X_test = scaler.transform(X_test)
    
    return X_train, X_test, y_train, y_test, scaler

# 3. Entraînement
def train_model(X_train, y_train):
    """Entraîne un modèle de classification simple."""
    from sklearn.ensemble import RandomForestClassifier
    print("Entraînement du modèle...")
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    return model

# 4. Évaluation
def evaluate_model(model, X_test, y_test):
    """Évalue les performances du modèle."""
    print("Évaluation du modèle...")
    y_pred = model.predict(X_test)
    accuracy = accuracy_score(y_test, y_pred)
    print(f"Accuracy: {accuracy:.4f}")
    print(classification_report(y_test, y_pred))
    return accuracy

if __name__ == "__main__":
    # Flux principal
    df = load_data('data.csv')
    X_train, X_test, y_train, y_test, scaler = preprocess_data(df)
    model = train_model(X_train, y_train)
    evaluate_model(model, X_test, y_test)
ONYXIA_FILE_e0f658f3c715

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn matplotlib seaborn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

