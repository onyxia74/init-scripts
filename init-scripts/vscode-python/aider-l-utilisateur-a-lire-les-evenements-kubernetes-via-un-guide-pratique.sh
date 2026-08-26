#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: aider l'utilisateur a lire les evenements kubernetes via un guide pratique
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/K8S_GUIDE.md")"
cat > "${WORK_DIR}/K8S_GUIDE.md" <<'ONYXIA_FILE_4443be2c4eb0'
# Guide de lecture des événements Kubernetes

Pour lire les événements associés à votre service dans Onyxia, utilisez le terminal intégré de VS Code et exécutez les commandes suivantes :

### 1. Lister les événements récents
```bash
kubectl get events --sort-by='.lastTimestamp'
```

### 2. Filtrer les événements par votre namespace
Les services Onyxia tournent dans votre propre namespace. Pour voir uniquement les événements de votre espace :
```bash
kubectl get events -n $NAMESPACE
```

### 3. Voir les détails d'un événement spécifique
Si vous voyez un événement suspect (ex: `FailedScheduling` ou `BackOff`), récupérez son nom et faites :
```bash
kubectl describe event <nom-de-l-evenement>
```

### 4. Surveiller les événements en temps réel
```bash
kubectl get events -w
```

**Note :** Vos permissions sont limitées au rôle `view` sur votre namespace pour garantir la sécurité de la plateforme.
ONYXIA_FILE_4443be2c4eb0

