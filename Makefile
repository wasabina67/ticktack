IMAGE_NAME = ghcr.io/wasabina67/ticktack
IMAGE_TAG = latest
CONTAINER_NAME = ticktack
CR_PAT = CR_PAT

BUILD = docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
RUN = docker run -it --rm --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_TAG)
LOGIN = echo $(CR_PAT) | docker login ghcr.io -u USERNAME --password-stdin
PUSH = docker push $(IMAGE_NAME):$(IMAGE_TAG)
PULL = docker pull $(IMAGE_NAME):$(IMAGE_TAG)

build:
	$(BUILD)
run:
	-$(RUN); \
	STATUS=$$?; \
	if [ $$STATUS -ne 130 ]; then exit $$STATUS; fi
login:
	$(LOGIN)
push:
	$(PUSH)
pull:
	$(PULL)

.PHONY: build run login push pull
