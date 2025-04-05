# 🐳 Docker ComfyUI

This is a simple docker image for ComfyUI application.

## Usage

**Clone this repository**

```bash
git clone https://github.com/XavierBeheydt/docker-comfyui
cd docker-comfyui
```

**Pull fronm Docker HUB**

```bash
docker pull xavierbeheydt/docker-comfyui:<tag>
```

**Building the image**

```bash
docker build .
```

**Run the image**

```bash
docker run -p 8188:8188 --gpus all -it --rm xavierbeheydt/docker-comfyui:latest
```

## Links

- [Docker HUB](https://hub.docker.com/repository/docker/xavierbeheydt/docker-comfyui)
- [GitHub repo](https://github.com/XavierBeheydt/docker-comfyui)