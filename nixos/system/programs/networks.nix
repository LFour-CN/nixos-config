  { config, pkgs, ... }:
  {
   networking.hostName = "nixos"; # Define your hostname.

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking = {
    nameservers = [ "1.1.1.1" "8.8.4.4" ];
    useDHCP = pkgs.lib.mkDefault true;
    #If using dhcpcd:
    dhcpcd.enable = true;
    dhcpcd.persistent = false;
    dhcpcd.extraConfig = "nohook resolv.conf";

    # If using resolvconf:
    #    resolvconf = {
    #enable = true; # TODO remember to delete /etc/resolv.conf if you disable `resolvconf`
    #useLocalResolver = true;
    #};

    networkmanager = {
        enable = true;
        # If using NetworkManager:
        dns = "none";
        wifi.backend = "iwd";
        wifi.powersave = false;
      };

      wireless.iwd = {
        enable = true;
        settings = {
          #If using iwd:
          Network.NameResolvingService = "none";
          General = {
             EnableNetworkConfiguration = true;
      };
          IPv6 = {
            Enabled = true;
          };
          Scan = {
            DisablePeriodicScan = true;
      };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };

  #substituters mirrors
   nix = {
      settings = {
        substituters = [
          "https://mirror.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://cache.nixos.org"
        ];
      };
  };

  #hosts
   networking.hosts = {
     "140.82.114.4" = ["github.com"];
    };

    services.dnscrypt-proxy2 = {
       enable = true;
       settings = {
       listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];

      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [ "cloudflare" "cloudflare-ipv6" "cloudflare-security" "cloudflare-security-ipv6" "adguard-dns-doh" "mullvad-adblock-doh" "mullvad-doh" "nextdns" "nextdns-ipv6" "quad9-dnscrypt-ipv4-filter-pri" "google" "google-ipv6" "ibksturm" ];
      };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
    };

    environment.systemPackages = with pkgs; [
        iwgtk
        impala
  ];
}
