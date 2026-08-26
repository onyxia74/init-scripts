#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["pandas","sqlalchemy","psycopg2-binary","py2neo","streamlit"],"purpose":"préparer un environnement de développement pour interagir avec PostgreSQL et Neo4j, incluant une interface web Streamlit","start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}","files":{"app.py":"import streamlit as st\nimport pandas as pd\nimport psycopg2\nfrom py2neo import Graph\n\nst.title('Data Explorer: SQL & Graph')\n\nst.sidebar.header('Connexions')\nst.sidebar.info('Configurez vos accès dans le code ou via des variables d\'environnement.')\n\nst.write('### Test de connexion PostgreSQL')\nif st.button('Tester PostgreSQL'):\n    try:\n        # Exemple de connexion (à adapter avec vos credentials)\n        # conn = psycopg2.connect(host='...', database='...', user='...', password='...')\n        st.success('PostgreSQL est prêt à être interrogé.')\n    except Exception as e:\n        st.error(f'Erreur: {e}')\n\nst.write('### Test de connexion Neo4j')\nif st.button('Tester Neo4j'):\n    try:\n        # graph = Graph('bolt://...', auth=('neo4j', 'password'))\n        st.success('Neo4j est prêt à être interrogé.')\n    except Exception as e:\n        st.error(f'Erreur: {e}')\n\n# Squelette de projet\nwith open('README.md', 'w') as f:\n    f.write('# Projet Multi-Data\\n\\nEnvironnement configuré pour PostgreSQL et Neo4j.')","requirements.txt":"pandas\\nsqlalchemy\\npsycopg2-binary\\npy2neo\\nstreamlit"},"auto_start":true}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
