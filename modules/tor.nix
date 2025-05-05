{ ... }: {
  services.tor = {
    enable = true;
    openFirewall = true;

    # Disable GeoIP to prevent the Tor client from estimating the locations of Tor nodes it connects to
    enableGeoIP = false;

    # Enable Torsocks for transparent proxying of applications through Tor
    torsocks.enable = true;

    # Enable the Tor client
    client = { enable = true; };

    # Enable and configure the Tor relay
    relay = {
      enable = true;
      role = "relay"; # Set the relay role (e.g., "relay", "bridge")
    };

    # Configure Tor settings
    settings = {
      Nickname = "transgirllucy";
      ContactInfo = "abuse@lucy.giving";

      # Restrict exit nodes to a specific country (use the appropriate country code)    
      # Reject all exit traffic
      ExitPolicy = [
        "reject *:25"
        "reject *:119"
        "reject *:445"
        "reject *:563"
        "reject *:1214"
        "reject *:4551-4666"
        "reject *:6346-6429"
        "reject *:6699"
        "reject *:6881-6999"
      ];
      # Performance and security settings
      CookieAuthentication = true;
      AvoidDiskWrites = 1;
      HardwareAccel = 1;
      SafeLogging = 1;
      NumCPUs = 3;

      # Network settings
      ORPort = [ 6443 ];
    };
  };

  # Operating a Snowflake proxy helps others circumvent censorship. Safe to run.
  services.snowflake-proxy = {
    enable = true;
    capacity = 10;
  };

}
