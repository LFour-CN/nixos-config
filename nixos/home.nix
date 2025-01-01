{ config, pkgs, nixvim, ... }:
{

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
    imports = [
     #./config/nixvim/start.nix
  ];

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };


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
    ll = "ls -l";
    update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
    garbage = "sudo nix-collect-garbage -d";
    flake = "cd /etc/nixos && sudo nix flake update";
    };
  history.size = 10000;
  };




 home.packages = with pkgs;[


###### START ################

###### Games #############

    hmcl

###### Daily ################

    pkgs.qq
    pkgs.wechat-uos
    pkgs.feishu
    pkgs.bilibili
    wiliwili
    libreoffice
    motrix

###### Study ##################################

    pkgs.geogebra

###### Embedded development ###################

    arduino
    freecad-wayland
    kicad
    stm32cubemx

###### Wine ##################

    # winetricks (all versions)
    winetricks
    # native wayland support (unstable)
    wineWowPackages.waylandFull

###### Mind-Mapping #########

    freeplane

###### END ##################

  ];


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
