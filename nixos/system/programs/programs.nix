{ lib, pkgs, config, ...}:
{
  #Enable Java
  programs.java.enable = true;

  #Enable Direnv
  programs.direnv.enable = true;

  #Enable Steam
  programs.steam = {
  enable = true;
  };

  #Enable Zsh
  programs.zsh = {
    enable = true;
  };

  #Neovim
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

 #Fwupd
 # services.fwupd.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
    gcc-arm-embedded
    gcc
    gdb
    lldb
    cmake
    clang
    direnv
    stdenv
    gnumake
    zulu23
    zulu23
    mariadb
    nodejs
    cargo
    rustc
    hyprutils
    libcamera
    libclang
  ];

}
