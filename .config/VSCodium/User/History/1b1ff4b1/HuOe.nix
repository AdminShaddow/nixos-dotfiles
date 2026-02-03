{pkgs, lib, ... }:
{
  services = {
    #
    openssh.enable = true;
    #
    zerotierone = {
      enable = true;
      package = pkgs.zerotierone;
      port = 9993;
    };
  };
}