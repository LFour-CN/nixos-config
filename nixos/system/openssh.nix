{

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  #services.openssh = {
  #  enable = true;
  #  ports = [ 22 ];
  #    settings = {
  #  PasswordAuthentication = true;
  #  AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
  #  UseDns = true;
  #  X11Forwarding = false;
  #  PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  # };
  #};
}
