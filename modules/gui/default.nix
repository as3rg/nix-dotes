{
  config,
  lib,
  pkgs,
  inputs,
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
