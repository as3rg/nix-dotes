clear:
	home-manager expire-generations -d
	nix profile wipe-history
	nix-collect-garbage
	nix store optimise

install:
	nixos-rebuild switch --flake ".#xiaomi"

update:
	home-manager switch --flake ".#xiaomi"

build:
	nix build ".#nixosConfigurations.live.config.system.build.isoImage"
	