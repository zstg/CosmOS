{ pkgs, ... }:

let
  stigmacs = pkgs.emacs.pkgs.withPackages (epkgs: [
    epkgs.mu4e # This results in a warning, but adds mu4e properly
  ]) // {
    emacs = pkgs.emacs30-pgtk.overrideAttrs (oldAttrs: {
      configureFlags = oldAttrs.configureFlags ++ [
        # "--with-json" doesn't work on Emacs 30.1. And it's NOT necessary.
        "--with-gnutls"
        "--with-xwidgets"
        "--with-tree-sitter"
        "--with-png"
        "--with-jpeg"
        "--without-wide-int"
        "--with-sound"
        "--with-sqlite3" # Org Roam
        "--with-native-compilation=no"
        
        "--with-pgtk"
        "--with-cairo"
        # "--with-x-toolkit=lucid"
        "--with-xpm=ifavailable" 
        "--with-gif=ifavailable"
        
        "--with-libsystemd"
        "-with-dbus"
        "--with-pdumper=yes"
        "--without-pop"
        "--without-mailutils"
        "--disable-gc-mark-trace"
      ];
    });
  };
in
stigmacs
