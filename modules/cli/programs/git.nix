{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "as3rg";
    userEmail = "sergeev0xEF@gmail.com";
    diff-so-fancy.enable = true;
  };
}
