{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    shellAliases = {
      # NixOS shortcuts
      update = "sudo nixos-rebuild switch --flake ~/nixos/#spectre";
      test = "sudo nixos-rebuild test --flake ~/nixos/#spectre";
      nc = "nix-collect-garbage -d";
      
      # 
      # ls = "eza --icons --group-directories-first";
      # ll = "eza -lh --icons --group-directories-first";
      # cat = "bat";
    };

    initExtra = ''
      # Add any custom extra shell logic
      bindkey '^ ' autosuggest-accept # Ctrl+Space to accept suggestions
    '';
  };

  # starship
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # CLI tools
  programs.fzf.enable = true;
  programs.eza.enable = true;
  programs.bat.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}