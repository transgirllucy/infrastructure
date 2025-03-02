{ config, ... }:
{
  services.vaultwarden = {
    enable = true;
    environmentFile = "/etc/secrets/vaultwarden.env";
    dbBackend = "postgresql";
    config = {
      ROCKET_PORT = 8222;
      DOMAIN = "https://vault.nix2twink.gay";
      SIGNUPS_ALLOWED = false;
      ROCKET_LOG = "critical";
    };
  };
  services.nginx.virtualHosts."vault.nix2twink.gay" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
    };
  };
}
