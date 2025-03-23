# Forensic tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    afflib
    amoco
    ddrescue
    exiv2
    ext4magic
    extundelete
    foremost
    gef
    gzrt
    hivex
    hstsparser
    noseyparker
    ntfs3g
    ntfsprogs
    nwipe
    recoverjpeg
    safecopy
    sleuthkit
    srm
    testdisk
    volatility3
    wipe
    xorex

  ];
}
