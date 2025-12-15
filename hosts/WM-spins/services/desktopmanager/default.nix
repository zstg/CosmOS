{pkgs, config, lib,...}: {
      environment.systemPackages = with pkgs; [
        eww
        grim slurp swappy
        playerctl
        swayosd
      ];
      imports = [ ../../programs ];
}
