{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.thefuck = {
    enable = true;
  };
}