#!/bin/bash
# Script d'initialisation pour cloner un dépôt GitHub
# L'utilisateur pourra modifier l'URL du dépôt dans le script ou via une variable

REPO_URL="https://github.com/votre-utilisateur/votre-projet.git"
TARGET_DIR="$HOME/work/mon-projet"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Clonage du dépôt : $REPO_URL"
  git clone "$REPO_URL" "$TARGET_DIR"
  cd "$TARGET_DIR"
  # Installation optionnelle de dépendances si requirements.txt existe
  if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
  fi
else
  echo "Le répertoire $TARGET_DIR existe déjà."
  cd "$TARGET_DIR"
fi
