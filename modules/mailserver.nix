{ lib, config, pkgs, ... }: {
  mailserver = {
    fullTextSearch = {
      enable = true;
      # index new email as they arrive
      autoIndex = true;
      enforced = "body";
    };

    openFirewall = true;
    enable = true;
    fqdn = "mail.nix2twink.gay";
    domains = [ "nix2twink.gay" "mrtuxa.tech" "lucy.giving" ];

    loginAccounts = {
      "lucy@nix2twink.gay" = {
        hashedPasswordFile = "/etc/secrets/mailserver/lucy";
        aliases = [
          "contact@mrtuxa.tech"
          "postmaster@nix2twink.gay"
          "acme@nix2twink.gay"
          "mrtuxa@nix2twink.gay"
        ];
      };
    };

    certificateScheme = "acme-nginx";
  };

  services.roundcube = {
    enable = true;
    # this is the url of the vhost, not necessarily the same as the fqdn of
    # the mailserver
    hostName = "webmail.nix2twink.gay";
    extraConfig = ''
      # starttls needed for authentication, so the fqdn required to match
      # the certificate
      $config['smtp_server'] = "tls://${config.mailserver.fqdn}";
      $config['smtp_user'] = "%u";
      $config['smtp_pass'] = "%p";
    '';
  };

}
