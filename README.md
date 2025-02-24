# Servidor dedicado de Terraria 

Este repositorio contiene los archivos necesarios para configurar y ejecutar un servidor dedicado de Terraria.

### **Estructura del proyecto**
1. Archivos Principales
   ```text
   /
   ├── 1449/
   │   └── Linux/
   │       ├── lib64/...
   │       ├── Terrariaserver.exe
   │       └── Terrariaserver.bin.x86_64.exe
   ├── README.md
   └── setup.sh
   ```

### **Configuración** 

Para el proyecto vas a nesitar crear una cuenta en **pinggy.io** y **Google colab**.

### **Google Colab**
1. Primer Bloque de codigo

   ```py
   # Montar Google Drive
   from google.colab import drive
   drive.mount('/content/drive')

   # Clonar el repositorio de GitHub
   !git clone https://github.com/Iceheop/terraria-server /content/terraria-server
   ```
1. Segundo Bloque de codigo

   ```py
   import threading
   import time

   def create_tunnel():
      # Asegúrate de que estés en el directorio correcto
      %cd /content/terraria-server

      # Descargar Pinggy CLI si aún no lo has hecho
      !wget https://s3.ap-south-1.amazonaws.com/public.pinggy.binaries/cli/v0.1.6/linux/amd64/pinggy -O pinggy
      !chmod +x ./pinggy

      # Iniciar un nuevo túnel TCP en el puerto 7777 (puerto por defecto de Terraria) usando SSH y guardar la salida en pinggy.log
      !ssh -p 443 -R0:localhost:7777 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 TU-LLAVE-DE-AUTENTIFICACIÓN+tcp@a.pinggy.io > pinggy.log &

      # Esperar unos segundos para que Pinggy se inicie y genere la URL
      time.sleep(5)

      # Mostrar la URL del túnel en la consola
      print("Contenido del archivo pinggy.log:")
      !cat pinggy.log

   def setup_server():
      # Ejecutar el script setup.sh
      !bash /content/terraria-server/setup.sh

   # Crear hilos para cada tarea
   tunnel_thread = threading.Thread(target=create_tunnel)
   setup_thread = threading.Thread(target=setup_server)

   # Iniciar ambos hilos
   tunnel_thread.start()
   setup_thread.start()

   # Esperar a que ambos hilos terminen
   tunnel_thread.join()
   setup_thread.join()
   ```
### **Subir un mundo existente** 
> [!IMPORTANT]  
> Debes haber creado un mundo de prueva primero para que se pueda generar las carpetas de los mundos.

1. Subir el archivod del mundo con este script
   ```py
   from google.colab import files

   # Subir el archivo desde tu equipo
   uploaded = files.upload()

   # Verificar la subida del archivo
   for filename in uploaded.keys():
      print('Archivo subido: {filename}')
   ```
1. Mover el archivo del mundo con este script
   ```py
   # Mover el archivo subido a la ubicación deseada
   for filename in uploaded.keys():
      !mv {filename} /root/.local/share/Terraria/Worlds/

   # Verificar que el archivo se ha movido correctamente
   !ls -l /root/.local/share/Terraria/Worlds/
   ```