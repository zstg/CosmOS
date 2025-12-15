{
  description = "Stig's NixOS ISOs";

  inputs = {
    self.submodules = true; # since this flake uses submodules. This is purely optional, but it means one does not have to specify `?submodules=1` when checking this flake or building the ISO.
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
  };

  outputs = { self, nixpkgs, home-manager, disko, stylix, vicinae, zen-browser, sddm-astronaut-theme, ... } @ inputs:
    let
      system = "x86_64-linux";
      
      # Common ISO base
      commonIsoBase = edition: modules: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        modules = [
          disko.nixosModules.disko 
          {
            disko.devices = {
              disk = {
                main = {
                  device = "/dev/disk/by-id/some-id"; # When using disko-install, we will overwrite this value from the commandline
                  type = "disk";
                  content = {
                    type = "gpt";
                    partitions = {
                      ESP = {
                        type = "EF00";
                        size = "1G";
                        priority = 1; # set 1 esp on
                        content = {
                          type = "filesystem";
                          format = "vfat";
                          mountpoint = "/boot";
                          mountOptions = [ "umask=0777" ];
                        };
                      };
                      root = {
                        size = "100%";
                        content = {
                          type = "filesystem";
                          format = "ext4";
                          mountpoint = "/";
                        };
                      };
                    };
                  };
                };
                # other_disk = {};
              };
            };
          }
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
          ./hosts/common
          ({ pkgs, lib, ... }: {
            boot.supportedFilesystems.zfs = lib.mkForce false;
            environment.systemPackages = [ zen-browser.packages.${system}.default ];

            networking.networkmanager.enable = lib.mkForce true;
            systemd.services.live-nm-fix = {
              description = "Fix NetworkManager on live ISO (once)";
              wantedBy = [ "multi-user.target" ];
              before   = [ "multi-user.target" ];
              unitConfig = {
                # Only on live ISO
                ConditionKernelCommandLine = "live";
                # Not an installed system
                ConditionPathExists = [
                  "!/run/booted-system"
                  "!/run/live-nm-fixed"
                  "/run/current-system/iso-image"
                ];
              };
              serviceConfig = {
                Type = "simple";
                User = "root";
                Group = "root";
                ExecStart = "${pkgs.networkmanager}/bin/NetworkManager --no-daemon";
                ExecStartPost = ''
                    ${pkgs.coreutils}/bin/touch /run/live-nm-fixed
                '';
              };
            };


            isoImage = {
              edition = edition;
              isoName = "CosmOS${if edition != "" then "-${edition}" else ""}-#{self.lastModified}";
              makeEfiBootable = true;
              makeUsbBootable = true;
            };
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
        hyprland-iso = self.nixosConfigurations.hyprland-iso.config.system.build.isoImage;
        gnome-iso = self.nixosConfigurations.gnome-iso.config.system.build.isoImage;
        default = self.packages.${system}.hyprland-iso;
      };

      nixosConfigurations = {
        # TODO create a minimal ISO
        hyprland-iso = commonIsoBase "hyprland" [
          ./hosts/CosmOS-Hyprland
          stylix.nixosModules.stylix

          # This configures and sets up SDDM with the StratOS astronaut theme. No need to enable SDDM anywhere in the config.
          sddm-astronaut-theme.nixosModules.sddm-theme # TODO migrate this to WM-spins...?
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

        gnome-iso = commonIsoBase "gnome" [
          ./hosts/CosmOS-GNOME
          stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixos = {
              imports = [ ./hosts/CosmOS-GNOME/home.nix ];
              home.stateVersion = "25.11";
            };
          }
        ];
      };

      homeConfigurations = {
        hyprland-iso = mkStandaloneHome "hyprland" "hyprland-iso";
        gnome-iso = mkStandaloneHome "gnome" "gnome-iso";
      };
    };
}
