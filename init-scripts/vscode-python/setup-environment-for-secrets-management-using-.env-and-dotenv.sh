#!/bin/bash
# Script to prepare a Python environment for secrets management

# Create a directory for the project
mkdir -p /home/onyxia/work/secrets_demo
cd /home/onyxia/work/secrets_demo

# Create a dummy .env file for demonstration
echo 'API_KEY=sk-test-123456789' > .env
echo 'DB_PASSWORD=supersecretpassword' >> .env

# Create a Python script to demonstrate loading secrets
cat <<EOF > main.py
import os
from dotenv import load_dotenv

# Load variables from .env
load_dotenv()

api_key = os.getenv('API_KEY')
db_pass = os.getenv('DB_PASSWORD')

print('--- Secrets Management Demo ---')
if api_key:
    print(f'✅ API_KEY loaded: {api_key[:5]}***')
else:
    print('❌ API_KEY not found')

if db_pass:
    print(f'✅ DB_PASSWORD loaded: {db_pass[:3]}***')
else:
    print('❌ DB_PASSWORD not found')
EOF

# Create a requirements.txt
echo 'python-dotenv' > requirements.txt

# Install dependencies
pip install -r requirements.txt
