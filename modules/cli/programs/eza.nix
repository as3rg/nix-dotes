{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.eza = {
    enable = true;
    icons = "auto";
  };
}
