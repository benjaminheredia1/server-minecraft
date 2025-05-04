#!/bin/bash

while true; do
# Iniciar el servidor en una sesión screen en segundo plano
java -Xmx11G -Xms11G -jar fabric-server-launch.jar nogui
done; 
# Esperar unos segundos para que el servidor inicie correctamente
sleep 10

