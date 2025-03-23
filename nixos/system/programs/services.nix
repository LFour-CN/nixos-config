{ config, pkgs, ...}:
{

  #systemd.enableUserServices = true;

  # Enable Hotspot
  #services.create_ap = {
  #  enable = true;
  # settings = {
  #    INTERNET_IFACE = "enp4s0";
    #    WIFI_IFACE = "wlan0";
    #    SSID = "NixOS-Linux-6.6.69";
    #    PASSPHRASE = "ex114514";
    #};
  # };

  # Systemd services
  systemd.services.wpa_supplicant.serviceConfig.TimeoutSec = "2";
  systemd.services.NetworkManager.serviceConfig.TimeoutSec = "2";
  systemd.services.journald.serviceConfig.TimeoutSec = "2";
  #systemd.services."udev-settle".serviceConfig.TimeoutSec = "2";
  services.journald = {
    storage = "persistent";
    rateLimitBurst = 10000;
    upload = {
    settings = {
    Upload = {
      NetworkTimeoutSec = "3s";
        };
      };
    };
    extraConfig = ''
      Storage=persistent
      SystemMaxUse=50M
      RuntimeMaxUse=50M
      MaxFileSec=1week
    '';
  };

  #services.flatpak.enable = true;
  #systemd.services.flatpak-repo = {
  #  wantedBy = [ "multi-user.target" ];
  #  path = [ pkgs.flatpak ];
  #  script = ''
  #    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #  '';
  #};
  #environment.systemPackages = [ pkgs.flatpak-builder ];

}
