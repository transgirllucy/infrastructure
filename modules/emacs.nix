{ pkgs, ... }:
 {
  programs.emacs = {
  	enable = true;
	 extraPackages =
      epkgs: with epkgs; [
        elcord
	      monokai-theme
	      nix-mode
      ];
	extraConfig = ''
	      (setq standard-indent 2)
	      (elcord-mode)
	      (nix-mode)
        (load-theme monokai t)
	'';
  };
}
