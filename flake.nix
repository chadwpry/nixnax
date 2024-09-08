{
  description = "Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";
  };

  outputs = inputs@{
    home-manager,
    nix-darwin,
    nixos-wsl,
    nixpkgs,
    self,
    ...
  }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      debug = false;

      systems = [ "x86_64-linux" "aarch64-darwin" ];

      imports = [
        inputs.nixos-flake.flakeModule
      ];

      flake = {
        nixosConfigurations.crash = self.nixos-flake.lib.mkLinuxSystem {
          imports = [
            ./hosts/crash
            ./common/configuration.nix
            ./common/users.nix
            ./common/autoupgrade.nix
            nixos-wsl.nixosModules.default
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.shadow = import ./home-manager/shadow.nix;
            }
          ];
        };

        darwinConfigurations.bass = self.nixos-flake.lib.mkMacosSystem {
          imports = [
            ./hosts/bass
            ./common/configuration.nix
            home-manager.darwinModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.shadow = import ./home-manager/shadow.nix;
            }
          ];
        };
      };

      perSystem = { self', inputs', pkgs, system, config, ... }: {
        legacyPackages.homeConfiguration.shadow = 
          self.nixos-flake.lib.mkHomeConfiguration pkgs {
            imports = [
              ./home-manager/shadow.nix
            ];
          };

        packages.default = self'.packages.activate;
      };
    };
}
