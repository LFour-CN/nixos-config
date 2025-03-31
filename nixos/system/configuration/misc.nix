{ config, pkgs, ... }:

{

  # Enable flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Emulate x86 machinee to enable x86 support
  #boot.binfmt.emulatedSystems = [ "i686-linux" ];

  # A Kernel for high performance,but at the cost of sacrificing memory and power supply
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # Linux Latest Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Fonts
  system.fsPackages = [ pkgs.bindfs ];
  fileSystems = let
    mkRoSymBind = path: {
      device = path;
      fsType = "fuse.bindfs";
      options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    };
    aggregatedIcons = pkgs.buildEnv {
      name = "system-icons";
      paths = with pkgs;
        [
          libsForQt5.breeze-qt5 # for plasma
          #gnome.gnome-themes-extra
        ];
      pathsToLink = [ "/share/icons" ];
    };
    aggregatedFonts = pkgs.buildEnv {
      name = "system-fonts";
      paths = config.fonts.packages;
      pathsToLink = [ "/share/fonts" ];
    };
  in {
    "/usr/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
    "/usr/local/share/fonts" = mkRoSymBind "${aggregatedFonts}/share/fonts";
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-m18b.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
  fonts.fontDir.enable = true;
  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    maple-mono.NF 
    nerd-font-patcher
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  #NixOS Development
  environment.enableDebugInfo = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  #System version
  system.stateVersion = "25.05";

}
