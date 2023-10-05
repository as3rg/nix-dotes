{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$status$cmd_duration$line_break"
        "$username$directory$shell"
        "$git_branch"
        "$nix_shell"
        "$docker_context"
        "$time"
        "$line_break"
        "[❱❱](fg:bright-yellow) "
      ];
      status = {
        success_symbol = "[0](fg:green)";
        format = "\\[[$int]($style)\\] ";
        pipestatus_separator = " ⇒ ";
        pipestatus_format = "\\[$pipestatus\\] ";
        pipestatus_segment_format = "[$int]($style)";
        disabled = false;
        pipestatus = true;
      };
      cmd_duration = {
        min_time = 0;
        format = "\\[[ $duration]($style)\\] ";
      };
      username = {
        show_always = true;
        style_user = "bold fg:bright-yellow";
        style_root = "bold fg:red";
        format = "\\[[ $user]($style)\\] ";
        disabled = false;
      };
      directory = {
        format = "\\[[$path]($style)\\] ";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
          "DotFiles" = " ";
          "Code" = " ";
        };
      };
      shell = {
        format = "\\[[󰆍 $indicator]($style)\\] ";
        unknown_indicator = "?";
        disabled = false;
      };
      nix_shell = {
        style = "fg:#86BBD8";
        format = "\\[[ $state $name]($style)\\] ";
      };
      docker_context = {
        style = "fg:#06969A";
        format = "\\[[ $context]($style)\\] ";
      };
      git_branch = {
        symbol = "";
        style = "fg:#FCA17D";
        format = "\\[[$symbol $branch]($style)\\] ";
      };
      time = {
        disabled = false;
        time_format = "%T";
        style = "fg:green";
        format = "\\[[ $time]($style)\\] ";
      };
    };
  };
}
