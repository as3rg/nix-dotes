{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.8";
      confirm_os_window_close = "0";
      wheel_scroll_multiplier = "10.0";
      touch_scroll_multiplier = "10.0";
    };
    # themeFile = "Vibrant Ink";
  };
}
