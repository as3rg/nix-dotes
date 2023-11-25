{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    alsa-utils
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
    # jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    libnotify   # notify-send
    libreoffice
    mpv
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
    python311Packages.ipython
    ranger
    rsync
    telegram-desktop
    tesseract4
    (texlive.combine { inherit (texlive) scheme-small latexmk mathdots collection-fontsextra collection-langcyrillic; } ) 
    # texlive.combined.scheme-full
    # thunderbirdPackages.thunderbird-115
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
