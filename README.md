# Servidor dedicado de Terraria 

Este repositorio contiene los archivos necesarios para configurar y ejecutar un servidor dedicado de Terraria.

### **Estructura del proyecto**
1. Archivos Principales
   ```text
   /
   ├── 1436/
   │   └── Linux/
   │       ├── lib64/...
   │       └── Terraria/
   │           └── Worlds/...
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
   # Asegúrate de que estés en el directorio correcto
   %cd /content/terraria-server

   # Descargar Pinggy CLI si aún no lo has hecho
   !wget https://s3.ap-south-1.amazonaws.com/public.pinggy.binaries/cli/v0.1.6/linux/amd64/pinggy -O pinggy
   !chmod +x ./pinggy

   # Iniciar un túnel TCP en el puerto 7777 (puerto por defecto de Terraria) usando SSH y guardar la salida en pinggy.log
   !ssh -p 443 -R0:localhost:7777 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 kivN2ksFlxz+tcp@a.pinggy.io --force > pinggy.log &

   # Esperar unos segundos para que Pinggy se inicie y genere la URL
   import time
   time.sleep(5)

   # Mostrar la URL del túnel en la consola
   print("Contenido del archivo pinggy.log:")
   !cat pinggy.log

   # Mostrar solo la URL del túnel
   print("URL del túnel generado por Pinggy:")
   !cat pinggy.log | grep -o 'tcp://.*'
   ```
1. Segundo Bloque de codigo

   ```py
   # Ejecutar el script setup.sh
   !bash /content/terraria-server/setup.sh
   ```