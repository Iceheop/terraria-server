#!/bin/bash

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1436/Linux/TerrariaServer
chmod +x /content/terraria-server/1436/Linux/TerrariaServer.bin.x86_64

# Verificar la ubicación de los archivos de configuración del servidor
echo "Archivos en el directorio /content/terraria-server/1436/Linux/:"
ls -l /content/terraria-server/1436/Linux/

# Iniciar el servidor de Terraria
echo "Iniciando el servidor de Terraria..."
cd /content/terraria-server/1436/Linux
./TerrariaServer -port 7777 -autocreate 2 -secure &

# Mensaje final
echo "Proceso completado."
