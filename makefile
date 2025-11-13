.PHONY: docker
docker:
	@echo "Building..."
	@docker compose build
	@echo "Pushing..."
	@docker compose push

.PHONY: deploy
deploy:
	@echo "Deploying..."
	@nomad job run nomad/guides.nomad

.PHONY: upgrade
upgrade:
	. ./.venv/bin/activate && \
	pip install zensical --upgrade

.PHONY: serve
serve:
	. ./.venv/bin/activate && \
	zensical serve

.PHONY: build
build:
	. ./.venv/bin/activate && \
	zensical build
