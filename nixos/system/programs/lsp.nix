{ pkgs, self, ... }:

{
  environment.systemPackages = with pkgs; [
    arduino-language-server
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
    ccls 
    emmet-language-server
    buf 
    cmake-language-server
    slint-lsp
    terraform-ls
    ansible-language-server
    hyprls
    helix-gpt
    pyright
    ruff
    ltex-ls
    vim-language-server
    bash-language-server
    lua-language-server
  ];  
}
