{pkgs, lib, ... }:
{
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
    btop
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
    y-cruncher
    tuxclocker
    ];
}