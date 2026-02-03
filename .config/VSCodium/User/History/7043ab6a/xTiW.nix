{pkgs, lib, ... }:
{
  programs.tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs; [
      ];
      terminal = "kitty";
    };
}