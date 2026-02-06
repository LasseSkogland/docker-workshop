#!/bin/sh
docker build -t hello-config:copy -f Dockerfile.copy .
docker build -t hello-config:mount -f Dockerfile.mount .