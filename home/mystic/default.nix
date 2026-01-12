{ config, lib, pkgs, inputs, ... }:

{
  home.username = "mystic";
  home.homeDirectory = "/home/mystic";
  home.stateVersion = "25.11";

  imports = [
    ./core
    ./features
  ];

  nixpkgs.config.allowUnfree = true;
}
