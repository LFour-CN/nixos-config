{ config, pkgs, ...}:
{

  services.pulseaudio.enable = false; # Use Pipewire, the modern sound subsystem

  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # Uncomment the following line if you want to use JACK applications
    # jack.enable = true;
  };

  services.mpd = {
  enable = true;
  musicDirectory = "/home/nixos/Music";
  extraConfig = ''
  audio_output {
    type "pipewire"
    name "My PipeWire Output"
    }
  '';
  };

}
