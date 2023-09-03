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
        "[╔═╡](fg:#888888)$status;$cmd_duration$line_break"
        "[╠══╡](fg:#888888)$username$directory$shell"
        "$git_branch"
        "$nix_shell"
        "$docker_context"
        "$time"
        "$line_break"
        "[╚╡](fg:#888888) "
      ];
      status = {
        success_symbol = " ";
        format = " code [$int]($style)";
        pipestatus_separator = " ⇒ ";
        pipestatus_format = "codes \[$pipestatus\]";
        pipestatus_segment_format = "[$int]($style)";
        disabled = false;
        pipestatus = true;
      };
      cmd_duration = {
        min_time = 0;
        format = " took [$duration]($style)";
      };
      username = {
        show_always = true;
        style_user = "bold fg:bright-yellow";
        style_root = "bold fg:red";
        format = " [$user]($style)";
        disabled = false;
      };
      directory = {
        format = " in [$path]($style)";
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
        format = " via [$indicator]($style)";
        unknown_indicator = "?";
        disabled = false;
      };
      nix_shell = {
        style = "fg:#86BBD8";
        format = " via [$state $name]($style)";
      };
      docker_context = {
        style = "fg:#06969A";
        format = " via [docker $context]($style)";
      };
      git_branch = {
        symbol = "";
        style = "fg:#FCA17D";
        format = " with [$symbol $branch]($style)";
      };
      time = {
        disabled = false;
        time_format = "%T";
        style = "fg:green";
        format = " at [$time]($style)";
      };
    };
  };
}