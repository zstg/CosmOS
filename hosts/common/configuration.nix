{ pkgs,config,...}: {
  # Include agenix configuration here because it seems to work

  # Home manager only works on already existing users.
  # So we define users in a normal nixosModule (as opposed to a homeManagerModule).
  users.users.mutableUsers = true;
  users.users.stig = {
    shell = pkgs.fish;
    isNormalUser = true;
    initialPassword = "hello";
    description = "Stig";
    extraGroups = ["networkmanager" "wheel" "input" "video" "libvirtd" "dialout" "docker"];
  };

  imports = [
    # Do not import homeManagerModule as nixosModules.
    # ./disko.nix
    ./plymouth.nix
    ./programs
    ./services
  ];

  environment.systemPackages = with pkgs; [
    git
    starship # shit causes problems at times when installed at user-level
    libsForQt5.qt5.qtgraphicaleffects # systemsettings may need this
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "23.05"; # Did you read the comment? # don't set it here, flakes overrides this
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
}
