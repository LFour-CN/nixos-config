{ config, pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.segger-jlink.acceptLicense = true;

  # Enable unsecurity packages
  #nixpkgs.config.permittedInsecurePackages = [
    # "archiver-3.5.1"
  #];

  # Enable nftables
  networking.nftables = {
  enable = false;
  ruleset = ''
   table inet filter {
     chain input {
       type filter hook input priority 0; policy drop;

       # Allow loopback traffic
       iifname "lo" accept

        # Allow established and related connections
          ct state {established, related} accept

        # Allow SSH, DNS, HTTP, HTTPS
        tcp dport {22, 53, 80, 443} accept
        udp dport {53, 67} accept

        # Allow custom UDP ports
        udp dport 4000-4007 accept
        udp dport 8000-8010 accept

        # Log and drop all other traffic
        counter log prefix "INPUT_DROP: " group 0
        drop
     }

   chain output {
       type filter hook output priority 0; policy accept;
       }

   chain forward {
       type filter hook forward priority 0; policy drop;

       # Allow forwarding for established and related connections
        ct state {established, related} accept

       # Allow forwarding from virbr0 (KVM bridge) to external interface
       iifname "virbr0" accept

       # Log and drop all other forwarded traffic
       counter log prefix "FORWARD_DROP: " group 0
       drop
     }
   }

 table ip nat {
      chain PREROUTING {
        type nat hook prerouting priority -100; policy accept;
        # Add any necessary PREROUTING rules here
        }

    chain POSTROUTING {
        type nat hook postrouting priority 100; policy accept;
        # Assuming enp4s0 is your external interface
        oifname "enp4s0" masquerade
       }
   }
 '';
};

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

  # Enable CUPS to print documents.
  #services.printing.enable = true;
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  # };

  # USB Automounting
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  # Enable USB Guard
  #services.usbguard = {
  #  enable = true;
  #  dbus.enable = true;
  #  implicitPolicyTarget = "block";
    # TODO set yours pref USB devices (change {id} to your trusted USB device),
    #use "lsusb" command (from usbutils package) to get list of all connected USB devices
    #including integrated devices like camera, bluetooth, wifi, etc.
    #with their IDs or just disable `usbguard`
  #  rules = ''
  #        allow id 1d6b:0002 # Linux Foundation 2.0 root hub
  #        allow id 1d6b:0003 # Linux Foundation 3.0 root hub
  #        allow id 0bda:5411 # Realtek Semiconductor Corp. RTS5411 hub
  #        allow id 5986:118a # Bison Electronics Inc. Integrated Camera
  #        allow id 30fa:1701 # INSTANT USB GAMING MOUSE
  #        allow id 048d:c102 # Integrated Technology Express, Inc. ITE Device(8910)
        #  allow id 0489:e0cd # Foxconn / Hon Hai MediaTek Bluetooth Adapter
        #  allow id 1d6b:0003 # Linux Foundation 3.0 root hub
        #  allow id 0bda:0411 # Realtek Semiconductor Corp. Hub
        #  allow id 258a:013b # Sino Wealth USB Keyboard
        #  allow id 24a9:205a # ASolid USB
        #  allow id 1908:0226 # GEMBIRD MicroSD Card Reader/Writer
	#  allow id 1ea7:0064 # SHARKOON Technologies GmbH 2.4GHz Wireless rechargeable vertical mouse [More&Better]
   # '';
  #};

  # Enable clamav scanner
  #services.clamav = {
   # scanner = {
   #   enable = true;
   #   interval = "Sat *-*-* 04:00:00";
   #  };
   # daemon.enable = true;
   # fangfrisch.enable = true;
   # fangfrisch.interval = "daily";
   # updater.enable = true;
   # updater.interval = "daily"; #man systemd.time
   # updater.frequency = 12;
  #};

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
    };
 };

  environment.systemPackages = with pkgs; [
    #vulnix       #scan command: vulnix --system
    clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit   #scan command: sudo chkrootkit
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
  ];
}
