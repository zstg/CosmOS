{
  description = "Stig's NixOS ISOs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sddm-astronaut-theme = {
      url = "github:stratos-linux/sddm-astronaut-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae.url = "github:vicinaehq/vicinae";
  };

  outputs = { self, nixpkgs, home-manager, stylix, vicinae, zen-browser, ... } @ inputs:
    let
      system = "x86_64-linux";
      
      # Common ISO base
      commonIsoBase = edition: modules: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
          ({ lib, ... }: {
            isoImage.edition = edition;
            boot.supportedFilesystems.zfs = lib.mkForce false;
            environment.systemPackages = [ zen-browser.packages.${system}.default ];
            networking.networkmanager.enable = lib.mkForce true;
          })
        ] ++ modules;
      };

      # Common Home Manager config - FIXED: No system arg needed
      mkHomeManager = { user, stateVersion }: home-manager.nixosModules.home-manager {
        home-manager = {
          backupFileExtension = "/tmp/${toString self.lastModified}.bak";
          sharedModules = [
            vicinae.homeManagerModules.default
          ];
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${user} = {
            inherit stateVersion;
          };
        };
      };

      # Common standalone home configs
      mkStandaloneHome = name: hostDir: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./hosts/${hostDir}/home.nix
          stylix.homeManagerModules.stylix
        ];
        extraSpecialArgs = { inherit inputs system; };
      };
    in {
      packages.${system} = {
        default = self.nixosConfigurations.CosmOS-Hyprland.config.system.build.isoImage;
        CosmOS-GNOME = self.nixosConfigurations.CosmOS-GNOME.config.system.build.isoImage;
        CosmOS-Hyprland = self.nixosConfigurations.CosmOS-Hyprland.config.system.build.isoImage;
      };

      nixosConfigurations = {
        CosmOS-Hyprland = commonIsoBase "" [
          ./hosts/common
          ./hosts/CosmOS-Hyprland
          stylix.nixosModules.stylix

          # include the module *directly*
          home-manager.nixosModules.home-manager

          # then configure Home Manager options
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              vicinae.homeManagerModules.default
            ];
            home-manager.users.nixos = {
              imports = [ ./hosts/CosmOS-Hyprland/home.nix ];
              home.stateVersion = "25.11";
            };
          }
        ];

        CosmOS-GNOME = commonIsoBase "gnome" [
          ./hosts/common
          ./hosts/CosmOS-GNOME
          stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              vicinae.homeManagerModules.default
            ];
            home-manager.users.nixos = {
              imports = [ ./hosts/CosmOS-GNOME/home.nix ];
              home.stateVersion = "25.11";
            };
          }
        ];
      };

      homeConfigurations = {
        hyprland = mkStandaloneHome "hyprland" "CosmOS-Hyprland";
        gnome = mkStandaloneHome "gnome" "CosmOS-GNOME";
      };
    };
}
