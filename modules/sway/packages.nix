{
  config,
  pkgs,
  ...
}: 
let 
  # flameshotGrim = pkgs.flameshot.overrideAttrs (oldAttrs: {
  #   cmakeFlags = [
  #     "-DUSE_WAYLAND_CLIPBOARD=1"
  #     "-DUSE_WAYLAND_GRIM=1"
  #   ];
  # });
in {
  home.packages = with pkgs; [
    jetbrains-mono
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
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    # material-symbols
    wl-clipboard
    swaynotificationcenter
    flameshot
    grim
    swaylock-effects
    swaybg
  ];
}
