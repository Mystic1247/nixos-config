{ pkgs, ... }:

{
  home.packages = [ pkgs.nixfmt ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;

    profiles.default = {
      extensions = (with pkgs.vscode-extensions; [
        bbenoist.nix
        jnoortheen.nix-ide
        pkief.material-icon-theme
        christian-kohler.path-intellisense
      ]) ++ [
        (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "inci-august";
            name = "august-themes";
            version = "2.8.0";
          };
          hash = "sha256-IoHJJR3M0X6qBpwLc5CdRIPXnt4jbJh34lBMJ0R0AbA=";
        })
      ];

      userSettings = {
        "security.workspace.trust.untrustedFiles" = "open";
        "workbench.colorTheme" = "August - Drawbridge (Darker)";
        "workbench.activityBar.location" = "bottom";
        "update.showReleaseNotes" = false;
        "chat.disableAIFeatures" = true;
        "explorer.confirmDelete" = false;
        "git.openRepositoryInParentFolders" = "always";
        
        "chat.tools.terminal.autoApprove" = {
          "/^nix flake check$/" = {
            "approve" = true;
            "matchCommandLine" = true;
          };
        };

        "editor.fontSize" = 14;
        "editor.fontFamily" = "'Fira Code', 'monospace', monospace";
        "editor.fontLigatures" = true;
        "workbench.iconTheme" = "material-icon-theme";
        "editor.formatOnSave" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";

        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
          "editor.formatOnSave" = true;
        };
      };
    };
  };
}
