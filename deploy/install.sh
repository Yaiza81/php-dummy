#!/bin/bash

# Actualizar paquetes
sudo apt update && sudo apt upgrade -y

# Instalar Apache y PHP
sudo apt install -y apache2 php libapache2-mod-php

# Obtener la ruta actual del script
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Copiar el archivo de configuración de Apache
sudo cp "$SCRIPT_DIR/apache-vhost.conf" /etc/apache2/sites-available/000-default.conf

# Copiar el archivo index.php al directorio raíz del servidor web
sudo cp "$SCRIPT_DIR/../index.php" /var/www/html/index.php

# Reiniciar Apache
sudo systemctl restart apache2

echo "Despliegue completado"
