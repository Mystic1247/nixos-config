{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    helix
    micro
    fastfetch
    hyfetch
    cava
    cavalier
    pear-desktop
    vesktop
    rmpc
    gnome-tweaks
    refine
    parabolic
    gnupg
    firefox
    obsidian
    nixfmt-rfc-style
    nil
    vscode
  ];
}
