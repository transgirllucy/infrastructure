{ pkgs, ... }: {
  services.gitlab = {
    enable = true;
    databasePasswordFile = "/etc/secrets/gitlab-dbfile";
    initialRootPasswordFile = "/etc/secrets/gitlab-init";
    secrets = {
      secretFile = "/etc/secrets/gitlab-secret";
      otpFile = "/etc/secrets/gitlab-otp";
      dbFile = "/etc/secrets/gitlab-dbsecret";
      jwsFile = "/etc/secrets/gitlab-jws";
    };
  };

  services.nginx = {
    recommendedProxySettings = true;
    virtualHosts = {
      "gitlab.nix2twink.gay" = {
        enableACME = true;
        forceSSL = true;
        locations."/".proxyPass =
          "http://unix:/run/gitlab/gitlab-workhorse.socket";
      };
    };
  };

  systemd.services.gitlab-backup.environment.BACKUP = "dump";
}
