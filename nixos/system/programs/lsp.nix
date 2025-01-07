{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  
    python311Packages.python-lsp-server
    nodePackages_latest.nodemon
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodePackages_latest.bash-language-server
    vue-language-server
    sumneko-lua-language-server
    marksman
    markdown-oxide
    nil
    zls
    gopls
    delve
    emmet-language-server
    buf
    cmake-language-server
    slint-lsp
    terraform-ls
    ansible-language-server
    hyprls
    helix-gpt
    
  ];  
}
