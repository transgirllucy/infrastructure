{pkgs, ...}: {
  services.netdata.enable = true;

  security.pam.services.nginx.setEnvironment = false;
  systemd.services.nginx.serviceConfig = {
    SupplementaryGroups = ["shadow"];
  };

  services.nginx = {
    additionalModules = [pkgs.nginxModules.pam];
    # other Nginx options
    virtualHosts."monitor.nix2twink.gay" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:19999";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig = ''
              # required when the target is also TLS server with multiple hosts
              proxy_ssl_server_name on;
              # required when the server wants to use HTTP Authentication
              proxy_pass_header Authorization;
               auth_pam  "Password Required";
          auth_pam_service_name "nginx";
        '';
      };
    };
  };
}
