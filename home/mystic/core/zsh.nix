{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "extract" ];
    };

    shellAliases = {
      # 
      nix-switch = "nh os switch ~/nixos/ -h spectre";
      nix-test = "nh os test ~/nixos/ -h spectre";
      nix-clean = "nh clean all --keep 3";
      
      # Navigation
      conf = "cd ~/nixos";
      vconf = "nvim ~/nixos";
      
      # 
      ls = "eza --icons --group-directories-first";
      tree = "eza --tree --icons";
      cat = "bat";
    };

    # Keybindings
    initExtra = ''
      # Ctrl+Space to accept autosuggestions
      bindkey '^ ' autosuggest-accept
    '';
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

  # Helper tools that make the shell "Pro"
  programs.fzf.enable = true;
  programs.eza.enable = true;
  programs.bat.enable = true;
  programs.z-oxide.enable = true; # "z" is a smarter "cd" that remembers where you've been

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}