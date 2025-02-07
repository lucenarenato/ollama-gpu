# ollama/ollama

## docker: Error response from daemon: could not select device driver "" with capabilities: [[gpu]]. AFTER installing nvidia-docker2

I have the same issue. I have noticed that, I did not installed 'NVIDIA Container Toolkit'. After installing the container toolkit, it works. The official instruction is available in : https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

```sh
sudo apt-get update && apt-get install -y --no-install-recommends \                                                                             
        dh-make \
        fakeroot \                                                                 
        build-essential \
        devscripts && \
    rm -rf /var/lib/apt/lists/*


curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey |sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
&& curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
&& sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

## Fonte:
- https://dev.to/ajeetraina/running-ollama-with-docker-compose-and-gpus-lkn
- https://hub.docker.com/r/ollama/ollama


```sh
docker run -d --gpus all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:latest
```


`docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama`

## Run LLMs locally or in Docker with Ollama & Ollama-WebUI
```sh
ollama pull mistral
   #    or 
ollama pull llama3
   # or 
ollama pull llama2 
```

## Generate a response
```sh
curl http://localhost:11434/api/generate -d '{
  "model": "llama3",
  "prompt":" Why is the colour of sea blue ?"
}'

```

## I. Ollama in a Docker container (CPU only)
```sh
docker run -d --name ollama -p 11434:11434 -v ollama_storage:/root/.ollama \
  ollama/ollama:latest
```

## II . Running Ollama & WebUI with docker compose
  ```sh
    git clone https://github.com/ollama-webui/ollama-webui
    cd ollama-webui
    docker compose up -d
```

## GPU Support (Optional)

```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# Configure NVIDIA Container Toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# Test GPU integration
docker run --gpus all nvidia/cuda:11.5.2-base-ubuntu20.04 nvidia-smi
```

## Prerequisites
Before using this extension, you need to:

## Install Ollama

## macOS/Linux:
`curl -fsSL https://ollama.com/install.sh | sh`

Windows: Download from Ollama's official website
Pull the DeepSeek model:

`ollama pull deepseek-r1:1.5b`

## Quick Start
Install the Extension

Open VS Code
Press Ctrl+P / Cmd+P
Run ext install your-publisher.deep-vscode

## Start Ollama

`ollama serve`

Extension Can't Connect to Ollama:

# Verify Ollama is running
`ollama serve`

# Check if model is installed
`ollama list`

# Pull model if not installed
`ollama pull deepseek-r1:1.5b`

## Use DeepSeek de Graça no VS Code (Testamos)

Video: https://www.youtube.com/watch?v=WRQCFU8nLsY&ab_channel=C%C3%B3digoFonteTV