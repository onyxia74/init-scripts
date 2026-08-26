#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-r-python-julia","purpose":"environnement R avec PostgreSQL","packages":["RPostgreSQL"],"files":{"connect.R":"library(RPostgreSQL)\n# Connexion à PostgreSQL\ncon <- dbConnect(PostgreSQL(),\n  host = 'postgresql-cnpg',\n  port = 5432,\n  dbname = 'defaultdb',\n  user = 'changeme',\n  password = 'changeme')\n\n# Exemple de requête\nresult <- dbGetQuery(con, 'SELECT version();')\nprint(result)\n\n# Fermeture de la connexion\ndbDisconnect(con)"),"README.md":"# Environnement R avec PostgreSQL\n\nCe projet permet de se connecter à une base de données PostgreSQL depuis R.\n\n## Utilisation\n\n1. Ouvrir le fichier `connect.R` dans VS Code.\n2. Exécuter le script pour tester la connexion.\n3. Modifier les paramètres de connexion si nécessaire.\n\n## Dépendances\n\n- RPostgreSQL (installé automatiquement)"}, "start_command":"Rscript connect.R"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
