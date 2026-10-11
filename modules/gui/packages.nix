{
  config,
  pkgs,
  ...
}: {  
  home.packages = with pkgs; [
    imv
    libnotify   # notify-send
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    noti
    tesseract4
    halloy
    firefox
  ];
}
