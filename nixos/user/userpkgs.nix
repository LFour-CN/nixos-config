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

    pkgs.qq
    pkgs.wechat-uos
    pkgs.feishu
    pkgs.bilibili
    wiliwili
    libreoffice
    motrix

###### Study ##################################

    #pkgs.geogebra
    ventoy-full

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

}
