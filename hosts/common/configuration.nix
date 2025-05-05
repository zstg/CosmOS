{ pkgs,lib,...}: {
  documentation.man.generateCaches = false;
  isoImage.squashfsCompression = "xz -Xdict-size 100% -Xbcj x86";
  nixpkgs.hostPlatform = "x86_64-linux";
  users.mutableUsers = true;
  programs.fish.enable = true;
  users.users.stig = {
    shell = pkgs.fish;
    isNormalUser = true;
    initialPassword = "hello";
    description = "Stig";
    extraGroups = ["networkmanager" "wheel" "input" "video" "libvirtd" "dialout" "docker"];
  };

  imports = [
    # ./programs
    # ./services
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "23.05"; # Did you read the comment? # don't set it here, flakes overrides this
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
}
