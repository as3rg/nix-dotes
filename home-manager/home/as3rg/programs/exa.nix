{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.exa = {
    enable = true;
    icons = true;
    enableAliases = true;
  };
}