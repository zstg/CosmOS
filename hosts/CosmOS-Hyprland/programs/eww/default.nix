{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.eww-wayland ];
  };
  file.".config/eww" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}
