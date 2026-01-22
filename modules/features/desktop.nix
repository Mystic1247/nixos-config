{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-shell.enable = true;
  
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  services.flatpak.enable = true;

  services.libinput.enable = true;

  # Gnome Extentions
  environment.systemPackages = with pkgs; [
    # TODO: 
  ];

  # 
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    epiphany
  ]);
}