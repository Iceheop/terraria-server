# Servidor dedicado de Terraria 

Este repositorio contiene los archivos necesarios para configurar y ejecutar un servidor dedicado de Terraria.

### **Estructura del proyecto**
1. Archivos Principales
   ```text
   /
   ├── 1436/
   │   └── Linux/
   │       ├── lib64/...
   │       └── Terraria/
   │           └── Worlds/...
   │       ├── Terrariaserver.exe
   │       └── Terrariaserver.bin.x86_64.exe
   ├── README.md
   └── setup.sh
   ```

### **Configuración** 

Para el proyecto vas a nesitar crear una cuenta en **pinggy.io** y **Google colab**.

### **Google Colab**
1. Primer Bloque de codigo

   ```py
   # Conectar con google drive para guardar el cuaderno
   from google.colab import drive
   drive.mount('/content/drive')
   # Clonar el repositorio de GitHub
   !git clone https://github.com/tu_usuario/terraria-server.git /content/terraria-server
   ```
1. Segundo Bloque de codigo

   ```py
   # Ejecutar el script setup.sh
   !bash /content/terraria-server/setup.sh
   ```