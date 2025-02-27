{ config, lib, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

###### START ################

######default############

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
    btop
    electron
    asciiquarium
    cowsay
    brightnessctl
    #busybox #Tiny versions of common UNIX utilities in a single small executable
    pavucontrol # PulseAudio Volume Control
    pamixer # Command-line mixer for PulseAudio
    bluez # Bluetooth support
    bluez-tools # Bluetooth tools
    klibcShrunk
    glib-networking
    ranger
    ghostty
    bear
    lsd
    tree
    lynx
    w3m

###### Daily #############

    nemo
    peazip
    pkgs.zsh
    pkgs.fish
    tmux
    polybar
    htop
    starship
    gedit
    mpv
    imv
    fastfetch
    blueman
    tlp
    lshw
    p7zip
    chromium

###### Hyprland ###########

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

###### Nix ####################

###### C & C++ ################

    gcc
    gdb
    #lldb
    cmake
    clang
    libclang
    clang-tools
    direnv
    stdenv
    gnumake

###### JAVA ##################

    zulu23

###### Embedded Development ######
    #
    gcc-arm-embedded
    platformio
    openocd
    pkgs.dotnet-sdk
    pkgs.dotnet-runtime
    uclibc-ng
    sail-riscv-rv64
   #
   ### STM32 ###
   #
    stlink
    stm32flash
    stm32loader
    stlink-tool
    stlink-gui
    #
    ### ESP32 ###
    #
    esptool
    espflash
    arduino-language-server
    #
###### Python #################

    python3Full


###### MySQL ##################

    mariadb
    mysql-shell

###### NodeJS #################

    nodejs

###### Rust ###################

    cargo
    rustc

###### END ###################
   ];
}
