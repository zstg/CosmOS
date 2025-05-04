{pkgs,...}:{
  services.dockerRegistry.enable = true;
  virtualisation = {
    docker = {
      enable = true;
      # enableOnBoot = true;
      # package = pkgs.docker;
      # rootless.enable = true;
      autoPrune.enable = true; # prunes weekly.
    };
  };
}
