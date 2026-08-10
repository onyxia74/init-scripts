#!/bin/bash
# Script d'initialisation pour préparer un environnement de dev

# Création de la structure de projet
mkdir -p /home/onyxia/work/mon_projet/src
mkdir -p /home/onyxia/work/mon_projet/data

# Création d'un fichier Python exemple
cat <<EOF > /home/onyxia/work/mon_projet/src/main.py
import time

def main():
    print("Application démarrée...")
    while True:
        print("Le code est en cours d'exécution. Modifiez le fichier pour voir les changements.")
        time.sleep(10)

if __name__ == '__main__':
    main()
EOF

# Création d'un fichier requirements.txt
cat <<EOF > /home/onyxia/work/mon_projet/requirements.txt
pandas
numpy
EOF

# Installation des dépendances
pip install -r /home/onyxia/work/mon_projet/requirements.txt

# Création d'un README
cat <<EOF > /home/onyxia/work/mon_projet/README.md
# Mon Projet Onyxia

Pour mettre à jour l'application :
1. Modifiez le code dans \`src/main.py\`.
2. Redémarrez le processus dans le terminal.
EOF
