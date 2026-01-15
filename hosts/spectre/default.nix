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

  services.logind = {
  lidSwitch = "ignore";
  lidSwitchExternalPower = "ignore";
  lidSwitchDocked = "ignore";
  extraConfig = ''
    HandlePowerKey=suspend
  '';
};

  # This is the "Birth Date" of the install. 
  # It should generally stay what it was when nixos was first installed.
  system.stateVersion = "25.05"; 
}