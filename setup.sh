#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget unzip

# Descargar ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip
unzip ngrok.zip

chmod +x ./ngrok

# Configurar el authtoken de ngrok (reemplaza <YOUR_AUTH_TOKEN> con tu token real)
./ngrok authtoken usr_2tMKqklCG6ltxRPQb2SdWkIcpl4

# Iniciar un túnel TCP en el puerto 7777 (puerto por defecto de Terraria)
nohup ./ngrok tcp 7777 &

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria
cd /content/terraria-server/1436/Linux
./TerrariaServer -config serverconfig.txt

# Obtener la URL del túnel
./ngrok tcp 7777 --log=stdout > ngrok.log &
sleep 5  # Esperar unos segundos para que Ngrok se inicie y genere la URL

# Mostrar la URL
cat ngrok.log | grep -o 'tcp://.*'
