# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  self,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = toString null; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

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
  services.xserver.enable = true;

  services.displayManager.ly.enable = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
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
      pkgs.monero-gui
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
    ];
  };

  programs.htop.enable = true;
  programs.firefox.enable = true;

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
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8000 ];
  networking.firewall.allowedUDPPorts = [ 8000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xfce.enableWaylandSession = true;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false; # temporary fix
    nvidiaSettings = true;
  };
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "discord-canary"
      "steam"
      "steam-unwrapped"
      "steam-original"
      "steam-run"
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
  services.monero.enable = true;

  programs.thunderbird.enable = true;
  services.emacs.enable = true;

  fonts.packages = with pkgs; [
    iosevka
  ];

  programs.i3lock.enable = true;

  services.picom.enable = true;

  programs.zsh = {
    enable = true;
  };

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  nix.settings.extra-platforms = config.boot.binfmt.emulatedSystems;
}
