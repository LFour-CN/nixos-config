{ lib, pkgs, config, ...}:
{
  #Enable Java
  programs.java.enable = true;

  #Enable Direnv
  programs.direnv.enable = true;

  #Enable Steam
  programs.steam = {
  enable = true;
  };

  #Enable Zsh
  programs.zsh = {
    enable = true;
  };

  #Neovim
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

}
