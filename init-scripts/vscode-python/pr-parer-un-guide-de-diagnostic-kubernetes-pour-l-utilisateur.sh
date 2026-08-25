#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: préparer un guide de diagnostic Kubernetes pour l'utilisateur
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/diagnostics_guide.md")"
cat > "${WORK_DIR}/diagnostics_guide.md" <<'ONYXIA_FILE_5eeec240b069'
# Guide de Diagnostic Kubernetes

Pour lire les événements Kubernetes associés à votre service, utilisez les commandes suivantes dans le terminal :

### 1. Lister les événements récents
```bash
kubectl get events
```

### 2. Filtrer les événements pour votre Pod spécifique
Remplacez `<nom-de-votre-pod>` par le nom de votre pod (vous pouvez le trouver avec `kubectl get pods`) :
```bash
kubectl get events --field-selector involvedObject.name=<nom-de-votre-pod>
```

### 3. Voir les logs de votre conteneur
```bash
kubectl logs <nom-de-votre-pod>
```

### 4. Vérifier l'état des ressources
```bash
kubectl describe pod <nom-de-votre-pod>
```
ONYXIA_FILE_5eeec240b069

