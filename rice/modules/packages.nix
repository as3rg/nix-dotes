{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    alsa-utils
    bluetuith
    bluez
    brightnessctl
    networkmanager
    pamixer
    playerctl
    pulseaudio # to use pactl
    pulsemixer
    xclip
    xsecurelock
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    wl-clipboard
    flameshot
    grim
    swaylock-effects
    swaybg
  ];
}
