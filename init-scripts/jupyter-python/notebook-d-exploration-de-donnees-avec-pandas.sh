#!/usr/bin/env bash
set -euo pipefail

# This init script prepares jupyter-python on Onyxia.
# Purpose: notebook d'exploration de donnees avec pandas
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/exploration.ipynb")"
cat > "${WORK_DIR}/exploration.ipynb" <<'ONYXIA_FILE_a725ec298a63'
{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Exploration de données"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "source": [
    "import pandas as pd\n",
    "\n",
    "# Charger les données (exemple avec un fichier CSV local)\n",
    "# Remplacez 'votre_fichier.csv' par le chemin de votre fichier\n",
    "try:\n",
    "    df = pd.read_csv('votre_fichier.csv')\n",
    "    print('Données chargées avec succès.')\n",
    "    display(df.head())\n",
    "    display(df.info())\n",
    "except FileNotFoundError:\n",
    "    print('Fichier non trouvé. Veuillez uploader un fichier CSV dans le dossier de travail.')"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "name": "python",
   "version": "3.11.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
ONYXIA_FILE_a725ec298a63

