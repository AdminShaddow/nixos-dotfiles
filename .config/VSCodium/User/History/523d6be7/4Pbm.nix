{pkgs, lib, ... }:
{
  systemd.user = {
    timer.battery-checker = {

    };
    service
  };
}