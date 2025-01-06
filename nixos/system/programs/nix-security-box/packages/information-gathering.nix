# Tools for informtion gathering

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    cloudbrute
    enumerepo
    holehe
    maigret
    metabigor
    socialscan
    theharvester
    urlhunter
    
  ];
}
