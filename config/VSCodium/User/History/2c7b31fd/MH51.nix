{pkgs, lib, ... }:
{
  programs = {
    #
    fish.enable = true;
    #
    localsend = {
      enable = false;
      openFirewall = true;
    };
    #
  };
}