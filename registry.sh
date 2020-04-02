#!/bin/bash

docker run -dt --restart=always --name=local-registry -v /data/n01/development0:/var/lib/registry -e REGISTRY_STORAGE_DELETE_ENABLED=true -p 5000:5000 registry
