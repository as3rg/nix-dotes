{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./autorandr.nix
    ./starship.nix
    ./rofi.nix
    ./kitty.nix
    ./fish.nix
    ./bash.nix
    ./eza.nix
    ./git.nix
    ./htop.nix
    ./qutebrowser.nix
  ];
  programs.home-manager.enable = true;

  home.file.".config/awesome" = { source = ../../../../awesome; recursive = true;};
  home.file.".config/ranger" = { source = ../../../../ranger; recursive = true;};
  home.file.".config/nvim" = { source = ../../../../nvim; recursive = true;};
  # home.file.".config/vlc" = { source = ../../../../vlc; recursive = true;};
}
