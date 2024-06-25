{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    alsa-utils
    bluetuith
    bluez
    brightnessctl
    htop
    networkmanager
    pamixer
    playerctl
    pulseaudio  # to use pactl
    pulsemixer
    xclip
    xsecurelock
  ];
}
