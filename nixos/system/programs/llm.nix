{ pkgs, ... }:

{
  services.ollama.enable = true;
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
