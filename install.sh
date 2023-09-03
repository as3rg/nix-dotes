#!/usr/bin/env bash
path=$(dirname "$0");
nixos-rebuild switch --flake "./$path/home-manager#laptop"
