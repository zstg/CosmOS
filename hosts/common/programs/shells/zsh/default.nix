{...}: {
  programs.zsh.enable = true;
  home-manager.users.stig.home.file = {
    ".config/zsh/zshrc".source = ./zshrc;
    ".config/zsh/omz-git.zsh".source = ./omz-git.zsh;
  };
}
