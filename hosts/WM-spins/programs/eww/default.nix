{pkgs, lib, ...}: {
  home-manager.users.nixos = {
    programs.eww = {
    	enable = true;
    	enableBashIntegration = true;
    	enableZshIntegration = true;
    	enableFishIntegration = true;
    	configDir = ./eww_config/.config/eww;
    };
    home.sessionPath = [
      (builtins.toString (./. + "/eww_config/usr/local/bin"))
    ];
  };
}
