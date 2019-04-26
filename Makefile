


#########
# DOCKER
#########

build-arm64:
	ARCH=arm64v8 bash ./scripts/build-multiarch.sh
build-x86:
	ARCH=x86_64 bash ./scripts/build-multiarch.sh
build-manifest:
	bash ./scripts/build-manifest.sh

