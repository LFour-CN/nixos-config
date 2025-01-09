{ config, pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.segger-jlink.acceptLicense = true;

  # Enable firewall
  networking.firewall = {
  enable = true;
  trustedInterfaces = [ "enp4s0" "wlan0" "virbr0" ];
  allowedTCPPorts = [ 22 53 80 443 ];
  allowedUDPPortRanges = [
    { from = 53; to = 67; }
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
    ];
    interfaces."virbr0".allowedTCPPorts = [ 80 443 ];
  };

   # Linux Kernel for Zen (A Kernel for high performance,but at the cost of sacrificing memory and power supply)
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  #Enable SELinux
  # FIXME This Will Try to build the Linux kernel locally.
  #boot.kernelParams = [
  #  "security=selinux"
 # ];
  #boot.kernelPatches = [ {
   #     name = "selinux-config";
   #     patch = null;
    #    extraConfig = ''
    #            SECURITY_SELINUX y
     #           SECURITY_SELINUX_BOOTPARAM n
    #            SECURITY_SELINUX_DEVELOP y
     #           SECURITY_SELINUX_AVC_STATS y
   #             DEFAULT_SECURITY_SELINUX n
    #          '';
    #    } ];

  #systemd.package = pkgs.systemd.override { withSelinux = true; };

  # Enable CUPS to print documents.
  #services.printing.enable = true;
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  # };

  # USB Automounting
  #services.gvfs.enable = true;
  services.udisks2.enable = true;
  # services.devmon.enable = true;

  # Enable USB Guard
  #services.usbguard = {
  #  enable = true;
  #  dbus.enable = true;
  #  implicitPolicyTarget = "block";
  #  # TODO: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
  #  rules = ''
  #    allow id {"24a9:205a"} # device 1
  #  '';
  #};

  # Enable clamav scanner
  #services.clamav = {
  #  scanner = {
  #    enable = true;
  #    interval = "Sat *-*-* 04:00:00";
  #  };
  #  daemon.enable = true;
  #  fangfrisch.enable = true;
  #  fangfrisch.interval = "daily";
  #  updater.enable = true;
  #  updater.interval = "daily"; #man systemd.time
    #updater.frequency = 12;
  #};

  #programs.firejail = {
    #enable = true;
    #wrappedBinaries = {
    # mpv = {
    #   executable = "${lib.getBin pkgs.mpv}/bin/mpv";
    #   profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
    # };
    # imv = {
    #   executable = "${lib.getBin pkgs.imv}/bin/imv";
    #   profile = "${pkgs.firejail}/etc/firejail/imv.profile";
    # };
    # brave = {
    #   executable = "${lib.getBin pkgs.brave}/bin/brave";
    #   profile = "${pkgs.firejail}/etc/firejail/brave.profile";
    # };
    #};
 #};

  environment.systemPackages = with pkgs; [
    #clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    #pkgs.libselinux
    #pkgs.checkpolicy
    #pkgs.setools
    #pkgs.libsepol
    #pkgs.semodule-utils
    #pkgs.swig
    #pkgs.audit
    #policycoreutils
    #libsemanage
  ];
}
