{ config, lib, pkgs, inputs, ... }: # Note we added 'inputs' here!

{
  users.users.mystic = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.mystic = import ../../home/mystic;
  };

  programs.zsh.enable = true;
}