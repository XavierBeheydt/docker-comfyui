FROM python:3.12-bullseye
ARG COMFYUI_VERSION=v0.3.27
ARG APP_DIR=/comfyui
ARG DEFAULT_PORT=8188

LABEL description="A basic docker image for ComfyUI."
LABEL version="0.1.0"

WORKDIR ${APP_DIR}

RUN git clone -b ${COMFYUI_VERSION} https://github.com/comfyanonymous/ComfyUI.git ${APP_DIR}
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu126
RUN grep -v 'torchaudio\|torchvision' requirements.txt > temp_requirements.txt
RUN pip install -r temp_requirements.txt

EXPOSE ${DEFAULT_PORT}

VOLUME /${APP_DIR}/models
VOLUME /${APP_DIR}/custom_nodes

ENTRYPOINT ["python", "main.py", "--listen"]