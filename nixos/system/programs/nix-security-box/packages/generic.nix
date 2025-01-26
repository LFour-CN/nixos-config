# Generic tools (terminals, packers, clients, etc.)

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  
    chrony
    cyberchef
    dorkscout
    easyeasm
    exiflooter
    flashrom
    girsh
    gtfocli
    httpie
    hurl
    inetutils
    inxi
    #ioccheck
    iproute2
    iw
    lynx
    macchanger
    parted
    pwgen
    spyre
    utillinux
    wget
    xh

    # Monitoring
    btop
    iftop
    iotop

    # Terminal helpers
    eternal-terminal
    mosh
    shellz

    # Common client for various protocols
    certinfo-go
    cifs-utils
    freerdp
    net-snmp
    nfs-utils
    ntp
    openvpn
    samba
    step-cli
    wireguard-go
    wireguard-tools
    xrdp

    # Network design helpers
    ipcalc
    netmask

    # Terminal multiplexer
    tmux
    zellij

  ];
}
