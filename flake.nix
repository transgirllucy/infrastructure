{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-24.11";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      simple-nixos-mailserver,
      self,
      ...
    }:
    {
      nixosConfigurations = {
        # TODO please change the hostname to your own
        gaming_laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/gaming_laptop/configuration.nix
            #./firefox.nix
            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.lucy = import ./home.nix;
            }
            ./gaming.nix
            ./dwm.nix
          ];
        };
        server = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.lucy = import ./home.nix;
            }
            ./hosts/server/configuration.nix
            simple-nixos-mailserver.nixosModule
            ./modules/acme.nix
            ./modules/mailserver.nix
          ];
        };

      };
    };
}
