 { config, lib, pkgs, stdenv, fetchFromGithub, ... }:
 {
    #gnome
  #services.xserver.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;

    # Enable Hyprland
  services.xserver.enable = true;
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  #services.xserver.displayManager.sddm.enable = true;

}
