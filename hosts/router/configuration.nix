# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking = {
    useDHCP = false;
    hostName = "router";
    nameservers = [ "9.9.9.9" ];

    bridges.switch.interfaces = map (x: "enp${toString x}s0") [
      2
      3
      4
    ];

    interfaces = {
      # Don't request DHCP on the physical interfaces
      enp1s0.useDHCP = false;
      enp2s0.useDHCP = false;
      enp3s0.useDHCP = false;
      enp4s0.useDHCP = false;
      enp1s0 = {
        ipv4.addresses = [
          {
            address = "192.168.178.2";
            prefixLength = 24;
          }
        ];
      };
      switch = {
        ipv4.addresses = [
          {
            address = "10.8.0.1";
            prefixLength = 24;
          }
        ];
      };
    };
    defaultGateway = {
      address = "192.168.178.1";
      interface = "enp1s0";
    };
  };
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      vim # my preferred editor
      htop # to see the system load
      ppp # for some manual debugging of pppd
      ethtool # manage NIC settings (offload, NIC feeatures, ...)
      tcpdump # view network traffic
      conntrack-tools # view network connection states
      neofetch
    ];
  };

  # programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
  boot.kernelParams = [ "console=ttyS0,115200n8" ];
  boot.loader.grub.extraConfig = "
   serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1
   terminal_input serial
   terminal_output serial
 ";

  boot.kernel.sysctl = {
    # if you use ipv4, this is all you need
    "net.ipv4.conf.all.forwarding" = true;

    # If you want to use it for ipv6
    "net.ipv6.conf.all.forwarding" = true;

    # source: https://github.com/mdlayher/homelab/blob/master/nixos/routnerr-2/configuration.nix#L52
    # By default, not automatically configure any IPv6 addresses.
    "net.ipv6.conf.all.accept_ra" = 0;
    "net.ipv6.conf.all.autoconf" = 0;
    "net.ipv6.conf.all.use_tempaddr" = 0;

  };

  networking.nftables = {
    enable = true;
    ruleset = ''
      table ip nat {
        chain prerouting {
          type nat hook prerouting priority filter; policy accept;
        }

        # Setup NAT masquerading on the LAN interfaces if needed
        chain postrouting {
          type nat hook postrouting priority filter; policy accept;
          oifname { "enp1s0" } masquerade
        }
      }
    '';
  };

  nix = {
    package = pkgs.lix;
    trustedUsers = [ "lucy" ];
  };

  services.kea = {
    dhcp4 = {
      enable = true;
      settings = {
        interfaces-config = {
          interfaces = [
            "switch"
          ];
        };
        lease-database = {
          name = "/var/lib/kea/dhcp4.leases";
          persist = true;
          type = "memfile";
        };
        rebind-timer = 2000;
        renew-timer = 1000;
        subnet4 = [
          {
            id = 1;
            pools = [
              {
                pool = "10.8.0.100 - 10.8.0.240";
              }
            ];
            option-data = [
              {
                name = "routers";
                data = "10.8.0.1";
              }
              {
                name = "domain-name-servers";
                data = "9.9.9.9";
                always-send = true;
              }
            ];
            subnet = "10.8.0.0/24";
          }
        ];
        valid-lifetime = 4000;
      };
    };
  };
  services.tailscale.enable = true;
  services.iperf3 = {
    enable = true;
    openFirewall = true;
  };

  services.kresd = {
    enable = true;
    extraConfig = ''
      policy.add(policy.all(policy.TLS_FORWARD({
        {'9.9.9.9', hostname='dns.quad9.net'},
        {'149.112.112.112', hostname='dns.quad9.net'},
        {'2620:fe::fe', hostname='dns.quad9.net'},
        {'2620:fe::9', hostname='dns.quad9.net'},
      })))
    '';
  };
}
