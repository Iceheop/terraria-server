#!/bin/bash

# Instalar requisitos
apt-get update
apt-get install -y wget unzip git

# Clonar el repositorio de GitHub
git clone https://github.com/tu_usuario/tu_repositorio.git /content/terraria-server

# Descargar y configurar Ngrok para el túnel
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O /content/ngrok.zip
unzip /content/ngrok.zip -d /content
/content/ngrok authtoken cr_2tMKqeDiV4vCIvTXzej5z6mBDvs

# Descargar el mundo Venesuela_chamo.wld
wget https://github.com/Iceheop/terraria-server/raw/main/1436/Linux/Terraria/Worlds/Venesuela_chamo.wld -O /content/terraria-server/1436/Linux/Terraria/Worlds/Venesuela_chamo.wld

# Verificar si el mundo se descargó correctamente
if [ -f /content/terraria-server/1436/Linux/Terraria/Worlds/Venesuela_chamo.wld ]; then
    echo "El mundo se descargó correctamente."
else
    echo "Error: El mundo no se descargó correctamente."
    exit 1
fi

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria con el mundo descargado
cd /content/terraria-server/1436/Linux
./TerrariaServer -world /content/terraria-server/1436/Linux/Terraria/Worlds/Venesuela_chamo.wld &

# Exponer el puerto del servidor con Ngrok y obtener la URL pública
/content/ngrok tcp 7777 &

# Esperar unos segundos para que Ngrok se inicie y obtener la URL pública
sleep 5
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | grep -o '"public_url":"tcp:[^"]*' | sed 's/"public_url":"tcp:\/\///')

echo "Tu servidor de Terraria está disponible en la URL pública: $NGROK_URL"
