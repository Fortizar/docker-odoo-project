NAME=fortizarhu/odoo-project
ifndef VERSION
$(error VERSION is not set)
endif

IMAGE=$(NAME):$(VERSION)
IMAGE_LATEST=$(IMAGE)-latest

export

all: build


.PHONY: build
build:
	bash build.sh


.PHONY: tag
tag:
	docker tag $(IMAGE_LATEST)-batteries $(IMAGE)-$(TAG)-batteries


.PHONY: push
push:
	docker push $(IMAGE)-$(TAG)-batteries


.PHONY: tag_latest_main
tag_latest_main:
	docker tag $(IMAGE_LATEST)-batteries $(NAME):latest-batteries


.PHONY: push_latest_main
push_latest_main:
	docker push $(NAME):latest-batteries


.PHONY: test
test:
	bash test.sh
