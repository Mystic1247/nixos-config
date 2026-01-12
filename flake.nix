{
  description = "Mystic's Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.spectre = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/spectre

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Pointing to your new home entry point
            home-manager.users.mystic = import ./home/mystic; 
            
            # This passes 'inputs' to home-manager modules too
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
}