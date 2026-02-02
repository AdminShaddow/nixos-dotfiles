{ config, pkgs, inputs, ... }:

{
  imports =
    [
    ];


#                  Programs
  programs = {
#—— Localsend ———————————————————————————————————
    localsend = {
      enable = false;
      openFirewall = true;
    };
#—— Fish ————————————————————————————————————————
    fish.enable = true;
  };




#               Packages
  environment.systemPackages = with pkgs; [
    # Installers / Wrappers / Packager / etc..
    cmake
    cargo-tauri
    cargo
    rustc
    uv
    nodejs_24
    pkg-config
    git
    # Games
    (prismlauncher.override {
      jdks = [
        javaPackages.compiler.temurin-bin.jdk-21
        javaPackages.compiler.temurin-bin.jdk-8
        javaPackages.compiler.temurin-bin.jdk-17
        jdk17_headless
      ];
    })
    umu-launcher
    wine
    # Apps
    gimp
    lorien
    libreoffice-still
    lmms
    # Programmieren
    dotnet-sdk_9
    dotnet-runtime_9
    (python313.withPackages (
      subpkgs: with subpkgs; [
        requests
        matplotlib
        numpy
        ]
      )
    )
    # Customization
    fastfetch
    ascii-image-converter
    #bat
    gnome-themes-extra
    # For i3wm
    pulseaudio
    #i3-volume
    #i3altlayout
    #i3lock-fancy-rapid
    brightnessctl
    dunst
    #picom
    volctl
    qimgv
    # For Hyprland / Wayland
    hyprlauncher
    font-awesome
    swww
    wl-clicker
    wl-clip-persist
    # For IP-Camera
    ffmpeg
    mpv
    # X11 / Debugging / Tools
    #xmodmap
    #xev
    #xdotool
    #xclip
    xclicker
    #pciutils
    acpi
    # Networking
    arp-scan
    speedtest-cli
    # Packaging / Formatting / Disk
    gparted
    rpi-imager
    kdePackages.isoimagewriter
    kdePackages.ark
    unrar
    rar
    # Testing
    discordchatexporter-desktop
    #(import ./customPackages/endcord.nix)
    howl
    tofi
    clipse
    yazi
    hyprcursor
    hyprlock
    slurp
    grim
    slides
    abaddon
    qutebrowser
    ];

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
#—— Bpftune —————————————————————————————————————
    bpftune.enable = true;
#—— Ananicy (cpp) ———————————————————————————————
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
#—— scx (Scheduler "lavd") ——————————————————————
    scx = {
      enable = true;
      scheduler = "scx_rustland";
    };
#—— envfs ———————————————————————————————————————
    envfs.enable = true;
#—— OpenSSH —————————————————————————————————————
    openssh.enable = true;
#—— gvfs ————————————————————————————————————————
    gvfs.enable = true;
#—— zerotierone —————————————————————————————————
    zerotierone = {
      enable = true;
      package = pkgs.zerotierone;
      port = 9993;
    };
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
#—— Enable sound with pipewire ——————————————————
    pipewire = {
    enable = true;
    package = pkgs.pipewire;
    extraConfig.client = {
      "default" = {
        "stream.properties" = {
        "node.latency" = "1024/48000";
        "node.autoconnect" = true;
        "resample.disable" = false;
        #"resample.quality" = "4";
        "monitor.channel-volumes" = false;
        #channelmix.disable = false
        #channelmix.min-volume = 0.0
        #channelmix.max-volume = 10.0
        #channelmix.normalize = false
        #channelmix.mix-lfe = true
        #channelmix.upmix = true
        #channelmix.upmix-method = psd  # none, simple
        #channelmix.lfe-cutoff = 150.0
        #channelmix.fc-cutoff  = 12000.0
        #channelmix.rear-delay = 12.0
        #channelmix.stereo-widen = 0.0
        #channelmix.hilbert-taps = 0
        #dither.noise = 0
        #dither.method = none # rectangular, triangular, triangular-hf, wannamaker3, shaped5
        #debug.wav-path = ""
        };
      };
    };
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, default false
    jack.enable = false;

    # use the example session manager (no others are
    #packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    };
#—— Enable CUPS to print documents ——————————————
    printing.enable = true;
#—— Set DBus to Broker ——————————————————————————
    dbus.implementation = "broker";
#—— Systemd-resolved ————————————————————————————
    resolved.enable = true;
#—— Lact ————————————————————————————————————————
    lact.enable = true;
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
