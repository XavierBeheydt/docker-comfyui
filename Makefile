.DEFAULT_GOAL := all

# Utils ========================================================================
ifeq ($(OS), Windows_NT)
	WEB_BROWSER = powershell -Command Start-Process
	RM			= rm -Force
else
	WEB_BROWSER = open
	RM			= rm -rf
endif

# Commands =====================================================================
DOCKER			= docker
COMPOSE			= $(DOCKER) compose

# Variables ====================================================================
PROJECT_NAME 	?= docker-comfyui
CONTAINER_NAME	?= comfyui
TAG				?= latest
SERVICES 		?= comfyui
PORT			?= 8188

# Receipes =====================================================================
.PHONY: all
all: run

.PHONY: info
info:  ## Print selected services
	@echo Services selected : ${SERVICES}

.PHONY: run
run:  ## Run the service
run: info
	$(DOCKER) run -d\
		--gpus all \
		-p ${PORT}:8188 \
		-v ${COMFYUI_INPUT}:/comfyui/input \
		-v ${COMFYUI_OUTPUT}:/comfyui/output \
		-v ${COMFYUI_MODELS}:/comfyui/models \
		--name ${CONTAINER_NAME} \
		xavierbeheydt/docker-comfyui:${TAG}

.PHONY: start
start:  ## Start the service
start: info
	$(DOCKER) start ${CONTAINER_NAME}

.PHONY: stop
stop:  ## Stop the service
stop: info
	$(DOCKER) stop ${CONTAINER_NAME}

.PHONY: logs
logs:  ## Logs containers in the stack.
logs: info
	$(DOCKER) logs -f ${CONTAINER_NAME}

.PHONY: rm
rm:  ## Remove the container
rm: stop
	$(DOCKER) rm ${CONTAINER_NAME}