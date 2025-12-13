{ pkgs,lib,...}: {
  documentation.man.generateCaches = false;
  # "xz -Xbcj x86" and "xz -Xpreset 9 -Xbcj x86" don't work
  # isoImage.squashfsCompression = "zstd -Xcompression-level 19";
  # Use zstd instead of xz for compressing the liveUSB image, it's 6x faster and 15% bigger. See https://discourse.nixos.org/t/creating-a-nixos-live-cd-for-whole-system/35638/2
  isoImage.squashfsCompression = "zstd -Xcompression-level 6";
  nixpkgs.hostPlatform = "x86_64-linux";
  services.journald.extraConfig = ''
    Storage=none
  '';

  users.mutableUsers = true;
  programs.fish.enable = true;
  users.users.nixos = {
    shell = pkgs.fish;
    isNormalUser = true;
    initialPassword = "hello";
    description = "NOT the same as the live nixos user";
    extraGroups = ["networkmanager" "wheel" "input" "video" "libvirtd" "dialout" "docker"];
  };

  imports = [
    ./programs
    ./services
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "23.05"; # Did you read the comment? # don't set it here, flakes overrides this
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
}
