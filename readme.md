# ollama/ollama

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