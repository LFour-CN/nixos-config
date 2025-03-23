{config, lib, pkgs, callPackage, emacs-overlay, ...}:
{

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  };

  programs.vscode = {
    enable = true;
    #package = pkgs.vscode-with-extensions;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      #dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      ms-vscode.makefile-tools
      ms-vscode.live-server
      ms-vscode.hexeditor
      ms-vscode.cpptools-extension-pack
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      ms-vscode.anycode
      mkhl.direnv
      vadimcn.vscode-lldb
      twxs.cmake
      ms-python.python
      ms-python.debugpy
      ms-python.pylint
      ms-python.vscode-pylance
    ];
  };

}
