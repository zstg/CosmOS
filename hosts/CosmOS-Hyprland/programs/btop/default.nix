{pkgs, config, lib,...}:
let
  globals = config._module.args.globals;
in
{
  home-manager.users.${globals.nixos_user}.home = {
    packages = [ pkgs.btop ];
    file.".config/btop" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}
