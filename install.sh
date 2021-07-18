#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    choco.exe install docker-desktop -y
    touch .restart.lock
fi