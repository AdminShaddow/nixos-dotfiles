{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./configuration.nix
      ./hardware-configuration.nix
      ./packages/librewolf.nix
      #./customPackages/endcord.nix
    ];
}