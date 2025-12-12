# globals.nix
{ inputs, lib, ... }:
{
  options.global_options = {
    nixos_user = lib.mkOption {
      type = lib.types.str;
      default = "stig";
      description = "NixOS username";
    };
  };

  # Only use cfg in config section, never in options
  config = let
    # cfg is safe here; we don't depend on imports
    nixos_user = "stig";  # or use config.global_options.nixos_user after options are merged
    homeDir    = "/home/${nixos_user}";
    heimvar    = inputs.home-manager.users.${nixos_user};
    heim       = heimvar.home;
  in {
    _module.args.globals = rec {
      inherit nixos_user homeDir heimvar heim;

      mkUserHome = { stateVersion ? "25.11" }: {
        home.username     = nixos_user;
        home.homeDirectory = homeDir;
        home.stateVersion = stateVersion;
      };
    };
  };
}
