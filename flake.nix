{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      "xiaomi" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/awesome.nix
          ./hosts/xiaomi.nix
          ./hosts/home.nix
        ];
      };
      "live" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/awesome.nix
          ./hosts/live.nix
          ({ config, lib, pkgs, inputs, outputs, ... }: { home-manager.users.as3rg.services.picom.enable = lib.mkForce false; })
        ];
      };
      "vm-gui" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/awesome.nix
          ./hosts/vm.nix
          ({ config, lib, pkgs, inputs, outputs, ... }: { home-manager.users.as3rg.services.picom.enable = lib.mkForce false; })
        ];
      };
      "vm-cli" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/vm.nix
          ./hosts/general.nix
        ];
      };
    };
  };
}
