{ ... }: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = 0.8;
    colors.bright = {
      black = "#444b6a";
      blue = "#7da6ff";
      cyan = "#0db9d7";
      green = "#b9f27c";
      magenta = "#bb9af7";
      red = "#ff7a93";
      white = "#acb0d0";
      yellow = "#ff9e64";
    };
    colors.normal = {
      black = "#32344a";
      blue = "#7aa2f7";
      cyan = "#449dab";
      green = "#9ece6a";
      magenta = "#ad8ee6";
      red = "#f7768e";
      white = "#787c99";
      yellow = "#e0af68";
    };
    colors.primary = {
      background = "#1a1b26";
      foreground = "#a9b1d6";
    };
    font = {
      normal = {
        family = "Iosevka";
        style = "Regular";
      };
      bold = {
        family = "Iosevka";
        style = "Bold";
      };
      italic = {
        family = "Iosevka";
        style = "Italic";
      };
      bold_italic = {
        family = "Iosevka";
        style = "Bold Italic";
      };
      size = 18.0; # Adjust the font size as needed
    };
  };
}
