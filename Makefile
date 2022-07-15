PWD = $(shell pwd)
PORT_HOST = 3333
PORT_CONTAINER = 3333
NODE-IMAGE = node:lts-slim
PKG_MANAGER = yarn

.PHONY: dev
dev:
	docker run --rm -it \
		-p $(PORT_HOST):$(PORT_CONTAINER) \
		--name "vite-vue-ts" \
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
