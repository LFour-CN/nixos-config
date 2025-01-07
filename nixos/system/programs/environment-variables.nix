{ pkgs, ... }:
{
  # Setup Env Variables
    environment.variables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
  };
}
