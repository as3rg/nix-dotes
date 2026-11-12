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
    ./opencode.nix
    ./lazygit.nix
    ./ranger.nix
    ./starship.nix
    ./tealdeer.nix
    ./zoxide.nix
    ./zsh.nix
    ./direnv.nix
  ];
  programs.home-manager.enable = true;
}
