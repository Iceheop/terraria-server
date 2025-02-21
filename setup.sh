#!/bin/bash

# Instalar requisitos
apt-get update
apt-get install -y wget unzip git

# Configurar Ngrok para el túnel
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip
unzip ngrok.zip
./ngrok authtoken cr_2tMKqeDiV4vCIvTXzej5z6mBDvs

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria
cd /content/terraria-server/1436/Linux
./TerrariaServer -config serverconfig.txt
