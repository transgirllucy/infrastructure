{...}: 
let

  dokuwiki-template-mindthedark = pkgs.stdenv.mkDerivation rec {
    name = "mindthedark";
    version = "2021-12-24";
    src = pkgs.fetchFromGitHub {
      owner = "MrReSc";
      repo = "MindTheDark";
      rev = version;
      sha256 = "sha256-8wWwwAYYQcUYzHpnSKOubZh7UzwfxvWXXNU7CUAiS3o=";
    };
    installPhase = "mkdir -p $out; cp -R * $out/";
  };
   dokuwiki-plugin-edittable = pkgs.stdenv.mkDerivation {
    name = "edittable";
    src = pkgs.fetchzip {
      url = "https://github.com/cosmocode/edittable/archive/master.zip";
      sha256 = "sha256-l+GZdFGp6wyNuCbAZB9IbwpY5c/S4vSW12VP0mJHKXs=";
    };
    sourceRoot = ".";
    installPhase = "mkdir -p $out; cp -R edittable-master/* $out/";
  };

in {
    services.dokuwiki.sites."wiki.nix2twink.gay" = {
        plugins = [ dokuwiki-plugin-edittable ];
        userewrite = true;
        
  enable = true;
  settings = {
    baseurl = "https://wiki.nix2twink.gay";
    title = "My Wiki";
    template = "mindthedark";
      tpl.mindthedark.autoDark = true;
  };
};
}