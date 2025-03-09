{config, lib, pkgs, ...}:
{

  #programs.zsh = {
   # enable = true;
   # enableCompletion = true;
   # autosuggestion.enable = true;
   # syntaxHighlighting.enable = true;
   # oh-my-zsh = {
   #   enable = true;
   #   theme = "xiong-chiamiov";
   # };
   # shellAliases = {
   #   cde = "cd /etc/nixos";
   #   li = "lsd --human-readable";
   #   tt = "tree";
   #   ls = "ls";
   #   F = "ranger";
   #   update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
   #   garbage = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
   #   flake = "cd /etc/nixos && sudo nix flake update";
   #   rfbb = "rfkill block 2";
   #   rfub = "rfkill unblock 2";
   #   blon = "bluetooth on";
   #   blof = "bluetooth off";
   #   blctl = "bluetoothctl";
   # };
   # history.size = 10000;
  #};

  #programs.fish = {
  #  enable = true;
  #};

  #programs.tmux = {
  # enable = true;
  #};

  programs.vscode = {
    enable = true;
    #package = pkgs.vscode-with-extensions;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      ms-vscode.makefile-tools
      ms-vscode.live-server
      ms-vscode.hexeditor
      ms-vscode.cpptools-extension-pack
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      ms-vscode.anycode
      mkhl.direnv
      vadimcn.vscode-lldb
      twxs.cmake
      #ms-python.python
      ms-python.debugpy
      ms-python.pylint
      ms-python.vscode-pylance
    ];
  };
}
