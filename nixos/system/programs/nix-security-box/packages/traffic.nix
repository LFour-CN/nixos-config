# Tools to capture network traffic

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   
    above
    dhcpdump
    dnstop
    driftnet
    goreplay
    joincap
    junkie
    ngrep
    sniffglue
    tcpdump
    tcpflow
    tcpreplay
    termshark
    wireshark
    wireshark-cli

  ];
}
