{ inputs, pkgs, ... }:
{
  # =================  auto-cpufreq power-profiles-daemon tlp choose one in those
  services.power-profiles-daemon.enable = false; #gnome
  # tlp
  services.tlp = {
      enable = true;
      settings = {
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
        # Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 50; # 50 and bellow it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 95;  # 100 and above it stops charging
      };
  };

  programs.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        turbo = "auto";
      };
      battery = {
        governor = "powersave";
        turbo = "auto";
        };
    };
  };
}
