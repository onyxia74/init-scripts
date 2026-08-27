#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: Connecter Python à PostgreSQL Onyxia
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/connect_postgres.py")"
cat > "${WORK_DIR}/connect_postgres.py" <<'ONYXIA_FILE_bacb7384d436'
#!/usr/bin/env python
"""
Script de connexion à PostgreSQL sur Onyxia.

Ce script illustre comment se connecter à un service PostgreSQL
déployé sur la plateforme Onyxia.

Variables d'environnement attendues (gérées par Onyxia) :
- DATABASE_URL : URL de connexion complète (ex: postgresql://user:pass@host:port/db)
- POSTGRESQL_HOST, POSTGRESQL_PORT, POSTGRESQL_USER, POSTGRESQL_PASSWORD
"""
import os
from sqlalchemy import create_engine, text
import pandas as pd

def get_postgres_connection():
    """
    Établit une connexion à PostgreSQL en utilisant les variables d'environnement Onyxia.
    """
    # Essayer d'abord la variable standard DATABASE_URL
    db_url = os.environ.get('DATABASE_URL')
    
    if not db_url:
        # Fallback : construire l'URL à partir des variables individuelles
        host = os.environ.get('POSTGRESQL_HOST', 'localhost')
        port = os.environ.get('POSTGRESQL_PORT', '5432')
        user = os.environ.get('POSTGRESQL_USER', 'postgres')
        password = os.environ.get('POSTGRESQL_PASSWORD', '')
        database = os.environ.get('POSTGRESQL_DATABASE', 'postgres')
        
        if host == 'localhost' and not password:
            print("Attention : Les variables d'environnement PostgreSQL ne semblent pas configurées.")
            print("Assurez-vous d'avoir déployé un service PostgreSQL sur Onyxia.")
            print("Variables disponibles :", [k for k in os.environ.keys() if 'POSTGRES' in k or 'DATABASE' in k])
            return None
            
        db_url = f"postgresql://{user}:{password}@{host}:{port}/{database}"
    
    try:
        engine = create_engine(db_url)
        with engine.connect() as conn:
            result = conn.execute(text("SELECT version();"))
            version = result.fetchone()[0]
            print(f"Connexion réussie ! Version PostgreSQL : {version}")
        return engine
    except Exception as e:
        print(f"Erreur de connexion : {e}")
        return None

if __name__ == "__main__":
    print("--- Test de connexion PostgreSQL ---")
    engine = get_postgres_connection()
    if engine:
        print("Prêt à exécuter des requêtes SQL.")
        # Exemple : créer une table et insérer des données
        # with engine.connect() as conn:
        #     conn.execute(text("CREATE TABLE IF NOT EXISTS test (id SERIAL PRIMARY KEY, name VARCHAR(50));"))
        #     conn.execute(text("INSERT INTO test (name) VALUES ('Onyxia');"))
        #     conn.commit()
        #     print("Données insérées avec succès.")
    else:
        print("Impossible de se connecter. Vérifiez vos variables d'environnement.")
ONYXIA_FILE_bacb7384d436

# Install Python packages.
PYTHON_BIN="${PYTHON_BIN:-python}"
if ! command -v "${PYTHON_BIN}" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi
"${PYTHON_BIN}" -m pip install pandas sqlalchemy psycopg2-binary

