#!/bin/bash
# Script pour démontrer la persistance
echo 'Initialisation du dossier de travail' > /home/onyxia/work/README.md
mkdir -p /home/onyxia/work/data
touch /home/onyxia/work/data/test_file.txt
echo 'Ceci est un fichier de test pour vérifier la persistance' > /home/onyxia/work/data/test_file.txt
