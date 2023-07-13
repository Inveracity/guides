.PHONY: docker
docker:
	@echo "Building..."
	@docker build -t inveracity/guides:latest -f docker/guides.dockerfile .
	@echo "Pushing..."
	@docker push inveracity/guides:latest

.PHONY: deploy
deploy:
	@echo "Deploying..."
	@nomad job run nomad/guides.nomad

