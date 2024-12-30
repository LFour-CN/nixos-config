{ config, pkgs, ...}:
{
  #services.mpd = {
  #enable = true;
  #musicDirectory = "/home/nixos/Music";
  #extraConfig = ''
  #audio_output {
  #  type "pipewire"
  #  name "My PipeWire Output"
  #  }
  #'';
  #};

  # programs.ncmpcpp = {
  #  enable = true;
  #  mpdMusicDir = "/home/nixos/Music/";
  #  settings = {
  #    ncmpcpp_directory = "~/.local/share/ncmpcpp";
  #  };
  #};
}
