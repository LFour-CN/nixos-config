# Tools for working with Android/iOS devices

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    abootimg
    androguard
    apkeep
    apktool
    dex2jar
    genymotion
    ghost
    morf
    payload-dumper-go
    scrcpy
    trueseeing
    
  ];
}