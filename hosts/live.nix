{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
  [ 
    (modulesPath + "/profiles/all-hardware.nix")
    (modulesPath + "/profiles/base.nix")
    (modulesPath + "/profiles/clone-config.nix")
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/installer/cd-dvd/iso-image.nix")
    (modulesPath + "/installer/cd-dvd/channel.nix")
  ];
  isoImage.makeEfiBootable = true;
  isoImage.makeUsbBootable = true;

  swapDevices = lib.mkImageMediaOverride [ ];
  fileSystems = lib.mkImageMediaOverride config.lib.isoFileSystems;
}
