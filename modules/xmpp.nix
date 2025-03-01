{ config, pkgs, lib, ...}: {
  services.prosody = {
    enable = true;
    admins = [ "root@nix2twink.gay" ];
    ssl.cert = "/var/lib/acme/nix2twink.gay/fullchain.pem";
    ssl.key = "/var/lib/acme/nix2twink.gay/key.pem";
    virtualHosts."nix2twink.gay" = {
        enabled = true;
        domain = "nix2twink.gay";
        ssl.cert = "/var/lib/acme/nix2twink.gay/fullchain.pem";
        ssl.key = "/var/lib/acme/nix2twink.gay/key.pem";
    };
    muc = [ {
        domain = "conference.nix2twink.gay";
    } ];
    uploadHttp = {
        domain = "upload.nix2twink.gay";
    };
  };

  security.acme = {
    certs = {
      "nix2twink.gay" = {
        webroot = "/var/www/nix2twink.gay";
        email = "root@nix2twink.gay";
        extraDomainNames = [ "conference.nix2twink.gay" "upload.nix2twink.gay" ];
      };
    };
  };
}
