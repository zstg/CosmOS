{lib,...}: {
  # Don't deal with enabling Emacs here ...
  # home-manager.users.stig.home = {
  #   packages = [ pkgs.qutebrowser ];
  # };
  file.".config/doom" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}
