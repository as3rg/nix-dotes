{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gimp
    gnumake
    # jetbrains.clion
    # jetbrains.idea-ultimate
    (texlive.combine { inherit (texlive) scheme-small latexmk mathdots collection-fontsextra collection-langcyrillic; } ) 
	libqalculate
	ncdu
    bat
	comma
    discord
    file
    flameshot
    fzf
    imv
    jetbrains.pycharm-professional
    libnotify   # notify-send
    libreoffice
    mpv
    neovim
    noti
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    obs-studio
    python3
    python311Packages.ipython
    ranger
    rsync
    telegram-desktop
    tesseract4
    transmission-qt
    uget
    unzip
    vscode
    wget
    yt-dlp
    zip
  ];

  home.file.".config/nvim" = { source = ../../configs/nvim; recursive = true;};
}
