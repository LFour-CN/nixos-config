# Tools and libraries to access hardware

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  
    cantoolz
    chipsec
    cmospwd
    extrude
    #gallia
    hachoir
    packetry
    teensy-loader-cli
    termineter
    tytools
    python3Packages.can
    python3Packages.pyi2cflash
    python3Packages.pyspiflash
    
  ];
}
