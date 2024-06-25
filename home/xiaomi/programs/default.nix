{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [    
  ./feh.nix 
  ];
  home.file.".config/awesome" = { source = ../../../configs/awesome; recursive = true;};
  programs.home-manager.enable = true;
}
