{ config, lib, pkgs, inputs, ... }: 

{
  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      
      trusted-users = [ "root" "mystic" ]; 
      
      warn-dirty = false;
    };
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    registry.nixpkgs.flake = inputs.nixpkgs;
    
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}