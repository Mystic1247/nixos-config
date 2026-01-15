{ ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
  ];

  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}