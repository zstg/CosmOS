{
  description = "Stig's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixos.url = "github:NixOS/nixos-hardware/master";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
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
          CosmOS-GNOME = self.nixosConfigurations.CosmOS-GNOME.config.system.build.isoImage;
          CosmOS-Hyprland = self.nixosConfigurations.CosmOS-Hyprland.config.system.build.isoImage;
        };
        nixosConfigurations = {
          CosmOS-Hyprland = nixpkgs.lib.nixosSystem {
		        specialArgs = { inherit inputs; };
            modules = [
              "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
              ({ ... }: {
                environment.systemPackages =  [
                  zen-browser.packages.${system}.default
                ];
              })
              ./hosts/common
              ./hosts/CosmOS-Hyprland
              stylix.nixosModules.stylix
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



          CosmOS-GNOME = nixpkgs.lib.nixosSystem {
		        specialArgs = { inherit inputs; };
            modules = [
              "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
              ({ lib,... }: {
                # boot.supportedFilesystems.zfs = lib.mkForce false;
                environment.systemPackages = [
                  zen-browser.packages.${system}.default
                ];
                networking.wireless.enable = lib.mkForce false;
              })
              ./hosts/common
              ./hosts/CosmOS-GNOME
              stylix.nixosModules.stylix
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
