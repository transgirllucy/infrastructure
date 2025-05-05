{ lib, pkgs, ... }:
let
  getExtensionFor = browserVersion:
    { id, sha256, version }: {
      inherit id;
      crxPath = builtins.fetchurl {
        url =
          "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
        name = "${id}.crx";
        inherit sha256;
      };
      inherit version;
    };
  getCustomExtension = { version, sha256 }: {
    crxPath = builtins.fetchurl {
      url =
        "https://github.com/transgirllucy/doki-theme-compiled/releases/download/meow/${version}.crx";
      inherit sha256;
    };
  };
  getExtension =
    getExtensionFor (lib.versions.major pkgs.ungoogled-chromium.version);
in {
  programs.chromium = {
    enable = false;
    package = pkgs.ungoogled-chromium;
    commandLineArgs =
      [ "--disable-features=AutofillSavePaymentMethods" "--no-proxy-server" ];
    extensions = [
      # ublock origin
      (getExtension {
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        sha256 = "sha256:1lnk0k8zy0w33cxpv93q1am0d7ds2na64zshvbwdnbjq8x4sw5p6";
        version = "1.63.2";
      })
      # bitwarden
      (getExtension {
        id = "nngceckbapebfimnlniiiahkandclblb";
        sha256 = "sha256:1cqxid070yiqhw99najwg3nj3csdr8cp12pd0gggnfp34c8n2dig";
        version = "2025.3.1";
      })
      /* (getCustomExtension {
           version = "astolfo";
           sha256 = "sha256:05wfp4zblv4hnza3jnl63gijdl82qcma5c9yb863k5467p6j890i";
         })
      */
    ];
  };
}
