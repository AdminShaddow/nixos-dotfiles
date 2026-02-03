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
#-----
  systemd.network = {
    enable = true;
    wait-online.enable = false;
    networks."10-wlan" = {
      matchConfig.name = "wlan0";
      networkConfig = {
        DHCP = "ipv4";
        IPv6AcceptRA = true;
      };
    };
  };
#-----
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
    firewall = {
      enable = true;
      trustedInterfaces = [ "" ];
    };
    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };
}