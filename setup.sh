#!/bin/bash

# Dar permisos de ejecución a los archivos TerrariaServer y TerrariaServer.bin.x86_64
chmod +x /content/terraria-server/1449/Linux/TerrariaServer
chmod +x /content/terraria-server/1449/Linux/TerrariaServer.bin.x86_64

# Verificar la ubicación de los archivos de configuración del servidor
echo "Archivos en el directorio /content/terraria-server/1449/Linux/:"
ls -l /content/terraria-server/1449/Linux/

# Iniciar el servidor de Terraria
cd /content/terraria-server/1449/Linux
./TerrariaServer  -config serverconfig.txt
