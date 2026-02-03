{pkgs, lib, config, ... }:
{
  imports = [
    ./0.1-other.nix
    ./1-audio.nix
    ./2-networking.nix
    ./3-performance.nix
    ./4-x11.nix
    ./5-displayManager.nix
  ];
}