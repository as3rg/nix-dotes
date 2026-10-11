{
  config,
  pkgs,
  lib,
  ...
}: let
  modifier = "Mod4";
  terminal = "kitty";
  browser = "firefox";
  change_wallpaper = "\'pgrep swaybg | xargs -n1 kill -9; find ~/Pictures/wallpapers -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs -I {} swaybg -m fill -i {}\'";
  lock = "swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 00000000 --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 0 --fade-in 0";
in {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      bindkeysToCode = true;
      keybindings = {
        "${modifier}+Ctrl+r" = "reload";
        "${modifier}+Ctrl+q" = "swaymsg exit";

        "XF86AudioMute" = "exec pamixer --toggle-mute";
        "XF86AudioLowerVolume" = "exec pamixer -d 5 --set-limit 200 --allow-boost";
        "XF86AudioRaiseVolume" = "exec pamixer -i 5 --set-limit 200 --allow-boost";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioPause" = "exec playerctl pause";
        "XF86AudioStop" = "exec playerctl stop";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        "${modifier}+p" = "exec playerctl play-pause";
        "${modifier}+parenleft" = "exec playerctl previous";
        "${modifier}+parenright" = "exec playerctl next";

        "${modifier}+q" = "kill";

        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+o" = "focus parent";

        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        "${modifier}+e" = "layout toggle all";

        "${modifier}+k" = "sticky toggle";
        "${modifier}+v" = "floating toggle";
        "${modifier}+f" = "fullscreen toggle";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" =
          "move container to workspace number 1, workspace number 1";
        "${modifier}+Shift+2" =
          "move container to workspace number 2, workspace number 2";
        "${modifier}+Shift+3" =
          "move container to workspace number 3, workspace number 3";
        "${modifier}+Shift+4" =
          "move container to workspace number 4, workspace number 4";
        "${modifier}+Shift+5" =
          "move container to workspace number 5, workspace number 5";
        "${modifier}+Shift+6" =
          "move container to workspace number 6, workspace number 6";
        "${modifier}+Shift+7" =
          "move container to workspace number 7, workspace number 7";
        "${modifier}+Shift+8" =
          "move container to workspace number 8, workspace number 8";
        "${modifier}+Shift+9" =
          "move container to workspace number 9, workspace number 9";
        "${modifier}+Shift+0" =
          "move container to workspace number 10, workspace number 10";

        "${modifier}+n" = "exec swaync-client -d";
        "${modifier}+Shift+n" = "exec swaync-client -t";
        
        "${modifier}+Alt+r" = "mode resize";
        "${modifier}+backslash" = "splith";
        "${modifier}+escape" = "split none";
        "${modifier}+Shift+backslash" = "splitv";
        
        "${modifier}+Ctrl+w" = "exec ${change_wallpaper}";
        "${modifier}+w" = "exec ${browser}";
        "${modifier}+s" = "exec flameshot gui";
        "${modifier}+Shift+s" = "exec flameshot gui -r -s | tesseract - - -l eng+rus quiet --layout --psm 11 | wl-copy";
        "${modifier}+r" = "exec fuzzel";
        "${modifier}+Return" = "exec ${terminal}";
        # "${modifier}+period" = "exec rofi -show emoji -modi emoji";
        # "${modifier}+slash" = "exec rofi -show calc -modi calc -no-show-match -no-sort";
        "${modifier}+Shift+p" = "exec ${terminal} ipython";
        "${modifier}+Shift+slash" = "exec ${terminal} qalc";
        "${modifier}+Shift+r" = "exec ${terminal} ranger";
        "${modifier}+Shift+t" = "exec ${terminal} htop";
        "${modifier}+Shift+w" = "exec ${terminal} nmtui";
        "${modifier}+Shift+b" = "exec ${terminal} bluetuith";
        "${modifier}+Shift+m" = "exec ${terminal} pulsemixer";
        "${modifier}+Shift+v" = "exec copyq menu";
        "${modifier}+l" = "exec ${lock}";
        "${modifier}+Ctrl+m" = "exec systemctl --user restart pipewire.service";
      };
      input = {
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
          scroll_factor = "0.5";
          pointer_accel = "0.5";
        };
        "*" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:win_space_toggle";
        };
      };
      output."eDP-1" = {
        "scale" = "1.5";
        "mode" = "2880x1920@60Hz";
      };
    };
    xwayland = true;
    systemd.enable = true;
    extraConfig = ''
      smart_gaps on
      for_window [window_type="dialog"] floating enable
      for_window [window_role="dialog"] floating enable
      for_window [window_role="pop-up"] floating enable
      for_window [title="^CopyQ$"] floating enable, border pixel
      for_window [window_role="GtkFileChooserDialog"] floating enable
      for_window [class="floating"] floating enable

      exec ${change_wallpaper}
      exec "swayidle before-sleep '${lock}'"
    '';
  };
}
