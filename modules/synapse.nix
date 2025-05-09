{ config, pkgs, lib, inputs, ... }:
let
  fqdn = "matrix.nix2twink.gay";
  baseUrl = "https://${fqdn}";
  clientConfig."m.homeserver".base_url = baseUrl;
  serverConfig."m.server" = "${fqdn}:443";
  mkWellKnown = data: ''
    default_type application/json;
    add_header Access-Control-Allow-Origin *;
    return 200 '${builtins.toJSON data}';
  '';
  synapseCfg = config.services.matrix-synapse;
  homeserverDomain = synapseCfg.settings.server_name;
  homeserverLocalPort =
    builtins.toString (builtins.elemAt synapseCfg.settings.listeners 0).port;
in {

  services.nginx.virtualHosts = {
    # records for myhostname.example.org, you can easily move the /.well-known
    # virtualHost section of the code to the host that is serving example.org, while
    # the rest stays on myhostname.example.org with no other changes required.
    # This pattern also allows to seamlessly move the homeserver from
    # myhostname.example.org to myotherhost.example.org by only changing the
    # /.well-known redirection target.
    "nix2twink.gay" = {
      enableACME = true;
      forceSSL = true;
      # This section is not needed if the server_name of matrix-synapse is equal to
      # the domain (i.e. example.org from @foo:example.org) and the federation port
      # is 8448.
      # Further reference can be found in the docs about delegation under
      # https://element-hq.github.io/synapse/latest/delegate.html
      locations."= /.well-known/matrix/server".extraConfig =
        mkWellKnown serverConfig;
      # This is usually needed for homeserver discovery (from e.g. other Matrix clients).
      # Further reference can be found in the upstream docs at
      # https://spec.matrix.org/latest/client-server-api/#getwell-knownmatrixclient
      locations."= /.well-known/matrix/client".extraConfig =
        mkWellKnown clientConfig;
    };
    "${fqdn}" = {
      enableACME = true;
      forceSSL = true;
      # It's also possible to do a redirect here or something else, this vhost is not
      # needed for Matrix. It's recommended though to *not put* element
      # here, see also the section about Element.
      locations."/".extraConfig = ''
        return 404;
      '';
      # Forward all Matrix API calls to the synapse Matrix homeserver. A trailing slash
      # *must not* be used here.
      locations."/_matrix".proxyPass = "http://[::1]:8008";
      # Forward requests for e.g. SSO and password-resets.
      locations."/_synapse/client".proxyPass = "http://[::1]:8008";
    };
  };

  services.matrix-appservices = {
    inherit homeserverDomain;

    addRegistrationFiles = true;

    services.whatsapp = {
      port = 29183;
      format = "mautrix-go";
      package = pkgs.mautrix-whatsapp;
    };

    services.discord = {
      port = 29334;
      format = "mautrix-go";
      package = pkgs.mautrix-discord;
      settings = {
        bridge = {
          encryption = {
            allow = true;
            default = true;
            allow_key_sharing = true;
          };
          backfill.forward_limits = {
            initial = {
              dm = 50;
              channel = 50;
              thread = 50;
            };
            missed = {
              dm = -1;
              channel = -1;
              thread = -1;
            };
          };
          media_patterns.enabled = true;
        };
        homeserver = {
          address = "http://localhost:${homeserverLocalPort}";
          async_media = true;
        };
        logging.min_level = "info";
      };
    };
  };

  services.matrix-synapse = {
    enable = true;
    settings = {
      server_name = "nix2twink.gay";
      public_baseurl = baseUrl;
      listeners = [{
        port = 8008;
        bind_addresses = [ "::1" ];
        type = "http";
        tls = false;
        x_forwarded = true;
        resources = [{
          names = [ "client" "federation" ];
          compress = true;
        }];
      }];
    };
    extraConfigFiles = [ "/var/lib/matrix-synapse/shared-secret" ];
  };
}
