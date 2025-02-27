{ pkgs, ... }:

{
  services.ollama.enable = true;
  services.ollama.acceleration = "cuda";

  home.packages = with pkgs; [
    ollama
  ];
}
