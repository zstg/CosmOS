# nix-index conflicts with the (preinstalled) command-not-found utility, so I disable that instead.
{pkgs, config,...}: {
  programs.command-not-found = {
    enable = false;
  };
}
