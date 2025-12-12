{ pkgs, ... }: {
  home-manager.users.stig = {
    systemd.user.services.gpg-unlock = {
      Unit = {
        Description = "Unlock GPG key using Agenix at startup";
        After = [ "default.target" ];
      };
	  # Systemctl seems to suggest that this service is dead. This is intended behaviour. I've disabled all output from this service because it dispays auth tokens in plaintext.
	  # .authinfo.gpg is only for demonstration purposes. Any file encrypted with user GPG keys will do the trick; but this file has the added advantage of loading some tokens I require...
      Service = {
        Type = "oneshot";
        Environment = "GPG_TTY=/dev/tty1";
        ExecStart = ''
          ${pkgs.gnupg}/bin/gpg --quiet \
              --batch \
              --yes \
              --no-tty \
              --pinentry-mode loopback \
              --passphrase-file /run/agenix/gpg-passphrase \
              --decrypt /home/stig/.nixos/hosts/Krypton/secrets/.authinfo.gpg
        '';
        StandardOutput = "null";
        StandardError = "null";
        SyslogIdentifier = "gpg-unlock";
        SystemdJournal = false;
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
