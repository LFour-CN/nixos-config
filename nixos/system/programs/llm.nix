{ pkgs, ... }:

{
  services.ollama.enable = false;
  services.ollama.loadModels = [ ];
  services.ollama.acceleration = "cuda";

  environment.systemPackages = with pkgs; [
    ollama
    oterm
    alpaca
    nextjs-ollama-llm-ui
    aichat
    tgpt
    smartcat
  ];
}
