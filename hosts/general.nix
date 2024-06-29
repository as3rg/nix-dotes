{ config, pkgs, inputs, outputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

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

  # users.users.nixos = null;
  users.users.root.initialHashedPassword = "1234";
  users.users.as3rg = {
    isNormalUser = true;
    home = "/home/as3rg";
    initialPassword = "1234";
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

