{ config, pkgs, inputs, ... }:

{
  xdg = {
    portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

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

  systemd = {
    user.timers = {
      backup = {
        description = "Timer for Backup to GitHub";
        wantedBy = ["default.target"];
        partOf = [ "backup.service" ];
        timerConfig = {
          OnCalendar = "daily";
          #Unit = "backup.service";
          #RemainAfterElapse = true;
          Persistent = true;
        };
      };
      battery-checker = {
        description = "Timer for Check for low battery";
        wantedBy = ["default.target"];
        partOf = [ "battery-checker.service" ];
        timerConfig = {
          OnCalendar = "minutely";
          #Unit = "battery-checker.service";
          Persistent = false;
        };
      };
    };
    user.services = {
      backup = {
        description = "Make Backup to Github";
        path = with pkgs; [ bash rsync git ];
        wantedBy = ["default.target"];
        serviceConfig.Type = "simple";
        script = ''
          bash /home/marcelb/Schreibtisch/Synchronization.sh
        '';
      };
      battery-checker = {
        description = "Check for low battery";
        path = with pkgs; [ bash acpi dunst ];
        wantedBy = ["default.target"];
        serviceConfig.Type = "simple";
        script = ''
          bash /home/marcelb/Schreibtisch/low-battery.sh
        '';
      };
    };
  };

  # Nix
  nix = {
    # Store Optimization
    optimise = {
      automatic = true;
      persistent = true;
    };
    settings = {
      auto-optimise-store = true;
      http-connections = 0;
      cores = 0;
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Gehört zu Pipewire
  security.rtkit.enable = true;

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
      "imagemagick-6.9.13-10"
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  system.stateVersion = "25.05";
}
