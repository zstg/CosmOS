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
          gnome = self.nixosConfigurations.hyprland.config.system.gnome.isoImage;
          hyprland = self.nixosConfigurations.hyprland.config.system.hyprland.isoImage;
        };
        nixosConfigurations = {

          Krypton = nixpkgs.lib.nixosSystem {
		        specialArgs = { inherit inputs; };
            modules = [
              ({ pkgs, ... }: {
                nixpkgs.overlays = [ 
            	    rust-overlay.overlays.default 
                ];
                environment.systemPackages = with pkgs; [
                  zen-browser.packages.${system}.default
                ];
              })

              stylix.nixosModules.stylix
              ./hosts/Krypton/configuration.nix

              
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

          vm = nixpkgs.lib.nixosSystem {
		    specialArgs = { inherit inputs; };
            modules = [
              ({... }: { environment.systemPackages = [ zen-browser.packages.${system}.default agenix.packages.${system}.default ]; })
              agenix.nixosModules.default {
                age.secrets = {
                  git-credentials = {
                    file = ./hosts/Krypton/secrets/git-credentials.age;
                    mode = "777";
                    owner = "stig";
                    group = "wheel";
                  };
                  password = {
                    file = ./hosts/Krypton/secrets/password.age;
                    owner = "stig";
                    group = "wheel";
                  };
                };
              }
              stylix.nixosModules.stylix
              ./hosts/vm/configuration.nix
			  "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
              
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
            krypton = home-manager.lib.homeManagerConfiguration {
              pkgs = nixpkgs.legacyPackages.x86_64-linux;
              modules = [ ./hosts/Krypton/home.nix stylix.homeManagerModules.stylix ];
              extraSpecialArgs = { inherit inputs; };
            };

            vm = home-manager.lib.homeManagerConfiguration {
              pkgs = nixpkgs.legacyPackages.x86_64-linux;
              modules = [ ./hosts/vm/home.nix stylix.homeManagerModules.stylix ];
              extraSpecialArgs = { inherit inputs; };
            };
          };
        };
      };
}
