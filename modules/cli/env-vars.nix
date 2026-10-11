{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    MANROFFOPT = "-c";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    PAGER = "bat --paging=never";
    EDITOR = "nvim";
    SYSTEMD_PAGERSECURE="true"; 
    SYSTEMD_PAGER="bat -l syslog -p";
    SYSTEMD_COLORS="false";
    SYSTEMD_LESS="FRSMK";
  };
  home.shellAliases = {
    q = "exit";
    rr = "ranger";
    wl-icopy = "wl-copy -t image/png";
    nix-shell = "nix-shell --run $SHELL";
    sush = "sudo -E $SHELL";
  };
}
