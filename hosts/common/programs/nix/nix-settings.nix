# https://nixos-and-flakes.thiscute.world/best-practices/nix-path-and-flake-registry
{lib, inputs, ...}: {
  nix = {
    # package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs; # What does this do?
    channel.enable = false;
    settings = {
      sandbox = true;
      auto-optimise-store = true;
      trusted-users = [ "root" "stig" "@wheel" ];
      nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
      experimental-features = ["nix-command" "flakes"];
      #extra-substituters = ["https://nix-community.cachix.org"];
      #extra-trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    };
    optimise.automatic = true;
    gc.automatic = true;
    gc.options = "--delete-older-than 7d";
  };
  # NixPkgs settings
  /*
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  }
  */
  # environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
}
