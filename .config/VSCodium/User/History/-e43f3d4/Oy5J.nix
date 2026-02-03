{pkgs, lib, ... }:
{
  services = {
#-----
    openssh.enable = true;
#-----
    zerotierone = {
      enable = true;
      package = pkgs.zerotierone;
      port = 9993;
    };
#-----
    resolved.enable = true;
#-----
  };

  networking = {
    useNetworkd = true;
    wireless.iwd.enable = true;
    networkmanager = {
      enable = false;
      wifi = {
        backend = "iwd";
        powersave = false;
      };
      dns = "systemd-resolved";
    };
    hostName = "nixos";
    firewall.enable = true;
    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };
}