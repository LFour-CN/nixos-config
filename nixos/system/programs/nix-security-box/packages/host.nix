# Host security tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  
    checksec
    chkrootkit
    linux-exploit-suggester
    lynis
    vulnix
    
  ];
}
