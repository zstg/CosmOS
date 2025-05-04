{config,...}: {
  programs.git = {
    enable = true;
    config = {
      credential = {
        helper = "store";
        # helper = "store --file ${config.age.secrets.git-credentials.path}"; # from agenix
      };	
      user = {
        email = "o0vckutt@duck.com";
        name = "zstg";
      };
      core = {
        pager = "delta";	
      };
      interactive = {
        diffFilter = "delta --color-only"; # requires delta	
      };
      delta = {
        navigate = true; # use n and N to move between different sections
        light = false;	 # set to true if you\'re in a terminal with a light background color (e.g. the default macOS terminal)
        side-by-side = true;
        line-numbers = false;
      };
      merge = {
        conflictStyle = "diff3";	
      };
      diff = {
        colorMoved = "default";	
      };
      pull = {
        rebase = true;	
      };
      http = {
        postBuffer = 1048576000;	
      };
      init = {
        defaultBranch = "master";
      };
      advice = {
        addIgnoredFile = false;	
      };
      /*
      commit = {
        gpgsign = true;	
      };
      */
      safe = {
        directory = "/etc/calamares";	
      };
      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
    };
  };
}
