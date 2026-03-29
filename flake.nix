{
  description = "Home Manager configuration of sarukiti";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }:
    {
      darwinConfigurations."sarukitinoMacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [
          ./nix-darwin/configuration.nix
          home-manager.darwinModules.home-manager
        ];
      };
    };
}
