{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.mastodon = {
    enable = true;
    localDomain = "cuddles.jetzt";
    configureNginx = true;
    smtp.fromAddress = "noreply@cuddles.jetzt";
    streamingProcesses = 7;
    extraConfig.SINGLE_USER_MODE = toString false;
  };
}
