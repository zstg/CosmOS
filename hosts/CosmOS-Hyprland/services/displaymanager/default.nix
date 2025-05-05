{lib, ...}: {
  services = {
    xserver.displayManager.lightdm.enable = lib.mkForce false;
    displayManager = {
      sddm.enable = false;
      ly = {
        enable = true;
        settings = {
          # if you want a properly-documented file see config.ini
          animation = "matrix";
          bigclock = true;
          asterisk = "*";
          clear_password = true; # erase password on failure
          vi_mode = false;
          fg = 8;
          border_fg = 8;
          box_title = "null";
          max_desktop_len = 100;
          max_login_len = 100;
          max_password_len = 255;
          default_input = "password";
          load = true;
          save = true;
          # save_file = /etc/ly/save # saves to pwd by default, this option is deprecated.
          hide_key_hints = false;
          shutdown_key = "F1";
          restart_key = "F2";
          sleep_key = "F3";
          shutdown_cmd = "systemctl poweroff";
          restart_cmd = "systemctl reboot";
          sleep_cmd = "systemctl hibernate"; # yes
          lang = "en";
          tty = 2;
          # console_dev = /dev/console;
          min_refresh_delta = 5;
          numlock = true;
          # let NixOS take care of the rest as it does
        };
      };
    };
  };
}
