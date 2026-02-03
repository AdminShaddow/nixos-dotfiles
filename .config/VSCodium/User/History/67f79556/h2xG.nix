{config, pkgs, lib, ...}:
{
  imports =
  [
    # General
    ./0.1-programs.nix
    ./0.2-pkgs.nix
    # Specific
    ./1-firefox.nix
    ./2-steam.nix
    ./3-thunar.nix
    ./4-nix-ld.nix
    ./5-nh.nix
    ./6-hyprland.nix
    ./7-vscode.nix
    ./8-tmux.nix
  ];
}