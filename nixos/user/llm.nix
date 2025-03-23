{ pkgs, ... }:

{
  services.ollama.enable = false;
  services.ollama.acceleration = "cuda";

  home.packages = with pkgs; [
    ollama
  ];
}
