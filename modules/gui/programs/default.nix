{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [    
  ./firefox.nix
  ./vscode.nix
  ./kitty.nix
  ];
}
