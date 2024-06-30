{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.users.as3rg = {
    home = {
      homeDirectory = "/home/as3rg";
      stateVersion = "24.11";
      username = "as3rg";
    };
    nixpkgs.config.allowUnfree = true;
    imports = [
    ../modules/cli
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Networking
  networking.hostName = "as3rg";
  networking.wireless.enable = false;
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Time
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  # Packages
  environment.systemPackages = with pkgs; [
    git
    htop
    neovim
    wget
    zip
    unzip
    home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  # Users
  programs.zsh.enable = true;

  users.users.root.hashedPassword = "$y$j9T$JVx/q.wFFnbpT19N1ZfX..$FcfuxUW89ckSU.CyPIbCafFjQir6vOzeeR9FHD3VF1/";
  users.users.as3rg = {
    isNormalUser = true;
    home = "/home/as3rg";
    hashedPassword = "$y$j9T$JVx/q.wFFnbpT19N1ZfX..$FcfuxUW89ckSU.CyPIbCafFjQir6vOzeeR9FHD3VF1/";
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" "libvirtd" ];
    packages = [pkgs.home-manager];
    shell = pkgs.zsh;
  };

  # System
  system.autoUpgrade.enable = false;    # Kills Xserver
  security.polkit.enable = true;

  # Version
  system.stateVersion = "24.11";
}

