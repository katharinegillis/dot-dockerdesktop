#!/usr/bin/env bash

if choco.exe list -lo | grep -q 'docker-desktop'; then
  echo "Docker Desktop already installed - upgrade via Docker Desktop instead of choco"
else
  choco.exe install docker-desktop -y
fi
