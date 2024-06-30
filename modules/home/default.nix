{
  config,
  lib,
  pkgs,
  ...
}: 
let
  cfg = config.modules.gui;
in {
  home.packages = with pkgs; [
    gimp
    # jetbrains.clion
    # jetbrains.idea-ultimate
    # jetbrains.pycharm-professional
    libreoffice
    discord
    noti
    obs-studio
    telegram-desktop
    transmission_4-qt
    uget
    yt-dlp
  ];
}
