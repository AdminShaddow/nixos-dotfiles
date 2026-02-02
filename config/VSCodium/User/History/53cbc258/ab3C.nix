{pkgs, lib, config, ... }:
{
  imports = [
    ./1-battery-checker.nix
    ./2-backup.nix
  ];
}