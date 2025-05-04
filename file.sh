#!/bin/bash

mensaje="Este es un mensaje de prueba"

while true; do
    echo "$mensaje" > mensaje.txt
    echo "Mensaje escrito."

    sleep 1

    > mensaje.txt
    echo "Mensaje eliminado."

    sleep 1

    git add .
    git commit -m "Actualización automática"
    git push origin main

    sleep 200
done
