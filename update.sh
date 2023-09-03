#!/usr/bin/env bash
path=$(dirname "$0");
home-manager switch --flake ./$path/home-manager#as3rg
