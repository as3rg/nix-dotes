{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    shellInit = ''
    set fish_greeting
    '';
  };
}