{ ... }: {
  services.misskey = {
    enable = false;
    settings.url = "https://cuddles.jetzt";
    database.createLocally = true;
    reverseProxy.webserver.nginx = {
      enableACME = true;
      forceSSL = true;
    };
  };
}
