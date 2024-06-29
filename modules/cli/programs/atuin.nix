{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
  };
}