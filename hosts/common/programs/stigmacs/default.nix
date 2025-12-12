{ pkgs, lib, ...}:
let
  stigmacs = import ../../programs/stigmacs/stigmacs-pkg.nix {pkgs = pkgs;}; 
in
{
  services.emacs = {
      enable = false;
      install = true;
      package = pkgs.emacs30-pgtk.pkgs.withPackages (epkgs: [ epkgs.mu4e ]);
      defaultEditor = true;
  };

  home-manager.users.stig = {
 /*
    home.file.".config/emacs" = {
        recursive = true;
        source = ../../programs/stigmacs;
    };

    home.file.".config/emacs/init.el".source = ../../programs/stigmacs/init.el;
    home.file.".config/emacs/stigmacs.org".source = ../../programs/stigmacs/stigmacs.org;
    # home.file.".config/emacs/README.org".source = ../../programs/stigmacs/README.org;
    home.file.".config/emacs/caco.png".source = ../../programs/stigmacs/caco.png;
    home.file.".config/emacs/ob-rust.el".source = ../../programs/stigmacs/ob-rust.el;
*/
 	home.packages = with pkgs; [
 		nixd
 		notmuch lieer
 		# mu isync
 	];
 	home.activation.stigmacsSymlinks = lib.mkAfter ''
 	  mkdir -p ~/.config/emacs

 	  ln -sf ~/.nixos/hosts/Krypton/programs/stigmacs/init.el ~/.config/emacs/init.el
 	  ln -sf ~/.nixos/hosts/Krypton/programs/stigmacs/stigmacs.org ~/.config/emacs/stigmacs.org
 	  ln -sf ~/.nixos/hosts/Krypton/programs/stigmacs/caco.png ~/.config/emacs/caco.png
 	  ln -sf ~/.nixos/hosts/Krypton/programs/stigmacs/ob-rust.el ~/.config/emacs/ob-rust.el
 	  ln -sf ~/.nixos/hosts/Krypton/programs/stigmacs/mu4e/isyncrc ~/.config/isyncrc
 	'';
 	/*
 	programs.emacs = {
 		enable = true;
 		package = pkgs.emacs; # stigmacs bad
 		# Do NOT add extra packages this way! package.el gets loaded before elpaca, and this could lead to crashes.
 		/*
 		extraPackages = epkgs: [
 		  pkgs.mu
 		  epkgs.mu4e
 		  pkgs.isync
 		  epkgs.vterm		


 		  # LSPs
 		  pkgs.nixd	
 		  # no need to add rust-analyzer here.
 		];
 		/
 	};
 	services.emacs = {
 	  enable = true;
 	  package = stigmacs;
 	  client.enable = true;	
 	  defaultEditor = true;
 	};
 	*/
 };
}
