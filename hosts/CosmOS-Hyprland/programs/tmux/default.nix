{pkgs, lib,...}: {
  home-manager.users.stig.home = {
    packages = [ pkgs.tmux ];
  };
  file.".config/tmux" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}
