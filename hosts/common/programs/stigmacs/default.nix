{ pkgs, ... }:
let
  emacsSrc = pkgs.fetchurl {
    url = "https://ftp.gnu.org/gnu/emacs/emacs-30.1.tar.xz";
    sha256 = "sha256-bMrBrnbmr5PG3h3xdejrQGdnwj2j3SoWqmfjEkpvE48=";
  };

  stigmacs = pkgs.stdenv.mkDerivation rec {
    pname = "stigmacs";
    version = "30.1";
    src = emacsSrc;
    # buildInputs are runtime deps
    # nativeBuildInputs are build-time deps
    buildInputs = with pkgs; [ libtool libvterm ]; # required for compiling emacs-vterm
    # propagatedInputs = with pkgs; [ mu isync ];
    nativeBuildInputs = with pkgs; [ 
      gtk3 pkg-config gnumake autoconf automake libtool gnutls tree-sitter ncurses sqlite texinfo
      # xorg.libXaw # lucid toolkit
    ];
    configureFlags = [
      # "--with-json" doesn't work on Emacs 30.1. And it's NOT necessary.
      "--with-gnutls"
      "--without-xwidgets"
      "--with-tree-sitter"
      "--with-png"
      "--with-jpeg"
      "--without-wide-int"
      "--with-sound"
      "--with-sqlite3" # Org Roam
      "--with-native-compilation=no"
      
      "--with-pgtk" # hangs a lot on Wayland
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

    meta = with pkgs.lib; {
      description = "Stig's Emacs built with custom flags";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  };
in
stigmacs
