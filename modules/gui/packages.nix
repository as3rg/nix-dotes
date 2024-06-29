{
  config,
  pkgs,
  ...
}: {  
  home.packages = with pkgs; [
    gimp
    # jetbrains.clion
    # jetbrains.idea-ultimate
    discord
    flameshot
    imv
    jetbrains.pycharm-professional
    libnotify   # notify-send
    libreoffice
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    noti
    obs-studio
    telegram-desktop
    tesseract4
    transmission_4-qt
    uget
    yt-dlp
  ];
}
