{
  config,
  pkgs,
  ...
}: {
 services = {
    autorandr.enable = true;
    picom = {
      enable = true;
      shadow = false;
      fade = false;
      activeOpacity = 1.0;
      inactiveOpacity = 1.0;
      menuOpacity = 1.0;
      backend = "glx";
      package = pkgs.picom-next;
    };	
  };
 }
