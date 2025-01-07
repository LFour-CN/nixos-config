# Tools for working with web servers, web applications, APIs, etc.

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    albedo
    arjun
    brakeman
    cansina
    cariddi
    chopchop
    clairvoyance
    commix
    crackql
    crlfsuite
    dalfox
    dismap
    dirstalk
    dontgo403
    forbidden
    galer
    gau
    genzai
    gospider
    gotestwaf
    gowitness
    graphpython
    graphqlmap
    graphw00f
    hakrawler
    python3Packages.hakuin
    hey
    httpx
    nodePackages.hyperpotamus
    jaeles
    jsubfinder
    jwt-hack
    katana
    kiterunner
    mantra
    mitmproxy2swagger
    monsoon
    nikto
    nomore403
    ntlmrecon
    offat
    photon
    plecost
    scraper
    slowlorust
    snallygaster
    subjs
    uddup
    wad
    webanalyze
    websecprobe
    whatweb
    wpscan
    wsrepl
    wuzz
    xcrawl3r
    xnlinkfinder
    xsubfind3r

  ];
}
