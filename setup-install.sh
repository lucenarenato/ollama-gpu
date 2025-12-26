#!/bin/bash
set -e

function install_nvidia_container_toolkit() {
  echo "Instalando NVIDIA Container Toolkit..."
  sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
  sudo nvidia-ctk runtime configure --runtime=docker
  sudo systemctl restart docker
  echo "NVIDIA Container Toolkit instalado."
}

echo "Verificando se o Docker está instalado..."
if ! command -v docker &> /dev/null; then
  echo "Docker não encontrado. Instale o Docker antes de executar esse script."
  exit 1
fi

if [[ "$1" == "--gpu" ]]; then
  echo "Modo GPU solicitado."
  install_nvidia_container_toolkit
fi

echo "Executando o container Docker do Ollama..."
if [[ "$1" == "--gpu" ]]; then
  docker run -d --gpus all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:latest
else
  docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:latest
fi

echo "Container Ollama configurado com sucesso!"