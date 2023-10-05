home-manager expire-generations -d
nix profile --gc
nix-collect-garbage
nix store optimise
