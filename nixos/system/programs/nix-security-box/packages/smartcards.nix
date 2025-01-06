# Smartcard tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    cardpeek
    mfcuk
    mfoc
    python3Packages.emv
    
  ];
}
