{ config, pkgs, inputs, outputs, ... }:
{
  imports =
  [
  ./general.nix
  ];

  home-manager.users.as3rg = {
    home = {
      homeDirectory = "/home/as3rg";
      stateVersion = "24.11";
      username = "as3rg";
    };

    nixpkgs.config.allowUnfree = true;
    imports = [../modules/cli];
  };
}

