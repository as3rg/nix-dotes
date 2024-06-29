{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [    
  ./atuin.nix
  ./bash.nix
  ./eza.nix 
  ./fd.nix 
  ./fzf.nix 
  ./git.nix 
  ./htop.nix
  ./nix-index.nix
  ./lazygit.nix 
  ./ranger.nix 
  ./starship.nix
  ./thefuck.nix
  ./zoxide.nix 
  ./zsh.nix
  ];
  programs.home-manager.enable = true;
}
