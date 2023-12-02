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
    stateVersion = "24.05";
    username = "as3rg";
  };

  # Allow unfree
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  nixpkgs.overlays = [ (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    }) ];

  # Fonts
  fonts.fontconfig.enable = true;

}
