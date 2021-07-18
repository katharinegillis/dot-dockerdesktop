#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    choco.exe uninstall docker-desktop -y
fi