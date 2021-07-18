#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    echo "Please upgrade via Docker Desktop instead of Chocolatey."
fi
