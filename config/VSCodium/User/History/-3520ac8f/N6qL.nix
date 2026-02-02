{ config, pkgs, inputs, ... }:

let
  # directory of dotfiles
  dir-df = "/home/marcelb/dotfiles";

  df-vesktop = "${dir-df}/vesktop/settings.json";
  df-vencord = "${dir-df}/vesktop/settings/settings.json";

  mkFile = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
    "vesktop/settings.json" = {
      source = mkFile df-vesktop;
      force = true;
    };
    "vesktop/settings/settings.json" = {
      source = mkFile df-vencord;
      force = true;
    };
  };

  home.username = "marcelb";
  home.homeDirectory = "/home/marcelb";
  home.stateVersion = "25.05";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  services = {
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = false;
    };
  }

  programs = {
#—— Vesktop —————————————————————————————————————
    vesktop = {
      enable = true;
      vencord = {
      };
    };
#—— Btop ————————————————————————————————————————
    btop = {
      enable = true;
    };
#—— i3status-rust ———————————————————————————————
    i3status-rust = {
      enable = true;
    };
#—— Rofi ————————————————————————————————————————
    rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-calc
        rofi-file-browser
        rofi-nerdy
      ];
    };
#—— Alacritty ———————————————————————————————————
    alacritty = {
      enable = true;
      themePackage = pkgs.alacritty-theme;
    };
  };

  
  home.packages = with pkgs; [
    rofi-screenshot
    rofi-menugen
    rofi-mpd
    rofi-obsidian
    rofi-power-menu
    rofi-network-manager
    rofimoji
  ];
}
