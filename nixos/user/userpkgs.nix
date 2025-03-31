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

    chromium
    firefox
    pkgs.qq
    pkgs.wechat-uos
    (bilibili.overrideAttrs (oldAttrs: {
      version = "1.16.3";
    }))
    gimp-with-plugins
    krita
    inkscape-with-extensions
    libreoffice
    motrix
    bitcomet
    netease-cloud-music-gtk
    libsForQt5.okular 

###### Study ##################################

    #pkgs.geogebra
    ventoy-full
    shotcut

###### Embedded development ###################

    arduino-core 
    arduinoOTA 
    arduino-mk 
    arduino-ci 
    arduino-cli 
    arduino-ide 
    #freecad-wayland
    #kicad
    stm32cubemx

###### Wine ##################

    # winetricks (all versions)
    winetricks
    # support both 32-bit and 64-bit applications
    wineWowPackages.stable

###### Mind-Mapping #########

    freeplane

###### END ##################

  ];

}
