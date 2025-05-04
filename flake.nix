{
  description = "Stig's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixos.url = "github:NixOS/nixos-hardware/master";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
    	url = "github:0xc000022070/zen-browser-flake";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, agenix, zen-browser, stylix, ... } @ inputs:
    let
    	system = "x86_64-linux";
    in 
      {
        packages.${system} = {
          default = self.nixosConfigurations.hyprland.config.system.build.isoImage;
          gnome = self.nixosConfigurations.gnome.config.system.build.isoImage;
          hyprland = self.nixosConfigurations.hyprland.config.system.build.isoImage;
        };
        nixosConfigurations = {
          hyprland = nixpkgs.lib.nixosSystem {
		        specialArgs = { inherit inputs; };
            modules = [
              ({ pkgs, ... }: {
                environment.systemPackages = with pkgs; [
                  zen-browser.packages.${system}.default
                ];
              })
              ./hosts/common
              stylix.nixosModules.stylix
              "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-base.nix"
              home-manager.nixosModules.home-manager {
                home-manager = {
                  backupFileExtension = "/tmp/${toString self.lastModified}.bak";
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.stig = {
                    home.stateVersion = "25.05";
                  };
                };
              }
            ];
          };         
          homeConfigurations = {
            hyprland = home-manager.lib.homeManagerConfiguration {
              pkgs = nixpkgs.legacyPackages.x86_64-linux;
              modules = [ ./hosts/hyprland/home.nix stylix.homeManagerModules.stylix ];
              extraSpecialArgs = { inherit inputs; };
            };
          };



          gnome = nixpkgs.lib.nixosSystem {
		        specialArgs = { inherit inputs; };
            modules = [
              ({ pkgs, ... }: {
                environment.systemPackages = with pkgs; [
                  zen-browser.packages.${system}.default
                ];
              })
              ./hosts/common
              stylix.nixosModules.stylix
              "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
              home-manager.nixosModules.home-manager {
                home-manager = {
                  backupFileExtension = "/tmp/${toString self.lastModified}.bak";
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.stig = {
                    home.stateVersion = "25.05";
                  };
                };
              }
            ];
          };         
          homeConfigurations = {
            gnome = home-manager.lib.homeManagerConfiguration {
              pkgs = nixpkgs.legacyPackages.x86_64-linux;
              modules = [ ./hosts/hyprland/home.nix stylix.homeManagerModules.stylix ];
              extraSpecialArgs = { inherit inputs; };
            };
          };
        };
      };
}
