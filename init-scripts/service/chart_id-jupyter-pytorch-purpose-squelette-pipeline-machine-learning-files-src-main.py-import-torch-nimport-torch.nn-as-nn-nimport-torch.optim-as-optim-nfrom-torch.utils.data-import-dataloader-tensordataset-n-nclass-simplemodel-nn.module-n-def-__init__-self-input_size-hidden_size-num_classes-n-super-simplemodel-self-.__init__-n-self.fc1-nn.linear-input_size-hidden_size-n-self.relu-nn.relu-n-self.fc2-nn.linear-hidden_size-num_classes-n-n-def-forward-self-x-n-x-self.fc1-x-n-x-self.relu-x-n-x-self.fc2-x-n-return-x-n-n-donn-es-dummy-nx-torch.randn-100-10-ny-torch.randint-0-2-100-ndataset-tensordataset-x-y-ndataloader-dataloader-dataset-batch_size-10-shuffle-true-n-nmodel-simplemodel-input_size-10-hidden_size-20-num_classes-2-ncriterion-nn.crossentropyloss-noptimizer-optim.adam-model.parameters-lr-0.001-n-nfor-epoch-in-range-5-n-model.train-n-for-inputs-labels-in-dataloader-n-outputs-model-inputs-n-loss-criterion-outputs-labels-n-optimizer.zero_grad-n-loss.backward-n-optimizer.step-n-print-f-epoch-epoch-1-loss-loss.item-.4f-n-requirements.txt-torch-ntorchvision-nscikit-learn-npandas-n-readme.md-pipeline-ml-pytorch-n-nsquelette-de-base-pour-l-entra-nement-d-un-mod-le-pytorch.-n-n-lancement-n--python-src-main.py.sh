#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id": "jupyter-pytorch", "purpose": "squelette pipeline machine learning", "files": {"src/main.py": "import torch\nimport torch.nn as nn\nimport torch.optim as optim\nfrom torch.utils.data import DataLoader, TensorDataset\n\nclass SimpleModel(nn.Module):\n    def __init__(self, input_size, hidden_size, num_classes):\n        super(SimpleModel, self).__init__()\n        self.fc1 = nn.Linear(input_size, hidden_size)\n        self.relu = nn.ReLU()\n        self.fc2 = nn.Linear(hidden_size, num_classes)\n\n    def forward(self, x):\n        x = self.fc1(x)\n        x = self.relu(x)\n        x = self.fc2(x)\n        return x\n\n# Données dummy\nX = torch.randn(100, 10)\ny = torch.randint(0, 2, (100,))\ndataset = TensorDataset(X, y)\ndataloader = DataLoader(dataset, batch_size=10, shuffle=True)\n\nmodel = SimpleModel(input_size=10, hidden_size=20, num_classes=2)\ncriterion = nn.CrossEntropyLoss()\noptimizer = optim.Adam(model.parameters(), lr=0.001)\n\nfor epoch in range(5):\n    model.train()\n    for inputs, labels in dataloader:\n        outputs = model(inputs)\n        loss = criterion(outputs, labels)\n        optimizer.zero_grad()\n        loss.backward()\n        optimizer.step()\n    print(f'Epoch {epoch+1}, Loss: {loss.item():.4f}')\n", "requirements.txt": "torch\ntorchvision\nscikit-learn\npandas\n", "README.md": "# Pipeline ML PyTorch\n\nSquelette de base pour l'entraînement d'un modèle PyTorch.\n\n## Lancement\n- `python src/main.py`"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
