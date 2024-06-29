{
  config,
  lib,
  pkgs,
  ...
}: 
let
  cfg = config.modules.cli;
in {
  imports = [
    ./packages.nix
    ./env-vars.nix
    ./programs
  ];
}
