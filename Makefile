collect:
	home-manager expire-generations -d
	nix profile wipe-history
	nix-collect-garbage
	nix store optimise

install:
ifndef conf
$(error conf is not set)
endif
	nixos-rebuild switch --flake ".#nixosConfigurations.$(conf)"

unlock:
	rm -rf flake.lock

clean:
	rm -rf result

build:
ifndef conf
$(error conf is not set)
endif
ifndef ext
$(error ext is not set)
endif
	nix build ".#nixosConfigurations.$(conf).config.system.build.$(ext)"

iso:
	@$(MAKE) build conf=$(conf) ext=isoImage

qcow2:
	@$(MAKE) build conf=$(conf) ext=qcow2