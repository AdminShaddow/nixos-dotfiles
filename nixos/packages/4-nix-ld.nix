{pkgs, lib, ... }:
{
  programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libopus
        libsodium
        miniaudio
      ];
    };
}