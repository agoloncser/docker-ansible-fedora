# docker-ansible-fedora32

[![Build Status](https://travis-ci.com/agoloncser/docker-ansible-fedora32.svg?branch=master)](https://travis-ci.com/agoloncser/docker-ansible-fedora32)

Docker image for testing ansible code.

Includes:
- ansible
- ansible-lint
- Molecule
- YAMLlint
- Prettier.js

## Running this image

    docker run --privileged -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro $(basename $(pwd) | sed 's/\.git//'):$(cat VERSION) /bin/bash

## Building this image manually

    docker build --tag $(basename $(pwd) | sed 's/\.git//'):$(cat VERSION) .
