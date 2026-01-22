{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh"; 
    
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "extract" ];
    };

    shellAliases = {
      nix-switch = "nh os switch ~/nixos/ -h spectre";
      nix-test = "nh os test ~/nixos/ -h spectre";
      nix-clean = "nh clean all --keep 3";
      conf = "cd ~/nixos";
      vconf = "nvim ~/nixos";
      ls = "eza --icons --group-directories-first";
      tree = "eza --tree --icons";
      cat = "bat";
    };

    initContent = ''
      # Ctrl+Space to accept autosuggestions
      bindkey '^ ' autosuggest-accept
    '';
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = { };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      nix_shell = {
        symbol = "❄️ ";
        format = "via [$symbol$state]($style) ";
      };
    };
  };

  # Helpers
  programs.fzf.enable = true;
  programs.eza.enable = true;
  programs.bat.enable = true;
  programs.zoxide.enable = true;
  programs.direnv = { enable = true; nix-direnv.enable = true; };
}