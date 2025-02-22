#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget unzip

# Descargar ngrok versión 3.6.0 o superior
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -O ngrok.tgz
tar -xvzf ngrok.tgz

chmod +x ./ngrok

# Configurar el authtoken de ngrok (reemplaza <YOUR_AUTH_TOKEN> con tu token real)
./ngrok authtoken 2tMKqeDiV4vCIvTXzej5z6mBDvs_6tYfcBSfopmd3sQ6XFqn5

# Iniciar un túnel TCP en el puerto 7777 (puerto por defecto de Terraria) y guardar la salida en ngrok.log
./ngrok tcp 7777 --log=stdout > ngrok.log &

# Esperar unos segundos para que Ngrok se inicie y genere la URL
sleep 5

# Mostrar la URL del túnel en la consola
cat ngrok.log | grep -o 'tcp://.*'

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria
cd /content/terraria-server/1436/Linux
./TerrariaServer -config serverconfig.txt
