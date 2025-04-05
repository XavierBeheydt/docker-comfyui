# 🐳 Docker ComfyUI

This is a simple docker image for ComfyUI application.

## Usage

**Clone this repository**

```bash
git clone https://github.com/XavierBeheydt/docker-comfyui
cd docker-comfyui
```

**Building the image**

```bash
docker build .
```

**Run the image**

```bash
docker run -p 8188:8188 --gpus all -it --rm xavierbeheydt/docker-comfyui:latest
