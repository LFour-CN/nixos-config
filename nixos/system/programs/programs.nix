{ lib, pkgs, config, ...}:
{

  # Enable Java
  programs.java.enable = true;

  # Enable Direnv
  programs.direnv.enable = true;

  # Enable Steam
  programs.steam = {
  enable = true;
  };

  # Enable fish
  programs.fish = {
    enable = true;
    shellAliases = {
      li = "lsd --human-readable";
      tt = "tree";
      ls = "ls";
      F = "ranger";
      update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
      garbage = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      flake = "cd /etc/nixos && sudo nix flake update";
      rfbb = "rfkill block 2";
      rfub = "rfkill unblock 2";
      blon = "bluetooth on";
      blof = "bluetooth off";
      blctl = "bluetoothctl";
    };
  };

  # Enable tmux
  programs.tmux = {
    enable = true;
  };

  # Neovim
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
    gcc-arm-embedded 
    gcc 
    gdb 
    cmake 
    direnv 
    flac 
    gnumake 
    zulu23 
    mariadb 
    nodejs 
    cargo 
    rustc 
    hyprutils 
    libcamera 
    openocd 
    stlink 
    coreutils-full 
    uclibc-ng
    ccls 
    llvmPackages_latest.clang-tools 
    llvmPackages_latest.lldb 
    llvmPackages_latest.libllvm 
    llvmPackages_latest.libcxx 
    llvmPackages_latest.clang 
    
  ];
}
