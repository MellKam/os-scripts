IMAGE_NAME = script-dev-container

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run -it --rm -v "$(pwd)":/usr/local/bin $(IMAGE_NAME)