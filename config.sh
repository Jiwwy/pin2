#!/bin/bash

echo "Actualizando sistema..."
sudo apt update -y && sudo apt upgrade -y

echo "Instalando dependencias..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common

echo "Agregando clave GPG de Docker..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Agregando repositorio de Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Instalando Docker..."
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "Iniciando Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Agregando usuario actual al grupo docker..."
sudo usermod -aG docker $USER

echo "Instalando Docker Compose (binario)..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Crear un directorio para la aplicación
mkdir -p /home/ubuntu

# Descargar el archivo docker-compose.yml
cd /home/ubuntu
sudo git clone https://github.com/Jiwwy/nginx-monitoring.git

# Crear Contenedores de monitoreo
cd /home/ubuntu/nginx-monitoring
docker-compose up -d --build



