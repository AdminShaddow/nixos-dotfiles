{pkgs, lib, ... }:
{
  services = {
    dbus.implementation = "broker";
    lact.enable = true;
    bpftune.enable = true;
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    scx = {
      enable = true;
      scheduler = "scx_rustland";
    };
  };
#-----
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "max_performance";
  };
#-----
  hardware.amdgpu.overdrive.enable = true;
#-----
  systemd.oomd.enable = false;
#-----
  documentation.man.enable = false;
#-----
}