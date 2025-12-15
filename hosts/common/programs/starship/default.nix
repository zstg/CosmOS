{...}: {
  programs.starship = {
    enable = true;
  };
  # home-manager.users.nixos.home.file.".config/starship.toml".text = builtins.readFile ./starship_config/.config/starship.toml;
  home-manager.users.nixos = {
    programs.starship = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
      enableZshIntegration = false;
      settings = builtins.fromTOML (builtins.readFile ./starship_config/.config/starship/tokyonight-dark/starship.toml);
    };
  };
}
