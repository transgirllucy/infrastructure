{ pkgs, ... }:
{
  services.xserver.windowManager.dwm = {
    package = pkgs.dwm.override {
      patches = [
        # for local patch files, replace with relative path to patch file
        ./dwm_patches/lucy.diff
      ];
    };
    enable = true;
  };

}
