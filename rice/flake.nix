{
  description = "Dedicated eww rice for the lenovo build (does not touch the main flake)";

  inputs = {
    # Reuse the existing dotfiles repo (hardware + base config) without duplicating it,
    # and follow its pinned nixpkgs/home-manager so the rice matches the current system.
    dotfiles.url = "path:..";
    nixpkgs.follows = "dotfiles/nixpkgs";
    home-manager.follows = "dotfiles/home-manager";

    # Only used to pull a newer SwayFX (0.6, animations) for this rice.
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.alejandra;

    nixosConfigurations.lenovo-rice = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        outputs = self;
      };
      system = system;
      modules = [
        "${inputs.dotfiles}/hosts/general.nix"
        "${inputs.dotfiles}/hosts/lenovo.nix"
        ./hosts/lenovo-rice.nix
      ];
    };
  };
}
