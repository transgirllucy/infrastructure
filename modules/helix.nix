{ lib, pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages = {
      language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        language-servers = [ "nixd" ];
      }];
      language-server.nixd = { command = lib.getExe pkgs.nixd; };
    };
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
    extraPackages = with pkgs; [ nil rust-analyzer gopls ];
  };

}
