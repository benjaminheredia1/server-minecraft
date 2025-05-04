#!/bin/bash
echo "Iniciando túnel Playit en screen 'playit'..."
screen -dmS playit ./playit-linux-amd64

# Bucle para mantener activo el entorno
while true; do
  curl -s https://www.google.com > /dev/null
  curl -s https://github.com > /dev/null
  sleep 300
done



