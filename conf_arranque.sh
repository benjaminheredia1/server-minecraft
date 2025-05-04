#!/bin/bash

LOGFILE="server-crash.log"

while true; do
  echo "Iniciando servidor: $(date)" >> $LOGFILE
  java -Xmx11G -Xms11G -jar fabric-server-launch.jar nogui 2>> $LOGFILE
  EXIT_CODE=$?
  
  if [ $EXIT_CODE -eq 0 ]; then
    echo "Servidor cerrado normalmente. Saliendo." >> $LOGFILE
    break
  else
    echo "Servidor falló con código $EXIT_CODE. Reiniciando en 10 segundos..." >> $LOGFILE
    sleep 10
  fi
done
