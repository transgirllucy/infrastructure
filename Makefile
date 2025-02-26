default: format gaming_laptop 
gaming_laptop:
	nixos-rebuild switch --flake .#gaming_laptop --verbose --use-remote-sudo --upgrade
format:
	nixfmt *.nix && nixfmt */*/*.nix

