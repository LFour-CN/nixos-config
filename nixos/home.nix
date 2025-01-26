{ config, pkgs, nixvim,  ... }:
{

  #Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  imports = [
    ./user/programs.nix
    ./user/theme.nix
    ./user/userpkgs.nix
    ./user/nixvim/nixvim.nix
  ];

  #Home-manager version
  home.stateVersion = "25.05";


}
