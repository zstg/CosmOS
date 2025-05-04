{...}: {
  services = {
    xserver = {
      enable = false; # what does this do?
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
