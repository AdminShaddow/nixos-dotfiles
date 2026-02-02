{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./configuration.nix
      ./hardware-configuration.nix

      ./packages
      ./services+other
      ./systemd
      #./customPackages
    ];
}