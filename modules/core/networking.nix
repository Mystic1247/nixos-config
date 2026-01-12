{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services.cloudflare-warp.enable = true;
}
