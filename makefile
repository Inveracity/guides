.PHONY: docker
docker:
	@echo "Building..."
	@docker compose build
	@echo "Pushing..."
	@docker compose push

.PHONY: deploy
deploy:
	@echo "Deploying..."
	@nomad job run -var="now=$(shell date +%Y-%m-%dT%H:%M:%S%z)" nomad/guides.nomad

.PHONY: upgrade
upgrade:
	uv add zensical --upgrade

.PHONY: serve
serve:
	uv run zensical serve --open

.PHONY: build
build:
	uv run  zensical build --clean
