{pkgs, lib, ... }:
{
  services = {
    xserver = {
      enable = false;
      displayManager.lightdm = {
        enable = false;
      };
      videoDrivers = [ "amdgpu" ];
      excludePackages = with pkgs; [ xterm ];
      #libinput.enable = true;
      windowManager.i3 = {
        enable = true;
      };
    };
  };
} 