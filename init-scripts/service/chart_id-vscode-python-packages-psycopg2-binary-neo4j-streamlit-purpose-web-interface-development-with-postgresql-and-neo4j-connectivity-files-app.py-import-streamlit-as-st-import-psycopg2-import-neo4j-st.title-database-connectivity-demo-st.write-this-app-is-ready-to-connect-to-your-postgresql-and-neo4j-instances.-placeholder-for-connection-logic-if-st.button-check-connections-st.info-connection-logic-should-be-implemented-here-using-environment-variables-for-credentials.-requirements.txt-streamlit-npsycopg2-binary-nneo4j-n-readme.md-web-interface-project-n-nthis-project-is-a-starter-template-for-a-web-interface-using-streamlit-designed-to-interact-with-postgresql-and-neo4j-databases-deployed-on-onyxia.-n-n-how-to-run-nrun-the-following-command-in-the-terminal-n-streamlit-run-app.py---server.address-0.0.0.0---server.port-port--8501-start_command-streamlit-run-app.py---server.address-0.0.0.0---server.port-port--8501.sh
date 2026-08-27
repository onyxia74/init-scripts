#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["psycopg2-binary","neo4j","streamlit"],"purpose":"web interface development with PostgreSQL and Neo4j connectivity","files":{"app.py":"import streamlit as st
import psycopg2
import neo4j

st.title('Database Connectivity Demo')

st.write('This app is ready to connect to your PostgreSQL and Neo4j instances.')

# Placeholder for connection logic
if st.button('Check Connections'):
    st.info('Connection logic should be implemented here using environment variables for credentials.')
","requirements.txt":"streamlit\npsycopg2-binary\nneo4j\n","README.md":"# Web Interface Project\n\nThis project is a starter template for a web interface using Streamlit, designed to interact with PostgreSQL and Neo4j databases deployed on Onyxia.\n\n## How to run\nRun the following command in the terminal:\n`streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}`"},
"start_command":"streamlit run app.py --server.address=0.0.0.0 --server.port=${PORT:-8501}"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
