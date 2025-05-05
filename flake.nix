{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    n.url = "github:nixos/nixpkgs/nixos-unstable";
    ns.url = "github:nixos/nixpkgs/nixos-24.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    simple-nixos-mailserver.url =
      "gitlab:simple-nixos-mailserver/nixos-mailserver/master";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    deploy-rs.url = "github:serokell/deploy-rs";
    nix-matrix-appservices.url = "gitlab:coffeetables/nix-matrix-appservices";
    c3d2-user-module.url = "git+https://gitea.c3d2.de/C3D2/nix-user-module.git";
  };

  outputs = inputs@{ nixpkgs, home-manager, simple-nixos-mailserver
    , nix-minecraft, nixos-hardware, deploy-rs, nix-matrix-appservices
    , c3d2-user-module, self, ... }: {
      nixosConfigurations = {
        # TODO please change the hostname to your own
        p50 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/p50/configuration.nix
            #./firefox.nix
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.lucy = import ./modules/home.nix;
            }
            ./modules/gaming.nix
            ./modules/niri.nix
            c3d2-user-module.nixosModule
          ];
        };
        router = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [ ./hosts/router/configuration.nix ];
        };
        /* server = nixpkgs.lib.nixosSystem {
             system = "aarch64-linux";
             modules = [
               home-manager.nixosModules.home-manager
               {
                 home-manager.useGlobalPkgs = true;
                 home-manager.useUserPackages = true;

                 home-manager.users.lucy = import ./modules/home.nix;
               }
               ./hosts/server/configuration.nix
               simple-nixos-mailserver.nixosModule
               ./modules/acme.nix
               ./modules/mailserver.nix
               ./modules/nginx.nix
               ./modules/vaultwarden.nix
               ./modules/postgresql.nix
               #./modules/synapse.nix
               ./modules/mastodon.nix
               ./modules/jitsi.nix
               ./modules/uptime-kuma.nix
               ./modules/immich.nix
               ./modules/minecraft.nix
               nix-minecraft.nixosModules.minecraft-servers
               { nixpkgs.overlays = [ inputs.nix-minecraft.overlay ]; }
             ];
           };
        */
        hetzner = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            simple-nixos-mailserver.nixosModule
            nix-minecraft.nixosModules.minecraft-servers
            { nixpkgs.overlays = [ inputs.nix-minecraft.overlay ]; }
            ./modules/acme.nix
            ./modules/synapse.nix
            ./modules/nginx.nix
            ./hosts/hetzner/configuration.nix
            ./modules/postgresql.nix
            ./modules/tor.nix
            ./modules/mailserver.nix
            ./modules/minecraft.nix
            ./modules/gitlab.nix
            ./modules/netdata.nix
            ./modules/jitsi.nix
            ./modules/misskey.nix
            ./modules/vaultwarden.nix
            ./modules/hedgedoc.nix
            nix-matrix-appservices.nixosModule
            #./modules/xmpp.nix
          ];
        };
      };
      deploy.nodes.hetzner = {
        hostname = "135.181.4.118";
        profiles.system = {
          user = "root";
          sshUser = "root";
          path = deploy-rs.lib.x86_64-linux.activate.nixos
            self.nixosConfigurations.hetzner;
        };
      };
      checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
