{ config, pkgs, inputs, ... }:

{
  xdg = {
    portal = {
    enable = true;
    config.common.default = "gtk";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  services = {

#             Additional Services
#—— Flatpak —————————————————————————————————————
    flatpak.enable = true;
#—— envfs ———————————————————————————————————————
    envfs.enable = true;
#—— gvfs ————————————————————————————————————————
    gvfs.enable = true;
#—— X11 Server System ———————————————————————————
    xserver = {
      enable = false;
      displayManager.lightdm = {
        enable = false;
      };
      videoDrivers = [ "amdgpu" ];
      excludePackages = with pkgs; [ xterm ];
      #libinput.enable = true;
      windowManager.i3 = {
        enable = true;
      };
    };
    displayManager = {
      ly = {
        enable = true;
        x11Support = true;
        settings = {
          path = "/run/current-system/sw/bin";
          restart_cmd = "/run/current-system/systemd/bin/systemctl reboot";
          service_name = "ly";
          shutdown_cmd = "/run/current-system/systemd/bin/systemctl poweroff";
          tty = 1;
          animation = "colormix";
          biglock = true;
        };
      };
    };
#—— Enable CUPS to print documents ——————————————
    printing.enable = true;
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

  # Hardware
  hardware = {
    bluetooth.enable = false;
    amdgpu.overdrive.enable = true;
  };

  systemd.oomd.enable = false;

  # powerManagement
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "performance";
    scsiLinkPolicy = "max_performance";
  };

  systemd = {
    network = {
      enable = true;
      wait-online.enable = false;
      networks."10-wlan" = {
        matchConfig.name = "wlan0";
        networkConfig = {
          DHCP = "ipv4";
          IPv6AcceptRA = true;
        };
      };
    };
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

  # Networking
  networking = {
    useNetworkd = true;
    wireless.iwd.enable = true;
    networkmanager = {
      enable = false;
      wifi = {
        backend = "iwd";
        powersave = false;
      };
      dns = "systemd-resolved";
    };
    hostName = "nixos";
    firewall.enable = true;
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
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
      experimental-features = ["nix-command" "flakes"];
      cores = 0;
    };
  };

  documentation.man.enable = false;

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
