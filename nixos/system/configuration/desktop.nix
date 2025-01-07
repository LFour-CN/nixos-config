 { config, lib, pkgs, stdenv, fetchFromGithub, ... }:
 {
  #Enable Greetd Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "nixos";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
  
  #Enable Hyprland
  services.xserver.enable = true;
  programs.hyprland.enable = true;
  
}
