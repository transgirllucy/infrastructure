{
  config,
  pkgs,
  ...
}:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "de"
      "en-US"
    ];

    policies = {
      # Block access to the add-ons manager (about:addons)
      BlockAboutAddons = true;
      # Block access to the browser configuration (about:config)
      BlockAboutConfig = true;
      # Block access to the in-content profile manager (about:profiles)
      BlockAboutProfiles = true;
      # Block access to the troubleshooting information page (about:support)
      BlockAboutSupport = true;
      Bookmarks = [
        {
          Placement = "toolbar";
          Title = "NixOS Search";
          URL = "https://search.nixos.org";
        }
      ];
    };
  };
}
