{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../general
    ./packages.nix
    ./env-vars.nix
    ./programs
    ./services
  ]; 
}
