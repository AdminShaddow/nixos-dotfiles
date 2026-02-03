{pkgs, lib, ...}:
{
  programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      languagePacks = ["de"];
      policies = {
        Extensions.Install = [
        "https://addons.mozilla.org/firefox/downloads/file/4598854/ublock_origin-1.68.0.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4570378/privacy_badger17-2025.9.2.xpi"
        "https://addons.mozilla.org/firefox/downloads/file/4624137/tampermonkey-5.4.1.xpi"
        ];
        AutofillCreditCardEnabled = false;
        DefaultDownloadDirectory = "/home/marcelb/Downloads/";
        DisableForgetButton = true;
        DisableFirefoxAccounts = false;
        DisableTelemetry = true;
        Cookies.Behavior = "reject-foreign";
        SearchEngines.Default = "Google";
        PopupBlocking.Default = "true";
        GenerativeAI.Enabled = "false";
        DontCheckDefaultBrowser = true;
        Permissions = {
          Camera.BlockNewRequests = "true";
          Microphone.BlockNewRequests = "true";
          Location.BlockNewRequests = "true";
          Notifications.BlockNewRequests = "true";
          VirtualReality.BlockNewRequests = "true";
        };
      };
    };
}