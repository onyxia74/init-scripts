#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["pandas","psycopg2","py2neo","streamlit"],"purpose":"interface web pour PostgreSQL et Neo4j","files":{"app.py":"import streamlit as st
import pandas as pd
import psycopg2
from py2neo import Graph

st.title('Connexion Bases de Données')

st.subheader('PostgreSQL')
st.info('Connectez-vous à votre instance PostgreSQL via psycopg2')

st.subheader('Neo4j')
st.info('Connectez-vous à votre instance Neo4j via py2neo')

if st.button('Tester les connexions'):
    st.write('Fonctionnalité de test en cours de développement...')
"},"start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
