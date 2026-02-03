{pkgs, lib, ... }:
{
  systemd.user = {
    timers.backup = {
      description = "Timer for Backup to GitHub";
      wantedBy = ["default.target"];
      partOf = [ "backup.service" ];
      timerConfig = {
        OnCalendar = "daily";
        #Unit = "backup.service";
        #RemainAfterElapse = true;
        Persistent = true;
      };
    };
    services.backup = {
      description = "Make Backup to Github";
      path = with pkgs; [ bash rsync git ];
      wantedBy = ["default.target"];
      serviceConfig.Type = "simple";
      script = ''
        bash /home/marcelb/Schreibtisch/Synchronization.sh
      '';
    };
  };
}