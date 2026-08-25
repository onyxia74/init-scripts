#!/bin/bash
# Script pour simuler la génération de logs
echo "[INFO] Application démarrée" > /home/onyxia/work/app.log
while true; do
  echo "[$(date)] Log entry: Application is running smoothly..." >> /home/onyxia/work/app.log
  sleep 5
done
