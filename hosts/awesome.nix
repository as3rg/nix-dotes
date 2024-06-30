{ config, pkgs, inputs, outputs, ... }:
{
  imports =
  [
  ./general.nix
  ];

  home-manager.users.as3rg = {
    imports = [
    ../modules/gui
    ../modules/awesome
    ];
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

  # Xorg
  services.xserver = {
    enable = true; 
    displayManager = {
      lightdm = {
        enable = true;
      };
      startx.enable = true;
    };
    xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };
    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome.overrideAttrs (oa: {
        version = "ad0290bc1aac3ec2391aa14784146a53ebf9d1f0";
		    src = pkgs.fetchFromGitHub {
          owner = "awesomeWM";
          repo = "awesome";
          rev = "ad0290bc1aac3ec2391aa14784146a53ebf9d1f0";
          hash = "sha256-uaskBbnX8NgxrprI4UbPfb5cRqdRsJZv0YXXshfsxFU=";
        };
        patches = [ ];
        postPatch = ''
          patchShebangs tests/examples/_postprocess.lua
        '';
      });
    };
  };
}

