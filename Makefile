default: format gaming_laptop server
gaming_laptop:
	nixos-rebuild switch --flake .#gaming_laptop --verbose --use-remote-sudo --upgrade
format:
	nixfmt *.nix && nixfmt */*/*.nix
server:
	nixos-rebuild switch --fast --build-host lucy@nix2twink.gay --target-host lucy@nix2twink.gay --option eval-cache false --use-remote-sudo --flake .#server --verbose
