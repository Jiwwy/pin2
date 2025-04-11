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

echo "Instalación completa. Cierra sesión y vuelve a iniciarla para usar Docker sin sudo."
docker --version
