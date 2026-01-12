{ config, lib, pkgs, inputs, ... }: 

{
  imports = [
    # 1. Physical Hardware
    ./hardware-configuration.nix

    # 2. The Logic Bundles
    ../../modules/core
    ../../modules/features
  ];

  # Machine Identity
  networking.hostName = "spectre";
  time.timeZone = "Asia/Singapore";

  # This is the "Birth Date" of your install. 
  # It should generally stay what it was when you first installed.
  system.stateVersion = "25.05"; 
}