{ config, pkgs, inputs, outputs, ... }:
{
  imports =
  [
  ./general.nix
  ];

  home-manager.users.as3rg = {
    imports = [
    ../modules/gui
    ../modules/sway
    ];
  };
  
  services.displayManager.ly.enable = true;
  programs.sway = {
    enable = true;
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
    restartTriggers = [ "on-failure" ];
    environment = {
      QT_QPA_PLATFORM="wayland";
    };
    script = ''${pkgs.copyq.outPath}/bin/copyq'';
    wantedBy = [ "sway-session.target" ];
  };
  environment.systemPackages = [ pkgs.copyq ];


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

