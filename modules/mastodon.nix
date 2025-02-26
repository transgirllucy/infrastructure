{ config, pkgs, lib, ...}: {
  services.mastodon = {
    enable = true;
    localDomain = "cuddles.jetzt";
    configureNginx = true;
    smtp.fromAddress = "noreply@cuddles.jetzt";
    streaminProcesses = 7;
    extraConfig.SINGLE_USER_MODE = toString false;
  };
}
