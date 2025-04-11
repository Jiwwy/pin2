#!/bin/bash

  # Actualizar los paquetes existentes
  sudo yum update -y

  # Instalar Docker usando amazon-linux-extras
  sudo amazon-linux-extras install docker -y

  # Iniciar el servicio Docker
  sudo service docker start

  # Habilitar Docker para que inicie con el sistema
  sudo systemctl enable docker

  # Agregar el usuario ec2-user al grupo docker
  sudo usermod -aG docker ec2-user
