{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      yzhang.markdown-all-in-one
      mkhl.direnv
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      ms-python.python
      llvm-vs-code-extensions.vscode-clangd
      ms-vscode-remote.remote-containers
      ms-vscode.cmake-tools
      ms-vscode.hexeditor
      # ms-vscode.remote-explorer
      ms-vscode.makefile-tools
      # ms-vscode.vscode-serial-monitor
      ms-toolsai.datawrangler
    ];
  };
}
