{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  heart = "\\u2764";
in
{
  # Minecraft server settings
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.polycule = {
      enable = true;

      whitelist = {
        lucy = "e6c59dfa-41d5-432e-ac30-7383c362dbd9";
        Bettle = "d53695fa-65ff-4d96-9eb9-fa5e9edccb79";
        Spectre = "c30b5867-5712-48aa-be32-1d8129a7c670";
        Lumin3ra = "ad088567-d813-4e8a-b82a-76d1210da444";
        Ruby = "dba84e4c-e487-4d37-991f-9fcb9d96f12f";
        Aria = "9864936c-0e53-4bb6-8436-4a88ee8cec97";
        Angel = "1e635818-ddf4-4f7a-933d-25fffb1e0087";
      };

      serverProperties = {
        allow-flight = true;
        white-list = true;
        difficulty = "normal";
        enable-command-block = true;
        max-players = 16;
        max-world-size = 29999984;
        motd = "${heart} made by bottoms for bottoms ${heart}  meow meow ${heart}";
        spawn-protection = 0;
      };

      # Specify the custom minecraft server package
      package = pkgs.fabricServers.fabric-1_19_2;
      #.override {
      #loaderVersion = "0.16.10";
      #}; # Specific fabric loader version

      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (
          builtins.attrValues {
            Fabric-API = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4902/659/fabric-api-0.77.0%2B1.19.2.jar";
              hash = "sha256-D8YnRKOPYp/ghAiTcT5qER7RJjcZ+T5JnJkGiIEYJOw=";
            };
            # Just Enough Breeding (JEBr)
            jeb = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5682/312/justenoughbreeding-fabric-1.19-1.19.2-1.4.0.jar";
              hash = "sha256-56MNyBaZqWrG5DEwbW5U4JpX15okkemI6awTlJxtHT0=";
            };
            # Just Enough Farmer's Recipes
            jefr = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4357/825/JustEnoughFarmersRecipes-1.19-1.0.1.jar";
              hash = "sha256-RLO093uarBp60NrsOy8d+i2t2/tlIEVLRyV8j26ymYA=";
            };
            # Jade Addons (Fabric)
            jad = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6157/654/JadeAddons-1.19.2-fabric-3.2.1.jar";
              hash = "sha256-flVY5QjrxR/fVqlhySDO5zbscivw9Aiz2K2Gntsz6es=";
            };
            # TerraBlender (Fabric)
            trbl = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4618/489/TerraBlender-fabric-1.19.2-2.0.1.166.jar";
              hash = "sha256-3pHbCCjbyGlitmKKAMu3FpTxEbmc1L6sqQT7xBwyLcU=";
            };
            # Just Enough Items (JEI)
            jei = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5846/857/jei-1.19.2-fabric-11.8.1.1034.jar";
              hash = "sha256-W0FY9k4ld5G8H+pbA3mFJdm6WwmVovV9ZoBU6twSvbM=";
            };
            #  Pehkui
            pekhui = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5419/266/Pehkui-3.8.3%2B1.14.4-1.21.jar";
              hash = "sha256-MSnm/UcGIAfIFe69G9Zzmo7M6s9d4vdLIszgt1+tp1s=";
            };
            # Create Big Cannons
            cbc = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5598/849/createbigcannons-5.5.1-mc.1.19.2-fabric.jar";
              hash = "sha256-jZhu/ioBP6xfvD8FXHe+zFvkpn0Er+8rL4XnJQ5dkEs=";
            };
            # Patchouli
            patchouli = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4031/404/Patchouli-1.19.2-77-FABRIC.jar";
              hash = "sha256-PlQKsomrLPBFMuaBg3SPEXkdpclT9SXpG1QFg2z/xG8=";
            };
            #  Powah
            powah = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4729/360/Powah-4.0.11.jar";
              hash = "sha256-huBf3ee1q73DHFBZrd+UOqQgmD1Uvw0yRxzlVjspZQQ=";
            };
            # Packet Fixer
            packetfixed = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6195/870/packetfixer-forge-2.0.0-1.19-to-1.20.1.jar";
              hash = "sha256-HBsaUKepoYxhAsjusQuiPXVOAg9zPzJkBWWKbuGmjIo=";
            };
            # Icarus
            icarus = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5641/911/icarus-1.14.1.jar";
              hash = "sha256-esmB31BPUOOXOyELejBSbmIcoD1SloUtOMMnAn+c1ds=";
            };
            # An Origins Addon - Libra
            originslibra = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5210/380/libra-0.5.45.jar";
              hash = "sha256-wqbnrwDFOtMO3iqWO/BiTeGDaWU43foRm3G4elfq0rI=";
            };
            # Cloth Config API (Fabric/Forge/NeoForge)
            clothapi = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5729/96/cloth-config-8.3.134-forge.jar";
              hash = "sha256-NQUZ9F47R3sCVTQuM5Us21XM3CSF/6/dEAo81xbc9oo=";
            };
            # Mythic Mounts
            mmounts = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4507/470/mythic-mounts-1.19.2-7.2.jar";
              hash = "sha256-CYxLOtnEjey2QLZA0pR+edpUjiWJJdlPbRFJt58lbUg=";
            };
            # Create: Estrogen
            estrogen = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5538/93/Estrogen-4.1.1%2B1.19.2-fabric.jar";
              hash = "sha256-uE4l8CU9bKre4qVsQPvjbJZc/YAQacHz5XNocQs15XM=";
            };
            # Origins Extra Keybinds
            extrakeybindings = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4601/10/extrakeybinds-0.5.0%2B1.17-1.19.4.jar";
              hash = "sha256-slosvoCi3h9lVaEOm8PpkrZPVGOrFsCg0BBDwrZJ2d8=";
            };
            # FTB Library (Fabric)
            ftblibrary = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4661/833/ftb-library-fabric-1902.4.1-build.236.jar";
              hash = "sha256-4hOptfQCtOPaO72HbtDLAJoQ6Ydgwkz1P+NhwulWpzA=";
            };
            # SuperMartijn642's Config Lib
            smtcl = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4785/836/supermartijn642configlib-1.1.8a-fabric-mc1.19.jar";
              hash = "sha256-pVSl22+RUq/NYhbeYILO9ZCxQPfFTdOhpcIpmkxDfUA=";
            };
            # Client Crafting
            client_crafting = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4647/481/clientcrafting-fabric-1.19.2-1.6.jar";
              hash = "sha256-c1gDtcWMwSO4/EUa+9RgvpyJx3qy4tgTWAQ/Qdoa9to=";
            };
            # Jade
            jade = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4328/558/Jade-1.19.1-fabric-8.7.3.jar";
              hash = "sha256-6TBpFWGwCGijIs/HfNwdWZP8/BoiKTikZqTs+8jf5EI=";
            };
            # Magic Origins
            magicorigins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4717/581/magic_origins%20v0.3.5%201.19-1.19.3.jar";
              hash = "sha256-Eq6moXuXUe+EF3naEvJINjvY0r5ssT33jzl/2qkXPxo=";
            };
            # Lithium (Fabric/NeoForge)
            lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4439/700/lithium-fabric-mc1.19.2-0.11.1.jar";
              hash = "sha256-fuahLMXavQvNbTaHQycN4IvC26wR0rXG1iGEG49EhiE=";
            };
            # Enchantment Descriptions
            enchdesc = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4277/355/EnchantmentDescriptions-Fabric-1.19.2-13.0.14.jar";
              hash = "sha256-2iVwYGxQIXKlzMAt6vlH91ElUWqM6uLZ7VXDpOMFBV0=";
            };
            # Nature's Compass
            compass = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4118/387/NaturesCompass-1.19.2-2.1.0-fabric.jar";
              hash = "sha256-72J2jSj4tkdHp9LTuoo2bxJV0MUoq1EPGlylpwwVTWg=";
            };
            # SuperMartijn642's Core Lib
            corelib = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6076/729/supermartijn642corelib-1.1.18a-fabric-mc1.19.2.jar";
              hash = "sha256-HidVdX8NHpqaCDyypV/7/vDqgrc2QP9DYCceXxGeA/g=";
            };
            # Bookshelf
            bookshelf = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4556/696/Bookshelf-Fabric-1.19.2-16.3.20.jar";
              hash = "sha256-b12Da0xz6iTst3CW1zVCEsNgc4BxbHMHR/1Yk4L2wu8=";
            };
            # Origins (Fabric)
            origins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4044/263/Origins-1.19.2-1.7.1.jar";
              hash = "sha256-7T22iNJ7RWoMJhMi7j5PnMznssA2o7M2K1o5/aTxYak=";
            };
            # Animal Origins - Infinite Origins
            animalorigins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5248/756/Animal%20Origins%202.3.0%201.19.2.jar";
              hash = "sha256-dCT6e8wzb4uD0S36J6MvTknKKfcfB0DsLwYDpI8HiQ4=";
            };
            # Skin Layers 3D (Fabric/Forge)
            skinlayers = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5970/909/skinlayers3d-fabric-1.7.4-mc1.19.2.jar";
              hash = "sha256-fFKXS7Cbdd8I/UZfz0PJfQsp1duJSdmBjpSduIady5c=";
            };
            # Carry On
            carryon = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5141/760/carryon-fabric-1.19.2-2.1.2.23.jar";
              hash = "sha256-GBeH/ZXQ08sSY5U2YQ7o4kfAhQZqF4Jp2aWgtyGvbVU=";
            };
            # Applied Energistics 2
            energistics = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5014/666/appliedenergistics2-fabric-12.9.9.jar";
              hash = "sha256-+TScA+J1bN2zuuCJJJ/od8eZdgCLJ4+RDMcrLVY8kKs=";
            };
            # CorgiLib
            corgi = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4554/112/CorgiLib-fabric-1.19.2-1.0.0.34.jar";
              hash = "sha256-brXcUr4h5yfOlWwb4ib8lbMvtkSSmxcvNY1w1uShwbg=";
            };
            # Create Fabric
            createfabric = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5245/232/create-fabric-0.5.1-f-build.1416%2Bmc1.19.2.jar";
              hash = "sha256-NxZ3LaK4kASp8VJIvvQ/Azjc051uU5qw1xH2gGC1JTA=";
            };
            # Extra Thicc Packets
            thiccpackets = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4032/19/extra_thicc_packets-1.0.jar";
              hash = "sha256-gOwKcFa3f7HgABoBWn0xN07uZw70R4qtJpVNgbg7VfU=";
            };
            # Dig's DnD origins
            dndorigins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4627/100/digs_dnd_origins-1.19.2-0.0.9.jar";
              hash = "sha256-wbO6jWtfsnOj8GJWI1VtbtOt5A1m9Cq5uUecF4XuJ6o=";
            };
            # Night Lights
            lights = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4377/490/nightlights-fabric-1.19.2-1.1.jar";
              hash = "sha256-KSec5VraC8BPFBHe0p/GIeCM/2nBqYEZXUyEPFn9cvM=";
            };
            # Cobblemon
            cobblemon = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4468/330/Cobblemon-fabric-1.3.2%2B1.19.2.jar";
              hash = "sha256-JWsmnNWuU7OkmH2s9kGRaBvpL7VVE8fly5qR/Mi8BBw=";
            };
            # Oh The Biomes You'll Go Refabricated
            biomes = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5116/295/Oh_The_Biomes_You%27ll_Go-fabric-1.19.2-2.0.1.6.jar";
              hash = "sha256-s1Q5NfuaxkRk4zH04RAJ06OjRtqasTMGTJFTcSLJFUM=";
            };
            # Trinkets (Fabric)
            trinkets = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4343/755/trinkets-3.4.2.jar";
              hash = "sha256-WAfjgAAMjgzPo6KdNZgZ1VdgCzu03QiQ6QU8hG4/7Ng=";
            };
            # Indium
            indium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/3957/480/indium-1.0.9%2Bmc1.19.2.jar";
              hash = "sha256-4L7jIedxykbEEXpGnNkWpx+M5Ey/01wAZCV3Xt+3m1A=";
            };
            # spark
            spark = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4505/310/spark-1.10.37-fabric.jar";
              hash = "sha256-93jph4eUaoaUzmA7lj2LqQdzcPR0OE2jjGB7z0u3dO8=";
            };
            # JourneyMap
            journeymap = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5208/377/journeymap-1.19.2-5.9.8-fabric.jar";
              hash = "sha256-9D95hLhEUj4IClwKas0Yop7Hb+sOCGvs0iPCReubjLc=";
            };
            # MEGA Cells
            megacells = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4780/807/megacells-fabric-2.0.4-1.19.2.jar";
              hash = "sha256-ffDrhOlyFnviDMdfOcR84yehwbw96P7vxJcnw2Am8nA=";
            };
            # Wraith Waystones
            waystones = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4567/225/wraith-waystones-3.0.8%2Bmc1.19.2.jar";
              hash = "sha256-g9nGv8Sgv96qNZOCXxaBSo8IbMh+rVFUktnemZ5okog=";
            };
            # oωo (owo-lib)
            owo = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4152/949/owo-lib-0.9.3%2B1.19.jar";
              hash = "sha256-qFz5fPCDAQhqvng/3pC5ZMeZRQzv8BzXnObT07cOSpw=";
            };
            #  ModernFix
            modernfix = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5803/580/modernfix-fabric-5.18.1%2Bmc1.19.2.jar";
              hash = "sha256-ZgGd5BpStiEy7nRL8KlLxOqpD0XlCKMbt+ncPmVAF84=";
            };
            # FTB Essentials (Forge & Fabric)
            essentials = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5120/108/ftb-essentials-fabric-1902.3.5-build.120.jar";
              hash = "sha256-tI1qICzBAaOC7gEOT1zcRLbsqQtPf3ZtZ19iSno3BUc=";
            };
            # Critters and Companions
            companions = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4644/101/crittersandcompanions-fabric-1.19.2-2.0.2.jar";
              hash = "sha256-Dzm30xmc5A8bIs863MtPt/x1Q4ziTtpwBYXBq7rK1YY=";
            };
            # Mouse Tweaks
            mouse = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/3828/448/MouseTweaks-fabric-mc1.19-2.22.jar";
              hash = "sha256-3jAT51/0TSDU956NUX0khc/UojZUoJxA7/X+45a4NtY=";
            };
            # Architectury API
            architectury = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5137/941/architectury-6.6.92-fabric.jar";
              hash = "sha256-By0Zy+Hc9GWIyBU3G1oxhv+EUSu9Ke0GvHSWm7OFdUM=";
            };
            # Blahaj (Fabric)
            blahaj = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4467/187/blahaj-fabric-1.19-0.3.2.jar";
              hash = "sha256-Fu35ur/JZgJ6N0gzo7kzk8VlyXTs8kus64w30PkUUjk=";
            };
            # AppleSkin
            appleskin = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4953/883/appleskin-fabric-mc1.19.2-2.5.1.jar";
              hash = "sha256-EeBgTjv42XdR+GT45s+CKESAmcDvVvuzHX6yvPUCF4I=";
            };
            # Controlling
            controlling = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4050/342/Controlling-fabric-1.19.2-10.0%2B7.jar";
              hash = "sha256-WAIwWBFg7q1HGdUdW3Djm/ehIH+Vbop0v5pWdjYH8mM=";
            };
            # Pettable
            pettable = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4099/583/pettable-1.3.1.jar";
              hash = "sha256-Lq44z5d8JZd0mb1AlcJOdZPg7rTM5z22EfTEPgUIJGc=";
            };
            # Sodium
            sodium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/3957/319/sodium-fabric-mc1.19.2-0.4.4%2Bbuild.18.jar";
              hash = "sha256-EuzzqBvMGK6H6HkSTMvF0HnlAL4Q4ji/YfVtpcP3z1M=";
            };
            # Applied Energistics 2 Wireless Terminals
            aew = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4854/629/AE2WTLib-12.9.8.jar";
              hash = "sha256-3ZQUq2c7bCx+2pRAL8PkLpyFcKtYN57mzdMsTQs6Nio=";
            };
            # An Origins Addon - Apocalypse
            originaddonapocalypse = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5266/121/apocalypse_origins-0.3.73-1.19.2.jar";
              hash = "sha256-UPZE0mrOt2HJ9Ci4wIHVYBw/cPly4buM0a1li3Xo8bE=";
            };
            # Entangled
            entangled = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5885/913/entangled-1.3.20-fabric-mc1.19.2.jar";
              hash = "sha256-4Dkk796ejUornVO2qZ9pi8pnvcIKPljTT6Jj2BKh3CQ=";
            };
            # GeckoLib
            geckolib = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4407/239/geckolib-fabric-1.19-3.1.40.jar";
              hash = "sha256-naXUg+wj+ZLI5Yd5EQk3L0mf015xY9nIX1fNT2TWMKc=";
            };
            # Guardians Galore
            galore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4095/977/GuardiansGalore-1.19.2-3.1.jar";
              hash = "sha256-viQWQa/PtkwKB0Flo5hx9RGhotlRaxVZPzjI0qiaU4g=";
            };
            # [Deprecated] Farmer's Delight [Fabric]
            farmersdelight = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4939/667/farmers-delight-fabric-1.3.10.2.jar";
              hash = "sha256-JmDjjhnedxYKuYqZ87OcPm3mtW9vElyQUwzpbYdPo4w=";
            };
            # MidnightLib
            midnightlib = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4059/589/midnightlib-fabric-1.0.0.jar";
              hash = "sha256-VxSeAylgYDEbp9fMeDfJzrICX2HjWtCC1jubIDQcqBk=";
            };
            # Create: Steam 'n' Rails
            steamrails = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5331/259/Steam_Rails-1.6.4%2Bfabric-mc1.19.2.jar";
              hash = "sha256-uuoTVJnZQW852Jog4YISdx4+VcHZ+HKz0VRJ5sbBcIA=";
            };
          }
        );
      };
    };
  };
}
