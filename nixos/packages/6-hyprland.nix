{pkgs, lib, ... }:
{
  programs.hyprland = {
      enable = true;
      withUWSM = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
}