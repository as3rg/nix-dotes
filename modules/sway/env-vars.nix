{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
    QT_QPA_PLATFORM="wayland";
    SDL_VIDEODRIVER="wayland";
    NIXOS_OZONE_WL="1";
    ELECTRON_OZONE_PLATFORM_HINT="wayland";
  };
}
