{ pkgs, ... }:
{
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      patches = [
        ./dwm_patches/dwm-6.5-stacker.diff
        ./dwm_patches/dwm-fullscreen.diff
        #./dwm_patches/dwm-systray.diff
        #./dwm_patches/lucys_dwm.diff
        ./dwm_patches/remove_layout_1.diff
        ./dwm_patches/keybindings.diff
      ];
    };
  };
}
