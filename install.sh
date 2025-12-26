#!/bin/bash

# Atualize os repositórios e instale as dependências necessárias
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicione a chave oficial do Docker à sua lista de chaves confiáveis do sistema operacional
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adicione o repositório oficial do Docker às fontes de pacotes
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualize novamente os repositórios e instale o Docker Engine
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Baixe a última versão do Docker Compose (se não estiver instalado)
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Dê permissão de execução ao arquivo executável docker-compose
sudo chmod +x /usr/local/bin/docker-compose