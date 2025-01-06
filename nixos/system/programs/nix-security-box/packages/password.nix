# Password and hashing tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    authoscope
    conpass
    crunch
    h8mail
    hashcat
    hashcat-utils
    hashdeep
    john
    legba
    nasty
    nth
    phrasendrescher
    thc-hydra

  ];
}
