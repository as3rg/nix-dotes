collect:
	nix-env --delete-generations +3
	home-manager expire-generations -d
	nix profile wipe-history
	nix-collect-garbage
	nix store optimise

install:
	nixos-rebuild switch --flake ".#$(conf)"

unlock:
	rm -rf flake.lock

clean:
	rm -rf result

build:
	nix build ".#nixosConfigurations.$(conf).config.system.build.$(ext)"

iso:
	@$(MAKE) build conf=$(conf) ext=isoImage

qcow2:
	@$(MAKE) build conf=$(conf) ext=qcow
