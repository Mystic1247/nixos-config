{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    zsh
    fish
    git
    wget
    tree
    pantum-driver
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
  ];
}
