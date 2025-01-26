{pkgs, ...}:
{
 environment.systemPackages = with pkgs; [
  libcamera
  ];

}
