PWD = $(shell pwd)
PORT_HOST = 3333
PORT_CONTAINER = 3333
NODE-IMAGE = node:lts-slim
PKG_MANAGER = yarn
CONTAINER_NAME = vite-vue-ts

%:
	@:

.PHONY: dev
dev:
	docker run --rm -it \
		-p $(PORT_HOST):$(PORT_CONTAINER) \
		--name $(CONTAINER_NAME) \
		-u "node" \
		-w /home/node/app \
		-v $(PWD):/home/node/app \
		$(NODE-IMAGE) \
		$(PKG_MANAGER) dev

.PHONY: install
install:
	docker run --rm -it \
		-u "node" \
		-w /home/node/app \
		-v $(PWD):/home/node/app \
		$(NODE-IMAGE) \
		$(PKG_MANAGER) install

.PHONY: bash
bash:
	docker exec -it $(CONTAINER_NAME) bash

.PHONY: add_dev_deps
add_dev_deps:
	docker exec -it $(CONTAINER_NAME) $(PKG_MANAGER) add $(filter-out $@,$(MAKECMDGOALS)) --dev

.PHONY: add_deps
add_deps:
	docker exec -it $(CONTAINER_NAME) $(PKG_MANAGER) add $(filter-out $@,$(MAKECMDGOALS))

.PHONY: rm_deps
rm_deps:
	docker exec -it $(CONTAINER_NAME) $(PKG_MANAGER) remove $(filter-out $@,$(MAKECMDGOALS))
