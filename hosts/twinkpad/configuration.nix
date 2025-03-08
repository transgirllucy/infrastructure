# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-42973ffd-28f0-4b2e-bccc-ca21c14e173f".device =
    "/dev/disk/by-uuid/42973ffd-28f0-4b2e-bccc-ca21c14e173f";
  networking.hostName = "twinkpad"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucy = {
    isNormalUser = true;
    description = "Lucy";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [
      pkgs.tree
      pkgs.ghostty
      (pkgs.discord-canary.override {
        withOpenASAR = true;
        #withVencord = true; # can do this here too
      })
      # support both 32- and 64-bit applications
      pkgs.wineWowPackages.stable

      # support 32-bit only
      pkgs.wine

      # support 64-bit only
      (pkgs.wine.override { wineBuild = "wine64"; })

      # support 64-bit only
      pkgs.wine64

      # wine-staging (version with experimental features)
      pkgs.wineWowPackages.staging

      # winetricks (all versions)
      pkgs.winetricks

      # native wayland support (unstable)
      pkgs.wineWowPackages.waylandFull

      (pkgs.lutris.override {
        extraLibraries = pkgs: [
          # List library dependencies here
        ];
      })
      pkgs.pavucontrol
      pkgs.qbittorrent-enhanced
      pkgs.jdk8
      pkgs.minecraft
      pkgs.prismlauncher
      pkgs.kdePackages.itinerary
      pkgs.vesktop
      pkgs.hyfetch
      pkgs.devenv
      pkgs.flameshot
      pkgs.grim
      pkgs.kew
      pkgs.scdl
      pkgs.mpv
      pkgs.youtube-dl
      pkgs.yt-dlp
      pkgs.ffmpeg
      pkgs.ledger-live-desktop
      pkgs.wofi
      pkgs.bitwarden-cli
      pkgs.bitwarden-desktop
      pkgs.blender
      pkgs.gnumake
      pkgs.tuba
      pkgs.kdePackages.elisa
      pkgs.remmina
      pkgs.alacritty
      pkgs.dmenu
      pkgs.nitrogen
      pkgs.nautilus
      pkgs.qutebrowser
      pkgs.teamspeak3
      pkgs.pwgen
      pkgs.tty-clock
      pkgs.tenki
      pkgs.acpi
      pkgs.brightnessctl
      pkgs.furmark
      pkgs.xorg.transset
      pkgs.feh
      pkgs.android-tools
      pkgs.scrcpy
      pkgs.nload
      pkgs.nvtop
      pkgs.pfetch
      pkgs.signal-desktop
      pkgs.element-desktop
      pkgs.texlive.combined.scheme-full
      pkgs.kitty
      pkgs.dmenu-wayland
      pkgs.gcc
      pkgs.cargo
      pkgs.rustc
      pkgs.screen
      pkgs.texlivePackages.moderncv
      pkgs.scrot
      pkgs.gh
      pkgs.macchanger
      pkgs.easyeffects
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.htop.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    nixfmt-rfc-style
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 8000 ];
  networking.firewall.allowedUDPPorts = [ 8000 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xfce.enableWaylandSession = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "discord-canary"
      "minecraft-launcher"
      "teamspeak3"
      "furmark"
      "cuda-merged"
      "cuda_cuobjdump"
      "cuda_gdb"
      "cuda_nvcc"
      "cuda_nvdisasm"
      "cuda_nvprune"
      "cuda_cccl"
      "cuda_cudart"
      "cuda_cupti"
      "cuda_cuxxfilt"
      "cuda_nvml_dev"
      "cuda_nvrtc"
      "cuda_nvtx"
      "cuda_profiler_api"
      "cuda_sanitizer_api"
      "libcublas"
      "libcufft"
      "libcurand"
      "libcusolver"
      "libnvjitlink"
      "libcusparse"
      "libnpp"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  nix = {
    package = pkgs.lix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Esync
  systemd.extraConfig = "DefaultLimitNOFILE=524288";
  security.pam.loginLimits = [
    {
      domain = "lucy";
      type = "hard";
      item = "nofile";
      value = "524288";
    }
  ];

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  programs.noisetorch.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "lucy" ];

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
    "freeimage-unstable-2021-11-01"
    "python3.12-youtube-dl-2021.12.17"
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  hardware.ledger.enable = true;

  services.emacs.enable = true;

  programs.i3lock.enable = true;

  services.picom.enable = true;

  programs.zsh = {
    enable = true;
  };

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  nix.settings.extra-platforms = config.boot.binfmt.emulatedSystems;

  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-wlr;
  };
  programs.waybar.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts._3270
    nerd-fonts.agave
    nerd-fonts.anonymice
    nerd-fonts.arimo
    nerd-fonts.aurulent-sans-mono
    nerd-fonts.bigblue-terminal
    nerd-fonts.bitstream-vera-sans-mono
    nerd-fonts.blex-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.code-new-roman
    nerd-fonts.comic-shanns-mono
    nerd-fonts.commit-mono
    nerd-fonts.cousine
    nerd-fonts.d2coding
    nerd-fonts.daddy-time-mono
    nerd-fonts.departure-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.envy-code-r
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.geist-mono
    nerd-fonts.go-mono
    nerd-fonts.gohufont
    nerd-fonts.hack
    nerd-fonts.hasklug
    nerd-fonts.heavy-data
    nerd-fonts.hurmit
    nerd-fonts.im-writing
    nerd-fonts.inconsolata
    nerd-fonts.inconsolata-go
    nerd-fonts.inconsolata-lgc
    nerd-fonts.intone-mono
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.jetbrains-mono
    nerd-fonts.lekton
    nerd-fonts.liberation
    nerd-fonts.lilex
    nerd-fonts.martian-mono
    nerd-fonts.meslo-lg
    nerd-fonts.monaspace
    nerd-fonts.monofur
    nerd-fonts.monoid
    nerd-fonts.mononoki
    nerd-fonts.mplus
    nerd-fonts.noto
    nerd-fonts.open-dyslexic
    nerd-fonts.overpass
    nerd-fonts.profont
    nerd-fonts.proggy-clean-tt
    nerd-fonts.recursive-mono
    nerd-fonts.roboto-mono
    nerd-fonts.shure-tech-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.space-mono
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.tinos
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.victor-mono
    nerd-fonts.zed-mono
    iosevka
  ];

  programs.evolution.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
  };
}
