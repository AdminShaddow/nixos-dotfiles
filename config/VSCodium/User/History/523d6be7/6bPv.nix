{pkgs, lib, ... }:
{
  systemd.user = {
    timer.battery-checker = {
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
      
    };
  };
}