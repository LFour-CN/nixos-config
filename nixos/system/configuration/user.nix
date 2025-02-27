  { config, pkgs, ... }:
  {
  # Define a user account.
  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = [ "networkmanager" "wheel" "dialout"  "libvirtd" ];
    shell = pkgs.fish;
  };
}
