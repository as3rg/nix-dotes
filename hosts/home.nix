{ config, pkgs, inputs, outputs, ... }:
{
  home-manager.users.as3rg = {
    imports = [
    ../modules/home
    ];
  };
}

