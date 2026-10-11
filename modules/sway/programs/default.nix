{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./fuzzel.nix
    ./sway.nix
  ];

  # Feh
  programs.feh = {
    enable = true;
  };
}
