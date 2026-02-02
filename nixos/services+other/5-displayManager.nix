{pkgs, lib, ... }:
{
  services = {
    displayManager = {
      ly = {
        enable = true;
        x11Support = true;
        settings = {
          path = "/run/current-system/sw/bin";
          restart_cmd = "/run/current-system/systemd/bin/systemctl reboot";
          service_name = "ly";
          shutdown_cmd = "/run/current-system/systemd/bin/systemctl poweroff";
          tty = 1;
          animation = "colormix";
          biglock = true;
        };
      };
    };
  };
}