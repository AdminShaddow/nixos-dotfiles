{pkgs, lib, ... }:
{
  systemd.user = {
    timers.battery-checker = {
      description = "Timer for Check for low battery";
      wantedBy = ["default.target"];
      partOf = [ "battery-checker.service" ];
      timerConfig = {
        OnCalendar = "minutely";
        #Unit = "battery-checker.service";
        Persistent = false;
      };
    };
    services.battery-checker = {
      description = "Check for low battery";
      path = with pkgs; [ bash acpi dunst ];
      wantedBy = ["default.target"];
      serviceConfig.Type = "simple";
      script = ''
        bash /home/marcelb/Schreibtisch/low-battery.sh
      '';
    };
  };
}