{ config, lib, pkgs, stdenv, fetchFromGithub, ... }: {
  #Enable Greetd Display Manager
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        #command = "${pkgs.hyprland}/bin/Hyprland";
        user = "nixos";
      };
      default_session = initial_session;
    };
  };

  environment.systemPackages = with pkgs;
    [
      greetd.tuigreet
      #read-edid 
      #edid-decode 
      #libdisplay-info 
    ];

  #Enable Hyprland
  services.xserver.enable = true;
  programs.hyprland.enable = true;

  # Multiple Monitors
  services.autorandr = {
    enable = true;
    profiles = {
      "work" = {
        config = {
          eDP-1 = {
            enable = true;
            #crtc = 1;
            primary = false;
            position = "1920x0";
            mode = "1920x1080";
            rate = "144.00";
            rotate = "normal";
          };
          HDMI-A-1 = {
            enable = true;
            #crtc = 0;
            primary = true;
            position = "0x0";
            mode = "1920x1080";
            rate = "100.00";
            rotate = "normal";
          };
        };
      };
    };
  };
}
