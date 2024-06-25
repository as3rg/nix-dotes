{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
}