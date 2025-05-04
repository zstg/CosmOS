# Since I'm using Flakes I don't need the nixos channels. I therefore declare:
{pkgs, config,...}: {
# Done in flake.nix itself
/*
  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
*/  
}
