# Proxy tools for MitM scenarios

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    
    bettercap
    ettercap
    mitmproxy
    mubeng
    proxify
    proxychains
    redsocks
    rshijack
    zap
    
  ];
}
