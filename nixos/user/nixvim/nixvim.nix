{config, pkgs, nixvim, ...}:
{
  imports = [
    ./design/use.nix
    ./dev/use.nix
    ./keyset/use.nix
    ./language/use.nix
    ./misc/use.nix
  ];

  programs.nixvim = {
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = true;
      };
    };
  };
}
