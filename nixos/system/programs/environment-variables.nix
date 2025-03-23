{ lib, pkgs, ... }:
{
  #Setup Env Variables
    environment.variables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        XMODIFIERS = "@im=fcitx";
        NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
        HYPRSHOT_DIR="$HOME/Pictures/Screenshots";
  };

    environment.sessionVariables = {
        PATH = [ "/run/current-system/sw/bin" ];
    };

  environment.etc."bin/bash".source = "/run/current-system/sw/bin/bash";

}
