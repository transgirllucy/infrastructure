{ config, ... }:
{
  services.nextcloud = {
    enable = true;
    hostName = "cloud.nix2twink.gay";
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        news
        contacts
        calendar
        tasks
        richdocuments
        ;
    };
    extraAppsEnable = true;
    https = true;
    configureRedis = true;
    extraOptions = {
      mail_smtpmode = "sendmail";
      mail_sendmailmode = "pipe";
    };

    maxUploadSize = "1G";

    config.adminpassFile = "/etc/secrets/nextcloud-admin-pass";
  };

  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };


services.nextcloud-whiteboard-server = {
  enable = true;
  settings.NEXTCLOUD_URL = "http://localhost";
  secrets = [ /etc/secrets/nextcloud-whiteboard-secret ];
};

}
