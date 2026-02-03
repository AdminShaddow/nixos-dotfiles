{ config, pkgs, inputs, ... }:

{
  xdg = {
    portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  # Authorization protocol
  security.polkit.enable = true;

  # Bootloader
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "zswap.enabled=1"
    ];
    initrd = {
      systemd = {
        dbus.enable = true;
        network.wait-online.enable = false;
      };
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "de_DE.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  # Keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Console Keymap
  console.keyMap = "de";

  # User Account
  users.users.marcelb = {
    isNormalUser = true;
    description = "Marcel Britner";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Gehört zu Flatpak
  systemd.services.flatpak-repo = {
  wantedBy = [ "multi-user.target" ];
  path = [ pkgs.flatpak ];
  script = ''       flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo     '';
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    permittedInsecurePackages = [
    ];
  };

  system.stateVersion = "25.05";
}
