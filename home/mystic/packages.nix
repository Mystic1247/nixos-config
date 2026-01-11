{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    helix
    vscode
    micro
    vesktop
    fastfetch
    hyfetch
    pear-desktop
    rmpc
    gnome-tweaks
    refine
    parabolic
  ];
}
