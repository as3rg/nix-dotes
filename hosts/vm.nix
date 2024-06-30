{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
      "${modulesPath}/profiles/base.nix"
      "${modulesPath}/profiles/all-hardware.nix"
      "${modulesPath}/profiles/qemu-guest.nix"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    autoResize = true;
    fsType = "ext4";
  };

  boot.growPartition = true;
  boot.kernelParams = ["console=ttyS0"];
  boot.loader.grub.device =
    if (pkgs.stdenv.system == "x86_64-linux")
    then (lib.mkDefault "/dev/vda")
    else (lib.mkDefault "nodev");

  boot.loader.grub.efiSupport = lib.mkIf (pkgs.stdenv.system != "x86_64-linux") (lib.mkDefault true);
  boot.loader.grub.efiInstallAsRemovable = lib.mkIf (pkgs.stdenv.system != "x86_64-linux") (lib.mkDefault true);
  boot.loader.timeout = 0;

  system.build.qcow = import "${toString modulesPath}/../lib/make-disk-image.nix" {
    inherit lib config pkgs;
    diskSize = "auto";
    format = "qcow2";
    partitionTableType = "legacy+gpt";
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
}
