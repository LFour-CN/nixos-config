{ pkgs, ... }:
{
  # Setup Env Variables
    environment.variables = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        #JDK_PATH = "${pkgs.jdk11}/";
        NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
  };
}
