#!/bin/bash

# Iniciar el servidor en una sesión screen en segundo plano
java -Xmx11G -Xms11G -jar fabric-server-launch.jar nogui

# Esperar unos segundos para que el servidor inicie correctamente
sleep 10

# Bucle que envía el mensaje cada 5 minutos
while true; do
  screen -S mcserver -p 0 -X stuff "tellraw @a {\"text\":\"⚠ Laboratorio de Sistemas y Redes: Mantener el respeto 🚀\",\"color\":\"gold\"}$(printf '\r')"
  sleep 100
done
