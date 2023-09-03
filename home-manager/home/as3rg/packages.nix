{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    bat
    bluetuith
    bluez
    brightnessctl
    discord
    feh
    file
    flameshot
    fzf
    imv
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    libnotify   # notify-send
    libreoffice
    neovim
    networkmanager
    noti
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    obs-studio
    pamixer
    playerctl
    pulseaudio  # to use pactl
    python3
    ranger
    rsync
    telegram-desktop
    tesseract4
    texlive.combined.scheme-small
    transmission-qt
    uget
    unzip
    vlc
    vscode
    wget
    xclip
    xsecurelock
    yt-dlp
    zathura
    zip
  ];
}
