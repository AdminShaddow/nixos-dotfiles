{pkgs, lib, ... }:
{
  services = {
    dbus.implementation = "broker";
    #
    lact.enable = true;
    #
    bpftune.enable = true;
    #
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    #
    
  };
}