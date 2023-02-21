DOCKER_IMAGE:=python_wasm_test
DOCKER_IMAGE_DEPENDENCIES:=${DOCKER_IMAGE}_dependencies

build:
	docker build \
		--tag ${DOCKER_IMAGE_DEPENDENCIES} \
		--target python_dependencies \
	.

	docker rm tc --force || true
	docker cp $$(docker create --name tc ${DOCKER_IMAGE_DEPENDENCIES}):/site-packages ./site-packages
	docker rm tc

	docker build \
		--tag ${DOCKER_IMAGE} \
		--target wasm \
		--platform=wasm32/wasi \
	.

#shell:
#	docker run --rm -it ${DOCKER_IMAGE} /bin/bash

run:
	docker run --rm \
		--runtime=io.containerd.wasmedge.v1 \
		--platform=wasm32/wasi \
		${DOCKER_IMAGE} \
			source_text.txt

#-v ${PWD}/source_text.txt:/source_text.txt \