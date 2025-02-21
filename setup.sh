#!/bin/bash

# Instalar requisitos
apt-get update
apt-get install -y wget unzip git

# Clonar el repositorio de GitHub
git clone https://github.com/tu_usuario/tu_repositorio.git /content/terraria-server

# Configurar Ngrok para el túnel
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip
unzip ngrok.zip
./ngrok authtoken cr_2tMKqeDiV4vCIvTXzej5z6mBDvs

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria
cd /content/terraria-server/1436/Linux
./TerrariaServer -config serverconfig.txt &

# Exponer el puerto del servidor con Ngrok y obtener la URL pública
./ngrok tcp 7777 &

# Esperar unos segundos para que Ngrok se inicie y obtener la URL pública
sleep 5
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -o '"public_url":"tcp:[^"]*' | sed 's/"public_url":"tcp:\/\///')

echo "Tu servidor de Terraria está disponible en la URL pública: $NGROK_URL"
