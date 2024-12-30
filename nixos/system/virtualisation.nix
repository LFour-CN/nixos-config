{lib, config, pkgs, ...}:
{
  #programs.dconf.enable = true;
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["nixos"];
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd = {
    enable = true;
     qemu = {
       package = pkgs.qemu_kvm;
       runAsRoot = true;
       swtpm.enable = true;
       vhostUserPackages = [ pkgs.virtiofsd ];
       ovmf = {
          enable = true;
          packages = [(pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
       }).fd];
     };
    };
   };
  #networking.interfaces.enp4s0.ipv4.addresses = [{
  #address = "10.25.0.2";
  #prefixLength = 24;
  #}];
    # Enable Containerd
  # virtualisation.containerd.enable = true;

  # Enable Docker
  # virtualisation.docker.enable = true;
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
  # users.extraGroups.docker.members = [ "xnm" ];

  # Enable Podman
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      dockerSocket.enable = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  environment.variables.DBX_CONTAINER_MANAGER = "podman";
  users.extraGroups.podman.members = [ "nixos" ];

  environment.systemPackages = with pkgs; [
    # nerdctl

    # firecracker
    # firectl
    # flintlock

    distrobox
    qemu

    podman-compose
    podman-tui

    docker-compose
    # lazydocker
    # docker-credential-helpers
  ];
}
