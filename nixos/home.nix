{ config, pkgs, nixvim,  ... }:
{

  #Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  imports = [
    ./user/programs.nix
    ./user/llm.nix
    #./user/nixvim/nixvim.nix
    ./user/theme.nix
    ./user/userpkgs.nix
  ];

  #Home-manager version
  home.stateVersion = "25.05";


}
