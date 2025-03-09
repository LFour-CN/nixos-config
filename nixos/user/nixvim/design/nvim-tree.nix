{ pkgs, lib, nixvim, options, ... }:
{
  programs.nixvim.plugins = {
  nvim-tree = {
  enable = true;
  hijackCursor = true;
  openOnSetup = true;
  selectPrompts = true;

  };
  };
}
