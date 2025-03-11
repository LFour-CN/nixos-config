{config, pkgs, nixvim, ...}:
{
  imports = [
    ./design.nix
    ./dev.nix
    ./keyset.nix
    ./language.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = true;
      };
    };
  };
}
