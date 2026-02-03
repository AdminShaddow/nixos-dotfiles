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
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };
}