{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [    
  ./vscode.nix
  ./kitty.nix
  ];
}
