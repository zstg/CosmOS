{...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = "[░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$git_branch$git_status[](fg:#394260 bg:#212736)$cmd_duration$python$nodejs$rust[](fg:#212736 bg:#1d2230)$nix_shell[ ](fg:#1d2230)";

      command_timeout = 3000;

      directory = {
        style = "fg:#e3e5e5 bg:#769ff0";
        format = "[ $path ]($style)";
        #truncation_length = 3
        #truncation_symbol = "…/"


        substitutions = {
          "~/Documents" = "󰈙";
          "~/Downloads" = " ";
          "~/Music" = " ";
          "~/Pictures" = " "; 
          "~/.config" = "";
          "~/Git" = "󰊢";
          "~" = "";
        };
      };

      nix_shell = {
        disabled = false;
        style = "fg:#769ff0 bg:#1d2230";
      	# impure_msg = "[impure shell](bold red)";
      	# pure_msg = "[pure shell](bold green)";
      	# unknown_msg = "[unknown shell](bold yellow)";
      	format = "[ via   $state( ($name) )]($style)";
      };
      git_branch = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
      };

      git_status = {
        style = "bg:#394260";
        format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      golang = {
        symbol = "ﳑ";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      cmd_duration = {
        disabled = false;
        style = "bg:#1d2230";
        format = "[[   $duration ](fg:#769ff0 bg:#212736)]($style)";
      };
    };
  };
}
