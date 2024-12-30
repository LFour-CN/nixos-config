{ config, lib, pkgs, modulesPath, ... }:
{
  environment.enableDebugInfo = true;
  programs.direnv.enable = true;
}
