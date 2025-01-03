{config, lib, ...}:
{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "bira";
    };
  shellAliases = {
    cde = "cd /etc/nixos";
    ll = "ls -l";
    update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
    garbage = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    flake = "cd /etc/nixos && sudo nix flake update";
    };
  history.size = 10000;
  };

}
