{ config, pkgs, ...}: {
  mailserver = {
    openFirewall = true;
    enable = true;
    fqdn = "mail.nix2twink.gay";
    domains = [ "nix2twink.gay" "mrtuxa.tech" "lucy.giving"];

    loginAccounts = {
      "lucy@nix2twink.gay" = {
        hashedPasswordFile = "/etc/secrets/mailserver/lucy";
        aliases = ["contact@mrtuxa.tech" "postmaster@nix2twink.gay" "acme@nix2twink.gay"];
      };
    };

    certificateScheme = "acme-nginx";
  };
}
