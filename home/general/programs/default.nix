{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [    
  ./atuin.nix
  ./autorandr.nix
  ./bash.nix
  ./eza.nix 
  ./fd.nix 
  ./firefox.nix
  ./fzf.nix 
  ./git.nix 
  ./htop.nix
  ./nix-index.nix
  ./kitty.nix 
  ./lazygit.nix 
  ./ranger.nix 
  ./rofi.nix 
  ./starship.nix
  ./thefuck.nix 
  ./vscode.nix 
  ./zoxide.nix 
  ./zsh.nix
  ];
  programs.home-manager.enable = true;
}
