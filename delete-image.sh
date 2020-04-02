#!/bin/bash

registry='localhost:5000'
name='demo/apline'
#version='3.7'
version='latest'

 

curl -v -sSL -X DELETE "http://${registry}/v2/${name}/manifests/$( \
     curl -sSL -I \
     -H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
     http://${registry}/v2/${name}/manifests/${version} \
     | awk '$1 == "Docker-Content-Digest:" { print $2 }' \
     | tr -d $'\r')"

 

docker exec -it registry bin/registry garbage-collect /etc/docker/registry/config.yml
