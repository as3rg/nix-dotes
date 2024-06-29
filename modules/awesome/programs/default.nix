{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ./rofi.nix
  ];

  # Feh
  programs.feh = {
    enable = true;
  };
}
