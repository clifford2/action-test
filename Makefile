# Use podman or docker?
ifeq ($(shell command -v podman 2> /dev/null),)
	CONTAINER_ENGINE := docker
else
	CONTAINER_ENGINE := podman
endif

# Command to install qemu-ppc64le
ifeq ($(CONTAINER_ENGINE),podman)
	BINFMT_CMD := sudo podman run --privileged --rm docker.io/tonistiigi/binfmt --install ppc64le
else
	BINFMT_CMD := docker run --privileged --rm docker.io/tonistiigi/binfmt --install ppc64le
endif

.PHONY: all
all: build-ppc64le

# Build PPC64LE container image
.PHONY: build-ppc64le
build-ppc64le: TARGETARCH := ppc64le
build-ppc64le: PLATFORM := ppc64le
build-ppc64le: build-package

# Build AMD64 container image
.PHONY: build-amd64
build-amd64: TARGETARCH := amd64
build-amd64: PLATFORM := amd64
build-amd64: build-package

# Build ARM container image
.PHONY: build-arm64v8
build-arm64v8: TARGETARCH := arm64v8
build-arm64v8: PLATFORM := arm64
build-arm64v8: build-package

# Build the image
.PHONY: build-package
build-package: check-depends
	$(BINFMT_CMD)
	$(CONTAINER_ENGINE) run --platform linux/$(PLATFORM) docker.io/${TARGETARCH}/debian:trixie-20250811 uname -a

# Verify that we have all required dependencies installed
# Written for Ubuntu 24.04 (used by GitHub action workflow)
.PHONY: check-depends
check-depends:
	@test -f /usr/bin/env || (apt-get update && apt-get install -y coreutils)
	@command -v git || (apt-get update && apt-get install -y git)
	@command -v bash || (apt-get update && apt-get install -y bash)
	@command -v podman || (apt-get update && apt-get install -y podman)
	@command -v curl || (apt-get update && apt-get install -y curl)
	@command -v jq || (apt-get update && apt-get install -y jq)
	@command -v docker
