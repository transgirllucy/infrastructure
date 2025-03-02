{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.jitsi-meet = {
    enable = true;
    hostName = "jitsi.nix2twink.gay";
    prosody.lockdown = false;
    config = {
      enableWelcomePage = true;
      prejoinPageEnabled = true;
      defaultLang = "en";
    };
    interfaceConfig = {
      SHOW_JITSI_WATERMARK = false;
      SHOW_WATERMARK_FOR_GUESTS = false;
    };
  };
  services.jitsi-videobridge.openFirewall = true;
}
