#!/usr/bin/env bash

##########################################
# Run this script with Makefile from root
# VERSION=0.17 make release
##########################################

#VERSION=
SERVICE="sparkswap-broker"
ARCH="arm64v8 x86_64"
ORG="crypdex"
NODE_VERSION="8.11"
VERSION="0.6.1-beta"
IMAGE=node:${NODE_VERSION}-alpine

# Build and push builds for these architectures
for arch in ${ARCH}; do
  if [[${arch} = "arm64v8"]]; then
    IMAGE=arm64v8/node:${NODE_VERSION}-alpine
  fi

  docker build --build-arg IMAGE=${IMAGE} -f docker/sparkswapd/Dockerfile -t ${ORG}/${SERVICE}:${VERSION}-${arch} . && \
  docker push ${ORG}/${SERVICE}:${VERSION}-${arch}
done


# # Now create a manifest that points from latest to the specific architecture
# rm -rf ~/.docker/manifests/*

# # version
# docker manifest create ${ORG}/${SERVICE}:${VERSION} ${ORG}/${SERVICE}:${VERSION}-x86_64 ${ORG}/${SERVICE}:${VERSION}-arm64v8
# docker manifest push ${ORG}/${SERVICE}:${VERSION}

