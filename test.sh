#!/bin/bash

cd minecraft-bukkit-dockerfile

travisYml="
sudo: required

language: bash

services:
  - docker

env:
  - TAG=1.15.2
  - TAG=1.15.1-R0.1-SNAPSHOT
  - TAG=1.15-R0.1-SNAPSHOT
  - TAG=1.14.4-R0.1-SNAPSHOT
  - TAG=1.14.3-R0.1-SNAPSHOT
  - TAG=latest

before_install:
  - chmod +x travis-build.sh

install:
  - echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

script:
  - ./travis-build.sh
"



