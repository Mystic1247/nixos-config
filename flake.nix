{

  description = "Mystic's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
    let
      
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system config; };
      config = { allowUnfree = true; };

      lib = nixpkgs.lib;

    in {

      nixosConfigurations.nixos = lib.nixosSystem {

        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mystic = import ./home/mystic/home.nix;
          }
        ];

      };

    };

}
