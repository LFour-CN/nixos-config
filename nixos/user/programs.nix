{config, lib, pkgs, ...}:
{

  #programs.kitty = {
  #  enable = true;
  #  extraConfig = "
  #   font_size 11.0
  #   detect_urls yes
  #   font_family      Operator Mono Book
  #   bold_font        Operator Mono Medium
  #   italic_font      Operator Mono Book Italic
  #   bold_italic_font Operator Mono Medium Italic
  #    ";
    #settings = {
      #confirm_os_window_close = 0;
      #dynamic_background_opacity = true;
      #enable_audio_bell = true;
      #mouse_hide_wait = "-1.0";
      #background_opacity = "0.7";
      #background_blur = 5;
    #};
  #};

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "bira";
    };
  shellAliases = {
    cde = "cd /etc/nixos";
    li = "lsd --human-readable";
    tt = "tree";
    ls = "ls";
    F = "ranger";
    update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
    garbage = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    flake = "cd /etc/nixos && sudo nix flake update";
    rfbb = "rfkill block 2";
    rfub = "rfkill unblock 2";
    blon = "bluetooth on";
    blof = "bluetooth off";
    blctl = "bluetoothctl";
    };
  history.size = 10000;
  };


  #programs.vscode = {
  #enable = true;
  #package = pkgs.vscodium;
  #extensions = with pkgs.vscode-extensions; [
    #dracula-theme.theme-dracula
    #yzhang.markdown-all-in-one
    #ms-vscode.makefile-tools
    #ms-vscode.live-server
    #ms-vscode.hexeditor
    #ms-vscode.cpptools-extension-pack
    #ms-vscode.cpptools
    #ms-vscode.cmake-tools
    #ms-vscode.anycode
    #mkhl.direnv
    #vadimcn.vscode-lldb
    #twxs.cmake
    #ms-python.python
    #ms-python.debugpy
    #ms-python.pylint
    #ms-python.vscode-pylance
    #];
  #};

}
