{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;

  services.desktopManager.gnome.enable = true;

  services.flatpak.enable = true;

  services.libinput.enable = true;
}
