#!/bin/bash

# Instalar requisitos
apt-get update
apt-get install -y wget unzip git

# Clonar el repositorio
git clone https://github.com/Iceheop/terraria-server /content/terraria-server

# Configurar Ngrok para el túnel
cd /content/terraria-server
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok.zip
unzip ngrok.zip

# Verificar si el authtoken ya está configurado
if ! grep -q "authtoken" ~/.ngrok2/ngrok.yml; then
  ./ngrok authtoken usr_2tMKqklCG6ltxRPQb2SdWkIcpl4
fi

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria
cd /content/terraria-server/1436/Linux
nohup ./TerrariaServer -config serverconfig.txt &

# Esperar unos segundos para que el servidor se inicie
sleep 10

# Iniciar el túnel Ngrok para el puerto 7777 desde el repositorio
cd /content/terraria-server
nohup ./ngrok tcp 7777 --region eu &

# Esperar unos segundos para que Ngrok establezca el túnel
sleep 10

# Mostrar el estado del túnel Ngrok
curl -s http://localhost:4040/api/tunnels | grep -o "tcp://0.tcp.ngrok.io:[0-9]*"
