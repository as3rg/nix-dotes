{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;
    history = {
      size = 1000;
      save = 1000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "half-life";
    };
    initExtra = "
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt autocd extendedglob

bindkey '\\e[A' history-search-backward
bindkey '\\e[B' history-search-forward

bindkey '\\e[3;5~' kill-word
bindkey '\\e[3;3~' backward-kill-word

bindkey '\\e[3~' delete-char
bindkey '\\e[H'  beginning-of-line
bindkey '\\e[F'  end-of-line

zstyle :compinstall filename '/home/as3rg/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
source \"$(readlink $HOME/.config/fzf-git.sh)\"
    ";
  };

  home.file.".config/fzf-git.sh" = { source = ../../../configs/fzf-git.sh; recursive = true;};
}
