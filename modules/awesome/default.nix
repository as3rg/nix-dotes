{
  config,
  lib,
  pkgs,
  ...
}: 
let
  cfg = config.modules.awesome;
in {
  imports = [
    ./packages.nix
    ./programs
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # AutoRandr
  services.autorandr.enable = true;
  
  # Awesomewm
  home.file.".config/awesome" = { source = ../../configs/awesome; recursive = true;};

  # Picom
  services.picom = {
    enable = true;
    shadow = false;
    fade = false;
    activeOpacity = 1.0;
    inactiveOpacity = 1.0;
    menuOpacity = 1.0;
    backend = "glx";
    package = pkgs.picom-next;
  };

  # Copyq
  services.copyq.enable = true;
}
