{ config, lib, pkgs, inputs, ... }: 

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/system
  ];

  networking.hostName = "nixos";
  time.timeZone = "Asia/Singapore";

  system.stateVersion = "25.05";
}

