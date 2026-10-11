{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = ":size=13";
      };
      colors = {
        background = "101010FF";
        selection = "FF9A00FF";
        border = "FF9A00FF";
        text = "FFFFFFFF"; 
      };
    };
  };
}
