{
  config,
  lib,
  pkgs,
  ...
}: 
let
  cfg = config.modules.gui;
in {
  imports = [
    ./packages.nix
    ./programs
  ];
}
