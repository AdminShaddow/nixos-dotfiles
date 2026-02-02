{pkgs, lib, ... }:
{
  services = {
#-----
    flatpak.enable = true;
#----- (Bash)
    envfs.enable = true;
#----- (Thunar)
    gvfs.enable = true;
#-----
    printing.enable = true;
#-----
  };
} 