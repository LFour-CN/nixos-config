{ config, pkgs, ...}:
{
  imports = [

        ./packages/bluetooth.nix
        ./packages/cloud.nix
        ./packages/code.nix
        ./packages/container.nix
        ./packages/dns.nix
        ./packages/exploits.nix
        ./packages/forensics.nix
        ./packages/fuzzers.nix
        ./packages/generic.nix
        ./packages/hardware.nix
        ./packages/host.nix
        ./packages/information-gathering.nix
        ./packages/kubernetes.nix
        ./packages/ldap.nix
        ./packages/load-testing.nix
        ./packages/malware.nix
        ./packages/misc.nix
        ./packages/mobile.nix
        ./packages/network.nix
        ./packages/packet-generators.nix
        ./packages/password.nix
        ./packages/port-scanners.nix
        ./packages/proxies.nix
        ./packages/services.nix
        ./packages/smartcards.nix
        ./packages/terminals.nix
        ./packages/tls.nix
        ./packages/traffic.nix
        ./packages/tunneling.nix
        ./packages/voip.nix
        ./packages/web.nix
        ./packages/windows.nix
        ./packages/wireless.nix

  ];
}