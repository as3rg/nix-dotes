{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: let
  # SwayFX 0.6 (animations) from unstable, isolated to this rice.
  swayfx = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.swayfx;
in {
  home-manager.users.as3rg = {
    imports = [
      "${inputs.dotfiles}/modules/gui"
      "${inputs.dotfiles}/modules/home"
      "${inputs.dotfiles}/modules/sway/env-vars.nix"
      ../modules
    ];
    wayland.windowManager.sway.package = swayfx;
  };

  services.displayManager.ly.enable = true;
  programs.sway = {
    enable = true;
    package = swayfx;
    wrapperFeatures.gtk = true;
  };

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Libinput
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  services.gnome.gnome-keyring.enable = true;

  # copyq
  systemd.user.services.copyq = {
    enable = true;
    description = "CopyQ clipboard management daemon";
    restartTriggers = ["on-failure"];
    environment = {
      QT_QPA_PLATFORM = "wayland";
    };
    script = ''${pkgs.copyq.outPath}/bin/copyq'';
    wantedBy = ["sway-session.target"];
  };
  environment.systemPackages = [pkgs.copyq];

  home-manager.users.as3rg.home.pointerCursor = {
    enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };
}
