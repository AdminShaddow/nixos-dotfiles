{pkgs, lib, ...}:
{
  programs.steam = {
      enable = true;
      package = pkgs.steam;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      #extest.enable = true;  #Whether to enable Load the extest library into Steam,
                              #to translate X11 input events to uinput events
                              #(e.g. for using Steam Input on Wayland) .
    };
}