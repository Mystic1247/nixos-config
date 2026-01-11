{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
  ];

  home.username = "mystic";
  home.homeDirectory = "/home/mystic";
  home.stateVersion = "25.11";
}
