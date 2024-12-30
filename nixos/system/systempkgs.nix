{ config, lib, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

###### START ################

######default############

    shadow
    sudo
    vim
    wget
    git
    curl
    unzip
    unrar
    pciutils
    usbutils
    fuse
    dhcpcd
    dhcping
    sl
    asciiquarium
    cowsay
    brightnessctl

###### Daily #############

    nemo
    peazip
    pkgs.zsh
    htop
    firefox
    starship
    gedit
    mpv
    imv
    fastfetch
    blueman
    tlp
    lshw
    p7zip

###### Hyprland ###########

    libsForQt5.qt5.qtwayland
    libsForQt5.qtutilities
    hyprland
    hyprutils
    pyprland
    xwayland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    waypaper
    hyprshot
    kitty
    waybar
    wofi
    wlogout
    dunst
    hyprshade
    hyprlang
    cairo
    libzip
    librsvg
    xcur2png
    tomlplusplus

###### Nix ###################

###### C & C++ ################

    gcc
    gcc_multi
    gdb
    lldb
    pkgs.cmake
    clang
    ccls
    pkgs.gtest
    pkgs.clang-tools
    llvmPackages_19.clang-unwrapped
    llvmPackages_19.clang-tools
    direnv
    stdenv
    gnumake
    glibc
    binutils
    stdenv.cc.cc
    gccStdenv

###### JAVA ##################

    zulu23
    javaPackages.openjfx23
    electron

###### Embedded Development ######
    #
    gcc-arm-embedded
    direnv
    platformio
    openocd
    uclibc-ng
   #
   ### STM32 ###
   #
    #stlink
    stm32flash
    stm32loader
    stlink-tool
    #stlink-gui
    #dotnet-sdk
    #dotnet-runtime
    #
    ### ESP32 ###
    #
    esptool
    espflash
    esptool-ck
    #
###### Python #################

    python3Full

###### NodeJS #################

    nodejs_23

###### Rust ###################

     cargo
     rustc
     rustfmt
     pkg-config
     clippy

###### END ###################
  ];

}
