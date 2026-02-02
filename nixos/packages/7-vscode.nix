{pkgs, lib, ...}:
{
  programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      defaultEditor = true;
      extensions = with pkgs.vscode-extensions; [
        # Extensions
        ms-dotnettools.csharp
        ms-dotnettools.csdevkit
        ms-dotnettools.vscode-dotnet-runtime
        ms-python.python
        ms-python.debugpy
        jnoortheen.nix-ide
        alefragnani.project-manager
        # Themes
        github.github-vscode-theme
        dhedgecock.radical-vscode
        mvllow.rose-pine
        carrie999.cyberpunk-2020
        thorerik.hacker-theme
      ];
    };
}