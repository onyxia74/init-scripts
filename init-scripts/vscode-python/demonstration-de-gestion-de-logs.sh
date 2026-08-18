#!/bin/bash
echo 'Démarrage de l'application de test...' > /home/onyxia/work/app.log

# Création d'un script Python qui écrit des logs dans un fichier
cat <<EOF > /home/onyxia/work/logger_app.py
import time
import datetime

log_file = '/home/onyxia/work/app.log'

print('Application logger lancée. Les logs sont écrits dans /home/onyxia/work/app.log')

with open(log_file, 'a') as f:
    f.write(f'[{datetime.datetime.now()}] Application démarrée\n')

try:
    while True:
        now = datetime.datetime.now().strftime('%H:%M:%S')
        message = f'[{now}] Log de test - Tout va bien\n'
        f.write(message)
        f.flush()
        print(f'Log écrit : {message.strip()}')
        time.sleep(10)
except KeyboardInterrupt:
    f.write(f'[{datetime.datetime.now()}] Application arrêtée\n')
EOF

# Commande pour lancer l'application en arrière-plan
python /home/onyxia/work/logger_app.py &
