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

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 10;
    swapDevices = 1;
    writebackDevice = "/dev/disk/by-uuid/fa033541-9088-46ff-9282-a74330d3e555";
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
