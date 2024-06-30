{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
  [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Boot
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ perf ];

  # FS
  fileSystems."/" =
  { device = "/dev/disk/by-uuid/19831d42-c939-4396-b90e-24f2c84667c0";
    fsType = "ext4";
  };

  fileSystems."/storage" =
  { device = "/dev/disk/by-uuid/2c96e90a-bdca-4e74-bfb1-3f9b6c5b75f2";
    fsType = "ext4";
  };

  fileSystems."/boot" =
  { device = "/dev/disk/by-uuid/7A40-02F1";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices =
  [ 
    { device = "/dev/disk/by-uuid/c77dc030-12d7-42bf-a2b3-cde4917b1fe4"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Printer
  services.printing = {
    enable = true;
    drivers = [ pkgs.samsung-unified-linux-driver ];
  };
  hardware.sane.enable = true;

  # Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
