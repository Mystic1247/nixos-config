{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    helix
    vscode
    micro
    fastfetch
    hyfetch
    vesktop
    pear-desktop
    rmpc
    gnome-tweaks
    refine
    parabolic
    gnupg
  ];
}