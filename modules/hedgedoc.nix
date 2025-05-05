{ ... }: {
  services.hedgedoc = {
    enable = true;
    settings.domain = "pad.nix2twink.gay";
    settings.port = 8001;
    settings.protocolUseSSL = true;
    settings.allowOrigin = [ "localhost" "pad.nix2twink.gay" ];
  };
  services.nginx.virtualHosts."pad.nix2twink.gay" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://localhost:8001";
    locations."/socket.io/" = {
      proxyPass = "http://localhost:8001";
      proxyWebsockets = true;
      extraConfig = "proxy_ssl_server_name on;";
    };
  };
}
