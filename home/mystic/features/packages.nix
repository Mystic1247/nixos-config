{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    helix
    vscode
    micro
    fastfetch
    hyfetch
    cava
    cavalier
    vesktop
    pear-desktop
    rmpc
    gnome-tweaks
    refine
    parabolic
    gnupg
    firefox
  ];
}