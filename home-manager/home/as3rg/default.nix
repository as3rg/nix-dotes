{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix
    ./env-vars.nix
    ./services
    ./programs
  ];
  home = {
    homeDirectory = "/home/as3rg";
    stateVersion = "23.05";
    username = "as3rg";
  };

  # Allow unfree
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # Fonts
  fonts.fontconfig.enable = true;

}
