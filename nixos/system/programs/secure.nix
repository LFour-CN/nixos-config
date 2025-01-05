{ config, pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Enable Firewall
  networking = {
    #firewall = {trustedInterfaces = [ "virbr0" ];};
    #nat = {
    #enable = true;
    #internalInterfaces = [ "virbr0" ];
    #externalInterface = "en4ps0";
    #forwardPorts = [
    #  {
    #    sourcePort = 3389;
    #    proto = "tcp";
    #    destination = "192.168.122.81:3389";
    #  }
    #  {
    #    sourcePort = 3389;
    #    proto = "udp";
    #    destination = "192.168.122.81:3389";
    #  }
    #];
    #};
    nftables = {
     firewall = {
      enable = true;
        snippets = {
          nnf-common.enable = true;
          #nnf-dhcpv6.enable = true;
          #nnf-drop.enable = true;
          #nnf-icmp = {
          #enable = true;
          #ipv4Types = [];
          #ipv6Types = [];
          #};
          #nnf-loopback.enable = true;
          #nnf-nixos-firewall.enable = true;
          #nnf-ssh.enable = true;
        };
      zones = {
        uplink = {
          interfaces = [ "en4ps0" "wlan0" "lo" "virbr0" "e1000e" "virtio" ];
          };
        local = {
          parent = "uplink";
          ipv4Addresses = [ "192.168.1.0/24" ];
          };
          #private = {
          #interfaces = [];
          #};
          #banned = {
          #ingressExpression = [
              #"ip saddr @banlist"
              #"ip6 saddr @banlist6"
          #];
          #egressExpression = [
              # "ip daddr @banlist"
              #"ip6 daddr @banlist6"
          #];
          #};
      };
      rules = {
        http = {
            from = "all";
            to = [ "fw" ];
            allowedTCPPorts = [ 80 443 ];
            allowedUDPPortRanges = [ { from = 4000; to = 4007; } { from = 8000; to = 8010; } ];
          };
          mqtt = {
          from = [ "local" ];
          to = [ "fw" ];
          allowedTCPPorts = [ 1883 ];
          };
          #private-ssh = {
          #from = "all";
          #to = [ "private" ];
          #allowedTCPPorts = [ 22 ];
          #};
          #private-outgoing = {
          #from = [ "private" ];
          #to = [ "uplink" ];
          #verdict = "accept";
          #};
          #ban = {
          #from = ["banned"];
          #to = "all";
          #ruleType = "ban";
          #extraLines = [
          #  "counter drop"
          #];
          #};
        };
      };
    };
  };

   # Linux Kernel
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  #Enable SELinux
  boot.kernelParams = [
    "security=selinux"
  ];
  #boot.kernelPatches = [ {
  #      name = "selinux-config";
  #      patch = null;
  #      extraConfig = ''
  #              SECURITY_SELINUX y
  #              SECURITY_SELINUX_BOOTPARAM n
  #              SECURITY_SELINUX_DISABLE n
  #              SECURITY_SELINUX_DEVELOP y
  #              SECURITY_SELINUX_AVC_STATS y
  #              SECURITY_SELINUX_CHECKREQPROT_VALUE 0
  #              DEFAULT_SECURITY_SELINUX n
  #            '';
  #      } ];
  systemd.package = pkgs.systemd.override { withSelinux = true; };

  # Enable CUPS to print documents.
  #services.printing.enable = true;
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

  # Enable Security Services
  #users.users.root.hashedPassword = "!";
  #security.tpm2 = {
    #enable = true;
    #pkcs11.enable = true;
    #tctiEnvironment.enable = true;
    #};
  #security.apparmor = {
    #enable = true;
    #packages = with pkgs; [
      #apparmor-utils
      #apparmor-profiles
      #];
    #};
  #services.fail2ban.enable = true;
  #security.pam.services.hyprlock = {};
  # security.polkit.enable = true;
  programs.browserpass.enable = true;
  services.clamav = {
    scanner = {
      enable = true;
      interval = "Sat *-*-* 04:00:00";
    };
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
      brave = {
        executable = "${lib.getBin pkgs.brave}/bin/brave";
        profile = "${pkgs.firejail}/etc/firejail/brave.profile";
      };
    };
  };

    # Enable Mullvad VPN
  #services.mullvad-vpn.enable = true;
  #services.mullvad-vpn.package = pkgs.mullvad-vpn; # `pkgs.mullvad` only provides the CLI tool, use `pkgs.mullvad-vpn` instead if you want to use the CLI and the GUI.

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
