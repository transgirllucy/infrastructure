{ config, ... }:
{
  services.uptime-kuma = {
    enable = true;
    appriseSupport = true;
    settings.PORT = "4000";
  };

  services.nginx = {
    # other Nginx options
    virtualHosts."status.nix2twink.gay" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${config.services.uptime-kuma.settings.PORT}";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;"
          +
            # required when the server wants to use HTTP Authentication
            "proxy_pass_header Authorization;";
      };
    };
  };
}
