{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.opencode = {
    enable = true;
  };
}
