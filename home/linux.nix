{ pkgs, system, config, ...}: {
  imports = [
    ./core.nix
    ./programs
  ];
}
