{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    zsh
    fish
    git
    spotify
    wget
    tree
    pantum-driver
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
  ];
}
