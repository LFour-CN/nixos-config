{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Enable Firewall
  networking = {
    nftables = {
      enable = true;
    };
    firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
      ];
    };
  };

   # Linux Kernel
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  #Enable SELinux
  #boot.kernelParams = [
  #  "splash"
  #  "quiet"
  #  "fbcon=nodefer"
  #  "vt.global_cursor_default=0"
  #  "kernel.modules_disabled=1"
  #  "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
  #  "usbcore.autosuspend=-1"
  #  "video4linux"
  #  "acpi_rev_override=5"
  #  "security=selinux"
  # ];

  #systemd.package = pkgs.systemd.override { withSelinux = true; };

  #environment.systemPackages = with pkgs; [
  #  policycoreutils
  #];

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

}
