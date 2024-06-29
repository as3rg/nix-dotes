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
    networkmanager
    pamixer
    playerctl
    pulseaudio  # to use pactl
    pulsemixer
    xclip
    xsecurelock
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}
