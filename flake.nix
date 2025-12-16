{
  description = "Stig's NixOS ISOs";

  inputs = {
    self.submodules = true;

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

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stratos-wallpapers = {
      url = "github:stratos-linux/stratos-wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, disko, stylix, vicinae, zen-browser, sddm-astronaut-theme, ... }:
    let
      system  = "x86_64-linux";
      version = "26.05";
      lib     = nixpkgs.lib;

      baseDiskoModule = {
        disko.devices.disk.main = {
          device = "/dev/disk/by-id/some-id"; # overridden by disko-install
          type   = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                type     = "EF00";
                size     = "1G";
                priority = 1;
                content = {
                  type        = "filesystem";
                  format      = "vfat";
                  mountpoint  = "/boot";
                  mountOptions = [ "umask=0777" ];
                };
              };

              root = {
                size = "100%";
                content = {
                  type       = "filesystem";
                  format     = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };

      # spin descriptor drives both nixosConfiguration and ISO derivation
      spins = {
        hyprland = {
          hostDir       = "CosmOS-Hyprland";
          edition       = "hyprland";
          withStylix    = true;
          withSddmTheme = true;
          withVicinae   = true;
        };

        niri = {
          hostDir       = "CosmOS-Niri";
          edition       = "niri";
          withStylix    = true;
          withSddmTheme = true;
          withVicinae   = true;
        };

        gnome = {
          hostDir       = "CosmOS-GNOME";
          edition       = "gnome";
          withStylix    = true;
          withSddmTheme = false;
          withVicinae   = false;  # GNOME: no vicinae
        };
      };

      mkNixosForSpin = spin:
        let
          inherit (spin) hostDir edition withStylix withSddmTheme withVicinae;
        in
        lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs system; };

          modules =
            [
              disko.nixosModules.disko
              baseDiskoModule
              "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
              ./hosts/${hostDir}
              {
                boot.supportedFilesystems.zfs = lib.mkForce false;

                environment.systemPackages = [
                  inputs.zen-browser.packages.${system}.default
                ];
                
                image.fileName = "CosmOS${if edition != "" then "-${edition}" else ""}-${toString self.lastModified}";
                isoImage = {
                  inherit edition;
                  makeEfiBootable = true;
                  makeUsbBootable = true;
                };

                imports = [ home-manager.nixosModules.home-manager ];

                home-manager = {
                  # useGlobalPkgs   = true;
                  useUserPackages = true;

                  sharedModules =
                    [ ]
                    ++ lib.optional withVicinae  vicinae.homeManagerModules.default;

                  users.nixos = {
                    imports = [ ./hosts/${hostDir}/home.nix ];
                    home.stateVersion = version;
                  };
                };
              }
            ]
            ++ lib.optional withStylix stylix.nixosModules.stylix
            ++ lib.optional withSddmTheme sddm-astronaut-theme.nixosModules.default;
        };

      mkStandaloneHome = name: hostDir:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./hosts/${hostDir}/home.nix
          ];
          extraSpecialArgs = { inherit inputs system; };
        };

      # concrete nixosConfigurations
      nixosCfgs = {
        Hyprland = mkNixosForSpin spins.hyprland;
        Niri     = mkNixosForSpin spins.niri;
        Gnome    = mkNixosForSpin spins.gnome;
      };

    in {
      nixosConfigurations = nixosCfgs;

      # ISO build packages (for `nix build .#Hyprland`, etc.)
      packages.${system} = {
        Hyprland = nixosCfgs.Hyprland.config.system.build.isoImage;
        Niri     = nixosCfgs.Niri.config.system.build.isoImage;
        Gnome    = nixosCfgs.Gnome.config.system.build.isoImage;
        default  = self.packages.${system}.Hyprland;
      };

      # Standalone HM configs (non-ISO use)
      homeConfigurations = {
        Hyprland = mkStandaloneHome "hyprland" "CosmOS-Hyprland";
        Niri     = mkStandaloneHome "niri"     "CosmOS-Niri";
        Gnome = mkStandaloneHome "gnome"       "CosmOS-GNOME";
      };
    };
}
