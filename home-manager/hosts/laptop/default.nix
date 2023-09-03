{ config, pkgs, inputs, outputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # Networking
  networking.hostName = "as3rg";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Time
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  # Packages
  environment.systemPackages = 
  with pkgs; [
    git
    htop
    neovim
    wget
    zip
    unzip
    networkmanager
    home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;
  programs.steam = {
     enable = true;
  };

  # Users
  users.users.as3rg = {
    isNormalUser = true;
    home = "/home/as3rg";
    initialPassword = "1234";
    extraGroups = [ "wheel" "networkmanager" ];
    packages = [pkgs.home-manager];
    shell = pkgs.fish;
  };
  home-manager.users.as3rg = import ../../home/as3rg;

  # System
  system.autoUpgrade.enable = true;
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        # greeters.mini.enable = true;
      };
      startx.enable = true;
    };
    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome.overrideAttrs (oa: {
        version = "86f67f4e089ee93ace999f3b523dd1c9cfaf6860";
        src = pkgs.fetchFromGitHub {
          owner = "awesomeWM";
          repo = "awesome";
          rev = "86f67f4e089ee93ace999f3b523dd1c9cfaf6860";
          hash = "sha256-lE3qAh1VzoLkmjnFm172BaJTxwwyOhRezkVqvQqdqZc=";
        };
        patches = [ ];
        postPatch = ''
          patchShebangs tests/examples/_postprocess.lua
        '';
      });
    };
    layout = "us,ru";
    xkbOptions = "grp:win_space_toggle";
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.polkit.enable = true;

  system.stateVersion = "23.05";
}

