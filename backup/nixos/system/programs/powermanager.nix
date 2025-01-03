  {
  # =================  auto-cpufreq power-profiles-daemon tlp choose one in those
  services.power-profiles-daemon.enable = false; #gnome
  # tlp
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
       #Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
        USB_BLACKLIST_WWAN=1;
         WIFI_PWR_ON_AC="off";
         WIFI_PWR_ON_BAT="off";
        USB_AUTOSUSPEND = 0;
        RESTORE_DEVICE_STATE_ON_STARTUP=0;
        USB_ALLOWLIST="30fa:1701";
        USB_EXCLUDE_BTUSB=1;
        USB_EXCLUDE_PHONE=1;
        RUNTIME_PM_BLACKLIST="30fa:1701";
      };
    };

    #Enable Powertop
    #powerManagement.powertop = {
    #enable = false;
    #};
}
