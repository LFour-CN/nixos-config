{ config, lib, pkgs, ... }:
{   
  #Setup Env Variables
    environment.variables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        XMODIFIERS = "@im=fcitx";
        NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
        HYPRSHOT_DIR="$HOME/Pictures/Screenshots";
        #C_INCLUDE_PATH = "${pkgs.glibc_multi.dev}/include";
        #C_INCLUDE_PATH = "${pkgs.glibc_multi.dev}/include";
    };

    environment.sessionVariables = {
        PATH = [ "/run/current-system/sw/bin" ];
    };

    environment.extraOutputsToInstall = [ "dev" ];

    environment.etc."bin/bash".source = "/run/current-system/sw/bin/bash";

}
