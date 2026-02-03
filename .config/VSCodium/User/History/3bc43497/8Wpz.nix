{pkgs, lib, ... }:
{
  services = {
    flatpak.enable = true;

    envfs.enable = true;

    gvfs.enable = true;
  };
} 