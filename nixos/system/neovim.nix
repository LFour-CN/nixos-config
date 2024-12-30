{config, lib, pkgs, ...}:
{
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
  };
}
