{ config, pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Enable clamav-scanner
    services.clamav.scanner = {
    enable = true;
    interval = "Sat *-*-* 04:00:00";
  };

  #Enable MAC Randomize
  #systemd.services.macchanger = {
    #enable = true;
   # description = "Change MAC address";
    #wantedBy = [ "multi-user.target" ];
    #after = [ "network.target" ];
   # serviceConfig = {
   #   Type = "oneshot";
    #  ExecStart = "${pkgs.macchanger}/bin/macchanger -r wlp0s20f3";
    #  ExecStop = "${pkgs.macchanger}/bin/macchanger -p wlp0s20f3";
    #  RemainAfterExit = true;
   # };
  #};

  #Enable Firewall
  #networking = {
   # nftables = {
    #  enable = false;
    #  ruleset = ''
     #   table inet filter {
      #    chain forward {
      #      type filter hook forward priority 0; policy drop;
    #        ct state related,established accept
    #        iif "virbr0" oif != "virbr0" counter accept
     #       oif "virbr0" counter masquerade
    #      }
   #     }
   #   '';
   # };
   # firewall = {
   # enable = false;
   # allowedTCPPorts = [ 80 443 ];
   # allowedUDPPortRanges = [
    #  { from = 4000; to = 4007; }
    #  { from = 8000; to = 8010; }
    #  ];
    #};
  #};

   # Linux Kernel
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  #Enable SELinux
  boot.kernelParams = [
    "splash"
    "quiet"
    "fbcon=nodefer"
    "vt.global_cursor_default=0"
    "kernel.modules_disabled=1"
    "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
    "usbcore.autosuspend=-1"
    "video4linux"
    "acpi_rev_override=5"
    "security=selinux"
   ];

  systemd.package = pkgs.systemd.override { withSelinux = true; };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  # };

  # USB Automounting
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
  #services.usbguard = {
  #  enable = true;
  #  dbus.enable = true;
  #  implicitPolicyTarget = "block";
  #  # FIXME: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
  #  rules = ''
  #    allow id {"24a9:205a"} # device 1
  #  '';
  #};

  # Enable USB-specific packages
  #environment.systemPackages = with pkgs; [
  #  usbutils
  #];
  # Enable Security Services
  users.users.root.hashedPassword = "!";
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };
  security.apparmor = {
    enable = true;
    packages = with pkgs; [
      apparmor-utils
      apparmor-profiles
    ];
  };
  services.fail2ban.enable = true;
  security.pam.services.hyprlock = {};
  # security.polkit.enable = true;
  programs.browserpass.enable = true;
  services.clamav = {
    daemon.enable = true;
    fangfrisch.enable = true;
    fangfrisch.interval = "daily";
    updater.enable = true;
    updater.interval = "daily"; #man systemd.time
    updater.frequency = 12;
  };
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      mpv = {
        executable = "${lib.getBin pkgs.mpv}/bin/mpv";
        profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
      };
      imv = {
        executable = "${lib.getBin pkgs.imv}/bin/imv";
        profile = "${pkgs.firejail}/etc/firejail/imv.profile";
      };
      telegram-desktop = {
        executable = "${lib.getBin pkgs.tdesktop}/bin/telegram-desktop";
        profile = "${pkgs.firejail}/etc/firejail/telegram-desktop.profile";
      };
      brave = {
        executable = "${lib.getBin pkgs.brave}/bin/brave";
        profile = "${pkgs.firejail}/etc/firejail/brave.profile";
      };
    };
  };

    # Enable Mullvad VPN
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn; # `pkgs.mullvad` only provides the CLI tool, use `pkgs.mullvad-vpn` instead if you want to use the CLI and the GUI.

  environment.systemPackages = with pkgs; [
    vulnix       #scan command: vulnix --system
    clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit   #scan command: sudo chkrootkit
    # passphrase2pgp
    pass-wayland
    pass2csv
    passExtensions.pass-tomb
    passExtensions.pass-update
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-audit
    tomb
    pwgen
    pwgen-secure
    mullvad-closest
    pkgs.libselinux
    pkgs.checkpolicy
    pkgs.setools
    pkgs.libsepol
    pkgs.semodule-utils
    pkgs.swig
    pkgs.audit
    #policycoreutils
    #libsemanage
  ];
}
