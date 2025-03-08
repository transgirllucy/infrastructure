default: format twinkpad router server
gaming_laptop:
	nixos-rebuild switch --flake .#gaming_laptop --verbose -v --use-remote-sudo --upgrade
twinkpad:
	nixos-rebuild switch --flake .#twinkpad --verbose -v --use-remote-sudo --upgrade
router:
	nixos-rebuild switch --flake .#router --target-host root@192.168.178.2 --use-remote-sudo --upgrade --verbose 
format:
	nixfmt *.nix && nixfmt */*/*.nix && nixfmt modules/*.nix
server:
	nixos-rebuild switch --fast --build-host lucy@nix2twink.gay --target-host lucy@nix2twink.gay --option eval-cache false --use-remote-sudo --flake .#server --verbose
