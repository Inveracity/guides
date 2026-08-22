.PHONY: docker
docker:
	@echo "Exporting uv lock to requirements.txt"
	@uv export --quiet --output-file docker/requirements.out.txt
	@echo "Building..."
	@docker compose build --quiet
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
	uv run zensical build --clean
