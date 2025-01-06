# Code analysing tools, incl. search for secrets and alike in code

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  
    bomber-go
    cargo-audit
    credential-detector
    deepsecrets
    detect-secrets
    freeze
    git-secret
    gitjacker
    gitleaks
    gitls
    gitxray
    gokart
    legitify
    osv-detector
    packj
    pip-audit
    secretscanner
    skjold
    tell-me-your-secrets
    trufflehog
    xeol
    
  ];
}
