{ callPackage, pkgs, config, emacs-overlay, ... }: {

  # Enable Java
  programs.java.enable = true;

  # Enable Direnv
  programs.direnv.enable = true;

  # Enable Steam
  programs.steam = { enable = true; };

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
      vol = "alsamixer";
    };
  };

  # Emacs
  services.emacs.enable = true;
  services.emacs.package = pkgs.emacs-unstable;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "0anyp6miavan9js15jk7y6h4xgxd7i891q8sbfwg8drjmws6khj6";
    }))
  ];

  # Neovim
  environment.variables.EDITOR = "nvim";
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
    #gcc-arm-embedded
    #gcc_multi 
    #glibc_multi 
    #gccStdenv 
    #gdb
    #cmake
    #direnv
    #gnumake
    #zulu23
    #mariadb
    #nodejs
    #cargo
    #rustc
    #hyprutils
    #libcamera
    #openocd
    #stlink
    #coreutils-full
    #llvmPackages_latest.clang-tools
    #llvmPackages_latest.lldb
    #llvmPackages_latest.libllvm
    #llvmPackages_latest.libcxx
    #llvmPackages_latest.clang
  #];
}
