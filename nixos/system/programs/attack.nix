{ lib, config, pkgs, ...}:
{

environment.systemPackages = with pkgs; [

    spooftooph
    ubertooth
    crackle
    wireshark
    bettercap
    unhide

  ];

}
