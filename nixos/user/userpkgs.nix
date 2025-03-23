{pkgs, ...}:
{

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

    firefox
    pkgs.qq
    pkgs.wechat-uos
    #pkgs.feishu
    bilibili
    wiliwili
    gimp-with-plugins
    krita
    inkscape-with-extensions
    libreoffice
    motrix
    bitcomet
    netease-cloud-music-gtk
    libsForQt5.okular
    #pkgs.wpsoffice

###### Study ##################################

    #pkgs.geogebra
    ventoy-full
    shotcut
    #lmstudio
    #pkgs.jetbrains.clion
    #pkgs.jetbrains.pycharm-professional
    #pkgs.jetbrains.writerside
    #pkgs.jetbrains.webstorm
    #pkgs.jetbrains.pycharm-community
    #pkgs.jetbrains.idea-community
    #pkgs.jetbrains.jdk
    #pkgs.jetbrains.jcef

###### Embedded development ###################

    #arduino
    arduino-ide
    #freecad-wayland
    #kicad
    stm32cubemx

###### Wine ##################

    # winetricks (all versions)
    winetricks
    # support both 32-bit and 64-bit applications
    wineWowPackages.stable
    # native wayland support (unstable)
    #wineWowPackages.waylandFull

###### Mind-Mapping #########

    freeplane

###### END ##################

  ];

}
