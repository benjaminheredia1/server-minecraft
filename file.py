import os
import time

# Mensaje a escribir y eliminar
mensaje = "Este es un mensaje de prueba"

# Bucle infinito
while True:
    try:
        # Simula escribir el mensaje en un archivo
        with open("mensaje.txt", "w") as f:
            f.write(mensaje)
        print("Mensaje escrito.")

        time.sleep(1)

        # Elimina el contenido del archivo
        open("mensaje.txt", "w").close()
        print("Mensaje eliminado.")

        time.sleep(1)

        # Ejecuta comandos git
        os.system("git add .")
        os.system('git commit -m "Actualización automática"')
        os.system("git push origin main")

        # Espera unos segundos antes de repetir
        time.sleep(200)

    except KeyboardInterrupt:
        print("Interrumpido por el usuario.")
        break
