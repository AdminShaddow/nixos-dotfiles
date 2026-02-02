{config, pkgs, lib, ...}:
{
  imports =
  [
    # All normal packages
    ./pkgs.nix
    # All program packages
    ./firefox.nix
    ./hyprland.nix
    ./nh.nix
    ./nix-ld.nix
    ./st
  ];
}