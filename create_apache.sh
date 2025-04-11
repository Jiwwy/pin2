  #! /bin/bash
  # Actualizar el sistema
  sudo apt update -y
  sudo apt upgrade -y

  # Instalar dependencias necesarias
  sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

  # Agregar la clave GPG oficial de Docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  # Agregar el repositorio de Docker
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  # Actualizar los repositorios
  sudo apt update -y

  # Instalar Docker CE
  sudo apt install docker-ce -y

  # Iniciar el servicio Docker
  sudo systemctl start docker

  # Habilitar Docker para que inicie con el sistema
  sudo systemctl enable docker

  # Agregar el usuario al grupo docker
  sudo usermod -aG docker $(whoami)
