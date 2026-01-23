{ config, pkgs, ... }: {
  # This fixes "Podman installed" ✘
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Helps WinBoat if it looks for 'docker' commands
    defaultNetwork.settings.dns_enabled = true;
  };

  # This fixes "Podman Compose installed" ✘
  environment.systemPackages = [ pkgs.podman-compose ];

  # Grant yourself permission to use them
  users.users.mystic.extraGroups = [ "podman" ];
}