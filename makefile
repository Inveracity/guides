.PHONY: docker
docker:
	@echo "Building..."
	@docker compose build
	@echo "Pushing..."
	@docker compose push

.PHONY: upgrade
upgrade:
	uv add zensical --upgrade

.PHONY: serve
serve:
	uv run zensical serve --open

.PHONY: build
build:
	uv run  zensical build --clean
