{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";
        prompt = "  ";
        icons = true;
        width = 40;
      };
      colors = {
        background = "101010EE";
        text = "E6E6E6FF";
        match = "FF9A00FF";
        selection = "FF9A00FF";
        selection-text = "101010FF";
        selection-match = "101010FF";
        border = "FF9A00FF";
        urgent = "FF5555FF";
      };
    };
  };
}
