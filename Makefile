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
PROJECT_NAME 	?= comfyui
SERVICES 		?= app

COMPOSE_FILES	?= -f docker-compose.yml

# Receipes =====================================================================
.PHONY: all
all: up start

.PHONY: info
info:  ## Print selected services
	@echo Services selected : ${SERVICES}

.PHONY: up
up:  ## Up all services
up: info
	$(COMPOSE) ${COMPOSE_FILES} up -d ${SERVICES}

.PHONY: down
down:  ## Down all services
down: info
	$(COMPOSE) ${COMPOSE_FILES} down ${SERVICES}

.PHONY: start
start:  ## Start all services
start: info
	$(COMPOSE) ${COMPOSE_FILES} start ${SERVICES}

.PHONY: stop
stop:  ## Stop all services
stop: info
	$(COMPOSE) ${COMPOSE_FILES} stop ${SERVICES}

.PHONY: restart 
restart: stop start

.PHONY: logs
logs:  ## Logs containers in the stack.
logs: info
	$(COMPOSE) ${COMPOSE_FILES} logs -f ${SERVICES}

.PHONY: install/manager
install/manager:
	$(COMPOSE) exec app git clone https://github.com/ltdrdata/ComfyUI-Manager /comfyui/custom_nodes/comfyui-manager