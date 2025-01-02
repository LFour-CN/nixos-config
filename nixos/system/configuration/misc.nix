{ config, pkgs, ... }:
 
{

  #enable flake
  nix.settings.experimental-features = ["nix-command" "flakes"];

  #nix-collect-garbage
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  
  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
  
  #NixOS Development 
  environment.enableDebugInfo = true;
  
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";
  
  #System version
  system.stateVersion = "25.05"; 
  
}
