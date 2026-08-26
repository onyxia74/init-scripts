#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch on Onyxia.
# Purpose: squelette pipeline machine learning
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/pipeline.py")"
cat > "${WORK_DIR}/pipeline.py" <<'ONYXIA_FILE_25660e62cb33'
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report

# --- 1. Chargement des données ---
def load_data(filepath):
    """Charge les données depuis un fichier CSV."""
    # Remplacer par le chemin réel ou une URL
    df = pd.read_csv(filepath)
    print(f"Données chargées : {df.shape}")
    return df

# --- 2. Prétraitement ---
def preprocess_data(df):
    """Nettoie et prépare les données pour l'entraînement."""
    # Exemple : gestion des valeurs manquantes
    df.dropna(inplace=True)
    
    # Séparation features et target (à adapter selon le dataset)
    X = df.drop('target_column', axis=1) # Remplacer 'target_column'
    y = df['target_column']
    
    return X, y

# --- 3. Entraînement ---
def train_model(X_train, y_train):
    """Entraîne un modèle de classification simple."""
    from sklearn.ensemble import RandomForestClassifier
    
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    print("Modèle entraîné.")
    return model

# --- 4. Évaluation ---
def evaluate_model(model, X_test, y_test):
    """Évalue les performances du modèle."""
    y_pred = model.predict(X_test)
    print("Rapport de classification :")
    print(classification_report(y_test, y_pred))
    return y_pred

# --- Orchestration ---
def main():
    # Charger les données
    # df = load_data('data.csv')
    
    # Prétraiter
    # X, y = preprocess_data(df)
    
    # Diviser
    # X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    # Entraîner
    # model = train_model(X_train, y_train)
    
    # Évaluer
    # evaluate_model(model, X_test, y_test)
    
    print("Pipeline prêt à être configuré avec vos données.")

if __name__ == "__main__":
    main()
ONYXIA_FILE_25660e62cb33

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn matplotlib seaborn

