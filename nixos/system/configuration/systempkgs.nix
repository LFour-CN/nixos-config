{ config, lib, pkgs, inputs, nixpkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    ###### START ################
    #(nixpkgs.legacyPackages.x86_64-linux.linux.override { stdenv = nixpkgs.legacyPackages.x86_64-linux.clangStdenv; })
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
    brightnessctl
    alsa-utils
    ncmpcpp
    coreutils-full
    pavucontrol # PulseAudio Volume Control
    pamixer # Command-line mixer for PulseAudio
    bluez # Bluetooth support
    bluez-tools # Bluetooth tools
    klibcShrunk
    ffmpeg-full
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
    p7zip
    pkgs.zsh
    pkgs.fish
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
    luarocks
    fzf
    ripgrep
    fd
    inputs.swww.packages.${pkgs.system}.swww

    ###### Nix ####################

    ###### C & C++ ################

    gcc_multi 
    #glibc_multi 
    #gccStdenv 
    gdb 
    cmake
    gnumake
    llvmPackages_latest.clang-tools
    llvmPackages_latest.lldb
    llvmPackages_latest.libllvm
    llvmPackages_latest.libcxx
    llvmPackages_latest.clang

    ###### JAVA ##################

    zulu23

    ###### Embedded Development ######
    #
    gcc-arm-embedded
    platformio
    openocd
    pkgs.dotnet-sdk
    pkgs.dotnet-runtime
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
    ###### GO ####################

    direnv

    ###### END ###################
  ];
}
