{lib, ...}: {
  home-manager.users.stig.home.activation.zenfulZen = lib.mkAfter ''
    if [ ! -d "$HOME/.zen" ]; then
      timeout 5 zen --headless
    fi

    for dir in $(find "$HOME/.zen" -maxdepth 1 -type d -iname '*default*' -printf "%f\n"); do
      ln -sf "$(pwd)/user.js" "$HOME/.zen/$dir/user.js"
    done
  '';
}
