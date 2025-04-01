{ config
, pkgs
, lib
, ...
}:
{
  services.mastodon = {
    enable = true;
    localDomain = "cuddles.jetzt";
    configureNginx = true;
    smtp.fromAddress = "noreply@cuddles.jetzt";

    extraConfig = {
      MAX_POLL_OPTION_CHARS = "200";
      MAX_POLL_OPTIONS = "10";
      MAX_PROFILE_FIELDS = "8";
      MAX_POST_CHARS = "3000";
    };
    streamingProcesses = 7;
    extraConfig.SINGLE_USER_MODE = toString false;
  };
}
