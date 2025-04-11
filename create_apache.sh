#!/bin/bash

echo "Actualizando paquetes..."
sudo apt update -y && sudo apt upgrade -y

echo "Instalando Apache HTTP Server..."
sudo apt install apache2 -y

echo "Habilitando y arrancando el servicio..."
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Permitiendo tráfico HTTP en el firewall (ufw)..."
sudo ufw allow 'Apache'
sudo ufw reload
