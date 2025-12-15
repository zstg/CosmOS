{pkgs, lib, config, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "stratos-fonts" ];
  # this isn't actually necessary because the stratos-sddm flake sets this up automatically.
  # services.displaymanager.sddm = {
    # enable = true;
  # };
}
