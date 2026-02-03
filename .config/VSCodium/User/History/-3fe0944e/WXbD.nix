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
      #rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    #
    scx = {
      enable = true;
      scheduler = "scx_rustland";
    };
  };
#-----
  nix = {
    optimise = {
      automatic = true;
      persistent = true;
    };
    settings = {
      auto-optimise-store = true;
      http-connections = 0;
      cores = 0;
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
  hardware = {
    amdgpu.overdrive.enable = true;
    bluetooth.enable = false;
  };
#-----
  systemd.oomd.enable = false;
#-----
  documentation.man.enable = false;
#-----
}