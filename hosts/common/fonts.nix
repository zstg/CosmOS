{pkgs,...}: {
  fonts = {
    enableDefaultPackages = true;
    # packages = with pkgs; [ nerdfonts (nerdfonts.override { fonts = ["JetBrainsMono" "NerdFontsSymbolsOnly" ]; }}];
    packages = with pkgs; [ 
    	noto-fonts-color-emoji
    	nerd-fonts.jetbrains-mono 
    	nerd-fonts.symbols-only 
    ];
    fontconfig = {
      enable = true;
      # fixes pixelation
      antialias = true;
    
      # fixes antialiasing blur
      hinting.enable = true;
      
      # fixes height
      subpixel.rgba = "rgb";
   };
  };
}
