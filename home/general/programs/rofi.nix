{
  config,
  pkgs,
  lib,
  ...
}: {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi.override {
        plugins = [pkgs.rofi-emoji pkgs.rofi-calc];
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral; 
      in {
        "*" = {
          font = "JetBrainsMono Nerd Font 10";
          bg0 = mkLiteral "#121212";
          bg1 = mkLiteral "#181818";
          bg2 = mkLiteral "#1e1e1e";
          fg0 = mkLiteral "#e8e3e3";
          fg1 = mkLiteral "#949494";
          accent = mkLiteral "#FF9A00";
          urgent = mkLiteral "#B66467";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg0";
          margin = 0;
          padding = 0;
          spacing = 0;
        };
        "element-icon, element-text, scrollbar" = {
          cursor = mkLiteral "pointer";
        };
        "window" = {
          padding = mkLiteral "15px";
          background-color = mkLiteral "@bg1";
          border-radius = mkLiteral "5px";
        };
        "inputbar" = {
          padding = mkLiteral "10px 10px";
          background-color = mkLiteral "@bg2";
          border-radius = mkLiteral "3px";
          margin = mkLiteral "0 0 10px 0";
          children = map mkLiteral [ "prompt" "entry" "num-filtered-rows" "textbox-num-sep" "num-rows"];
        };
        "prompt" = {
          margin = mkLiteral "0 10px 0 0";
        };
        "textbox-num-sep" = {
          expand = false;
          str = "/";
        };
        "listview" = {
          padding = mkLiteral "4px 0px";
          lines = 10;
          columns = 3;
          spacing = 10;
          scrollbar = false;
          fixed-height = false;
          dynamic = true;
        };
        "element" = {
          padding = mkLiteral "4px 8px";
          spacing = mkLiteral "8px";
        };
        "element normal urgent" = {
          text-color = mkLiteral "@urgent";
        };
        "element normal active" = {
          text-color = mkLiteral "@accent";
        };
        "element selected" = {
          text-color = mkLiteral "@accent";
        };
        "element selected urgent" = {
          background-color = mkLiteral "@urgent";
        };
        "element-icon" = {
          size = mkLiteral "1em";
        };
        "element-text" = {
          text-color = mkLiteral "inherit";
        };
      };
    };
}
