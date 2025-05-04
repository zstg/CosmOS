{ pkgs, lib,... }: {
  # Allow non-free software, but only for the specified package
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "canon-cups-ufr2" "cnijfilter2" "foomatic-db-nonfree" ];
  environment.systemPackages = with pkgs; [
    ghostscript
    gutenprint
    gutenprintBin
    foomatic-db
    foomatic-filters
    foomatic-db-ppds
    foomatic-db-engine
    foomatic-db-nonfree
    system-config-printer
    kdePackages.print-manager # preinstalled?
  ];
  services.printing = {
    enable = true;
    browsed.enable = true;
    drivers = with pkgs;[
      # canon-cups-ufr2
      cnijfilter2
      system-config-printer
    ];
  };
}
