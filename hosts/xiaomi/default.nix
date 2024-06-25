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

  boot.extraModulePackages = with config.boot.kernelPackages; [ perf ];
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

  programs.zsh.enable = true;
  programs.steam = {
     enable = true;
  };

  # Users
  users.users.as3rg = {
    isNormalUser = true;
    home = "/home/as3rg";
    initialPassword = "1234";
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" "libvirtd" ];
    packages = [pkgs.home-manager];
    shell = pkgs.zsh;
  };
  home-manager.users.as3rg = import ../../home/xiaomi;

  # System
  system.autoUpgrade.enable = false;    # Kills Xserver
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };
  services.xserver = {
    enable = true; 
    displayManager = {
      lightdm = {
        enable = true;
        # greeters.mini.enable = true;
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
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.polkit.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.printing.enable = true;
  hardware.sane.enable = true;
  services.printing.drivers = [ pkgs.samsung-unified-linux-driver ];

  system.stateVersion = "24.11";
}

