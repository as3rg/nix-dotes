{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    MANROFFOPT = "-c";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    PAGER = "bat";
    EDITOR = "nvim";
  };
  home.shellAliases = {
    rr = "ranger";
    copy = "xclip -selection clipboard";
    icopy = "xclip -selection clipboard -t image/png";
    select = "fzf --preview \"bat --color=always --style=numbers --line-range=:500 {}\"";
  };
}
