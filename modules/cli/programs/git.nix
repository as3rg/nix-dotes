{
  config,
  pkgs,
  lib,
  ...
}: {
  programs = {
    git = {
      enable = true;
      settings.user = {
        name = "as3rg";
        email = "sergeev0xEF@gmail.com";
      };
      settings = {
         credential.helper = "store";
      };
    };
    diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
