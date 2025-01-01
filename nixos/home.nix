{ config, pkgs, nixvim, ... }:
{

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
    imports = [

  ];

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Breeze-Dark";
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
        platformTheme.name = "gtk";
    style = {
      name = "gtk2";
      package = pkgs.libsForQt5.breeze-qt5;
    };
  };

  #xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
    #General.theme = "Catppuccin-Macchiato-Blue";
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
    ll = "ls -l";
    update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
    garbage = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    flake = "cd /etc/nixos && sudo nix flake update";
    };
  history.size = 10000;
  };




 home.packages = with pkgs;[


###### START ################

###### Dependences ##########

    (catppuccin-kvantum.override {
      accent = "blue";
      variant = "macchiato";
    })
    papirus-folders
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct # Magic for some Qt apps keep functionality.

###### Games ################

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

    #pkgs.geogebra

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
