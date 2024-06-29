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
    python311Packages.ipython
    rsync
    unzip
    wget
    zip
    nixos-generators
  ];

  home.file.".config/nvim" = { source = ../../configs/nvim; recursive = true;};
}
