  { config, pkgs, ... }:
  {
   
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
   
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  #enable electron-30.5.1
  #nixpkgs.config.permittedInsecurePackages = [
   # "electron-30.5.1"
  #];
   
   }
