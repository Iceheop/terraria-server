#!/bin/bash

# Actualizar y instalar wget y unzip si no están instalados
sudo apt-get update
sudo apt-get install -y wget unzip

# Descargar Pinggy CLI
wget https://pinggy.io/linux/pinggy -O pinggy
chmod +x ./pinggy

# Iniciar un túnel TCP en el puerto 7777 (puerto por defecto de Terraria) y guardar la salida en pinggy.log
./pinggy tcp 7777 --token kivN2ksFlxz > pinggy.log &

# Esperar unos segundos para que Pinggy se inicie y genere la URL
sleep 5

# Mostrar la URL del túnel en la consola
cat pinggy.log | grep -o 'tcp://.*'

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Iniciar el servidor de Terraria
cd /content/terraria-server/1436/Linux
./TerrariaServer -config serverconfig.txt
