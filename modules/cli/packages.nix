{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gnumake
    libqalculate
    ncdu
    bat
    comma
    file
    neovim
    python3
    rsync
    unzip
    wget
    zip
    nixos-generators
    killall
    atac
    tcpdump
    dig
    trippy
    ripgrep
  ];

  home.file.".config/nvim" = { source = ../../configs/nvim; recursive = true;};
}
