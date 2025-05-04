{pkgs, lib,...}: {
  home-manager.users.stig.services.mako.enable = false;
  home-manager.users.stig.home = {
    packages = [ pkgs.libnotify pkgs.mako ];
    file.".config/mako" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
