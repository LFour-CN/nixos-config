# Kubernetes infrastructure

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   
    checkov
    cirrusgo
    kdigger
    kube-score
    kubeaudit
    kubestroyer
    kubescape
    popeye
    
  ];
}
