{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.ranger = {
    enable = true;
  };
  home.file.".config/ranger" = { source = ../../../configs/ranger; recursive = true;};
}
