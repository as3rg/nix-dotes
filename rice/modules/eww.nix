{
  config,
  pkgs,
  lib,
  ...
}: let
  python = pkgs.python3.withPackages (ps: [ps.pygobject3]);
  notifd = pkgs.writeShellScriptBin "notifd" ''
    exec ${python}/bin/python3 "$HOME/.config/eww/scripts/notifd.py" "$@"
  '';
in {
  home.packages = [
    pkgs.eww
    pkgs.jq
    pkgs.psmisc # fuser, for the camera-in-use check
    notifd
  ];

  xdg.configFile."eww" = {
    source = ../configs/eww;
    recursive = true;
  };
}
