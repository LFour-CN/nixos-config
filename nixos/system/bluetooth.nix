  { config, pkgs, ... }:
  {
  #enable bluetooth
   hardware.bluetooth.enable = true;
   hardware.bluetooth.powerOnBoot = false;
  }
