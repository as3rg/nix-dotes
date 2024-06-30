{
  config,
  pkgs,
  ...
}: {  
  home.packages = with pkgs; [
    flameshot
    imv
    libnotify   # notify-send
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    noti
    tesseract4
  ];
}
