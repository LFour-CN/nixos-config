{ pkgs, ... }:

{
  # Enable Theme
  environment.variables.GTK_THEME = "catppuccin-mocha-teal-standard";
  environment.variables.XCURSOR_THEME = "Catppuccin-Mocha-Teal";
  environment.variables.XCURSOR_SIZE = "16";
  environment.variables.HYPRCURSOR_THEME = "Catppuccin-Mocha-Teal";
  environment.variables.HYPRCURSOR_SIZE = "16";
  qt.enable = true;
  qt.platformTheme = "gnome";
  qt.style = "adwaita-dark";
  console = {
    earlySetup = true;
    colors = [
      "1e1e2e"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "cdd6f4"
      "5b6078"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "a5adcb"
    ];
  };

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["teal"]; };
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
      accents = [ "teal" ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      variant = "mocha";
    };
    discord = pkgs.discord.override {
      withOpenASAR = true;
      withTTS = true;
    };
  };

  environment.systemPackages = with pkgs; [
    numix-icon-theme-circle
    colloid-icon-theme
    catppuccin-gtk
    catppuccin-kvantum
    catppuccin-cursors.mochaTeal

  ];
}