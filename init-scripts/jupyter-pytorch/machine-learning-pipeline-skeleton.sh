#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-pytorch on Onyxia.
# Purpose: machine learning pipeline skeleton
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
mkdir -p "${WORK_DIR}/src"

# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/src/main.py")"
cat > "${WORK_DIR}/src/main.py" <<'ONYXIA_FILE_6a66311eeda3'
import os
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

def main():
    print("Starting ML Pipeline...")
    
    # 1. Data Loading (Simulated)
    print("Step 1: Loading data...")
    # In a real scenario, you would load from a file or database
    data = pd.DataFrame({
        'feature1': np.random.rand(100),
        'feature2': np.random.rand(100),
        'label': np.random.randint(0, 2, 100)
    })
    
    # 2. Preprocessing
    print("Step 2: Preprocessing...")
    X = data[['feature1', 'feature2']]
    y = data['label']
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    # 3. Training
    print("Step 3: Training model...")
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    
    # 4. Evaluation
    print("Step 4: Evaluating model...")
    y_pred = model.predict(X_test)
    accuracy = accuracy_score(y_test, y_pred)
    print(f"Model Accuracy: {accuracy:.2f}")
    
    print("Pipeline completed successfully.")

if __name__ == "__main__":
    main()
ONYXIA_FILE_6a66311eeda3
mkdir -p "$(dirname "${WORK_DIR}/requirements.txt")"
cat > "${WORK_DIR}/requirements.txt" <<'ONYXIA_FILE_21ee2e566777'
scikit-learn
pandas
numpy
ONYXIA_FILE_21ee2e566777
mkdir -p "$(dirname "${WORK_DIR}/README.md")"
cat > "${WORK_DIR}/README.md" <<'ONYXIA_FILE_1834aa9c3b4b'
# Machine Learning Pipeline Skeleton

This project provides a basic skeleton for a machine learning pipeline using Python, scikit-learn, pandas, and numpy.

## Structure

- `src/main.py`: Main script containing the pipeline logic.
- `requirements.txt`: Python dependencies.

## Usage

Run the pipeline using:

```bash
python src/main.py
```

## Customization

- Replace the simulated data loading with your actual data source.
- Modify the preprocessing steps as needed.
- Swap the model with your preferred algorithm.
ONYXIA_FILE_1834aa9c3b4b

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install numpy pandas scikit-learn
if [ -f "${WORK_DIR}/requirements.txt" ]; then
  "${PYTHON_BIN}" -m pip install -r "${WORK_DIR}/requirements.txt"
fi

# Create a reusable launch helper.
mkdir -p "$(dirname "${WORK_DIR}/onyxia/run.sh")"
cat > "${WORK_DIR}/onyxia/run.sh" <<'ONYXIA_FILE_207d13ccc92c'
#!/usr/bin/env bash
set -euo pipefail
cd "${WORK_DIR}"
python src/main.py
ONYXIA_FILE_207d13ccc92c
chmod +x "${WORK_DIR}/onyxia/run.sh"

