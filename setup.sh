#!/bin/bash

# Instalar requisitos
apt-get update
apt-get install -y wget unzip git

# Descargar y configurar Ngrok para el túnel
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O /content/ngrok.zip
if [ $? -eq 0 ]; then
  unzip /content/ngrok.zip -d /content
  /content/ngrok authtoken 2tMhLL2jNo19p4V5BElz3VD4rCY_3Qga6TALLho6TNWSzVkGr
else
  echo "Error: No se pudo descargar Ngrok."
  exit 1
fi

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria y crear un mundo por defecto
cd /content/terraria-server/1436/Linux
./TerrariaServer -config /content/terraria-server/1436/Linux/serverconfig.txt &

if [ $? -eq 0 ]; then
  echo "El servidor de Terraria se ha iniciado correctamente."
else
  echo "Error: No se pudo iniciar el servidor de Terraria."
  exit 1
fi
