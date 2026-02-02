{pkgs, lib, ... }:
{
  programs.nh = {
      enable = true;
      flake = "/etc/nixos";
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
}