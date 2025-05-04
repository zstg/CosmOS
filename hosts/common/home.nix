{pkgs,...}: {
  home-manager.users.stig = {
    home.packages = with pkgs; [
        micro
        wl-clipboard clipboard-jh
        ripgrep ripgrep-all
        killall
        fd
        bat
        eza
        delta
        unzip
        # pyprland.packages."${pkgs.system}".pyprland
        # snowfall-flake.packages."${pkgs.system}".flake
        # helix.packages."${pkgs.system}".helix
        # comma.packages."${pkgs.system}".comma
        # nix-alien.packages."${pkgs.system}".default
        /*
    # Create an FHS environment using the command `fhs`, enabling the execution of non-NixOS packages in NixOS!
    (let base = pkgs.appimageTools.defaultFhsEnvArgs; in
      pkgs.buildFHSUserEnv (base // {
      name = "fhs";
      targetPkgs = pkgs: (
        # pkgs.buildFHSUserEnv provides only a minimal FHS environment,
        # lacking many basic packages needed by most software.
        # Therefore, we need to add them manually.
        #
        # pkgs.appimageTools provides basic packages required by most software.
        (base.targetPkgs pkgs) ++ [
          pkgs.pkg-config
          pkgs.ncurses
          pkgs.appimage-run
          # Feel free to add more packages here if needed.
        ]
      );
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
      }))
    */
      ];
    };
}
