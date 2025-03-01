{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages =
      epkgs: with epkgs; [
        use-package
        elcord
        monokai-theme
        dashboard
        powerline
        auto-complete
        nix-mode
        speed-type
        el-fetch
        wttrin
        markdown-mode
        mastodon
        lua-mode
        php-mode
        yasnippet
      ];
    extraConfig = ''
      (require 'package)(package-initialize)
      (use-package elcord)
      (elcord-mode)
      (setq auto-save-default nil)
      (load-theme 'monokai t)
      (use-package auto-complete)
      (ac-config-default)
      (use-package speed-type)
      (use-package el-fetch)
      (use-package php-mode)

      (use-package markdown-mode)
      (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
      (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
      (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

      (use-package mastodon)
      (setq mastodon-instance-url "https://zug.network"
            mastodon-active-user "transgirl_lucy")
      (setq warning-minimum-level :emergency)
      (setq x-select-enable-clipboard t)

      (use-package lua-mode)
      (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
      (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
 
      (use-package c3-ts-mode)

      (use-package yasnippet)
      (yas-global-mode 1)

      (use-package nix-mode
      	:mode "\\.nix\\'")
      (set-face-attribute 'default nil :font "Iosevka-12")  ;; Default font
      (set-face-attribute 'variable-pitch nil :font "Iosevka-12")  ;; Variable pitch font
      (use-package dashboard
        :ensure t
        :config
      (dashboard-setup-startup-hook))
      (setq wttrin-default-cities '("Germany" "Berlin"))
      (global-display-line-numbers-mode t)
      (set-face-foreground 'line-number "yellow")
      (set-face-foreground 'line-number-current-line "yellow")
      (use-package powerline)
      (powerline-default-theme)

      (menu-bar-mode -1) 
      (scroll-bar-mode -1) 
      (tool-bar-mode -1) 
    '';
  };
}
