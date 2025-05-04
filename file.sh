#!/bin/bash

mensaje="Este es un mensaje de prueba"

while true; do
    echo "$mensaje" > mensaje.txt
    echo "Mensaje escrito."

    sleep 1

    > mensaje.txt
    echo "Mensaje eliminado."

    sleep 100

done
