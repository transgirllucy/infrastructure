{ config, pkgs, lib, inputs, ... }:
let heart = "u2764";
in {
  # Minecraft server settings
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.polycule = {
      enable = true;

      whitelist = {
        Lucy = "e6c59dfa-41d5-432e-ac30-7383c362dbd9";
        Bettle = "d53695fa-65ff-4d96-9eb9-fa5e9edccb79";
        Spectre = "c30b5867-5712-48aa-be32-1d8129a7c670";
        Lumin3ra = "ad088567-d813-4e8a-b82a-76d1210da444";
        Ruby = "dba84e4c-e487-4d37-991f-9fcb9d96f12f";
        Aria = "9864936c-0e53-4bb6-8436-4a88ee8cec97";
        Angel = "1e635818-ddf4-4f7a-933d-25fffb1e0087";
        Terah = "746ddded-d9b7-4345-9a47-de8d1225a181";
        Blue = "4a8b53e0-0f24-46c7-b588-932dd3958582";
        TheMegaBite = "de56289a-e87f-4d78-a0b8-419a90a7bb9e";
      };

      serverProperties = {
        allow-flight = true;
        white-list = true;
        difficulty = "normal";
        enable-command-block = true;
        max-players = 16;
        max-world-size = 29999984;
        motd =
          "/${heart} made by bottoms for bottoms /${heart}  meow meow /${heart}";
        spawn-protection = 0;
      };

      # Specify the custom minecraft server package
      package = pkgs.fabricServers.fabric-1_19_2;
      #.override {
      #loaderVersion = "0.16.10";
      #}; # Specific fabric loader version

      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          Fabric-API = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4902/659/fabric-api-0.77.0%2B1.19.2.jar";
            hash = "sha256-D8YnRKOPYp/ghAiTcT5qER7RJjcZ+T5JnJkGiIEYJOw=";
          };
          # Just Enough Breeding (JEBr)
          jeb = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5682/312/justenoughbreeding-fabric-1.19-1.19.2-1.4.0.jar";
            hash = "sha256-56MNyBaZqWrG5DEwbW5U4JpX15okkemI6awTlJxtHT0=";
          };
          # Just Enough Farmer's Recipes
          jefr = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4357/825/JustEnoughFarmersRecipes-1.19-1.0.1.jar";
            hash = "sha256-RLO093uarBp60NrsOy8d+i2t2/tlIEVLRyV8j26ymYA=";
          };
          # Jade Addons (Fabric)
          jad = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6157/654/JadeAddons-1.19.2-fabric-3.2.1.jar";
            hash = "sha256-flVY5QjrxR/fVqlhySDO5zbscivw9Aiz2K2Gntsz6es=";
          };
          # TerraBlender (Fabric)
          trbl = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4618/489/TerraBlender-fabric-1.19.2-2.0.1.166.jar";
            hash = "sha256-3pHbCCjbyGlitmKKAMu3FpTxEbmc1L6sqQT7xBwyLcU=";
          };
          # Just Enough Items (JEI)
          jei = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5846/857/jei-1.19.2-fabric-11.8.1.1034.jar";
            hash = "sha256-W0FY9k4ld5G8H+pbA3mFJdm6WwmVovV9ZoBU6twSvbM=";
          };
          #  Pehkui
          pekhui = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5419/266/Pehkui-3.8.3%2B1.14.4-1.21.jar";
            hash = "sha256-MSnm/UcGIAfIFe69G9Zzmo7M6s9d4vdLIszgt1+tp1s=";
          };
          # Create Big Cannons
          cbc = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5598/849/createbigcannons-5.5.1-mc.1.19.2-fabric.jar";
            hash = "sha256-jZhu/ioBP6xfvD8FXHe+zFvkpn0Er+8rL4XnJQ5dkEs=";
          };
          # Patchouli
          patchouli = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4031/404/Patchouli-1.19.2-77-FABRIC.jar";
            hash = "sha256-PlQKsomrLPBFMuaBg3SPEXkdpclT9SXpG1QFg2z/xG8=";
          };
          #  Powah
          powah = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4729/360/Powah-4.0.11.jar";
            hash = "sha256-huBf3ee1q73DHFBZrd+UOqQgmD1Uvw0yRxzlVjspZQQ=";
          };
          # Packet Fixer
          packetfixed = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6195/870/packetfixer-forge-2.0.0-1.19-to-1.20.1.jar";
            hash = "sha256-HBsaUKepoYxhAsjusQuiPXVOAg9zPzJkBWWKbuGmjIo=";
          };
          # Icarus
          icarus = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5641/911/icarus-1.14.1.jar";
            hash = "sha256-esmB31BPUOOXOyELejBSbmIcoD1SloUtOMMnAn+c1ds=";
          };
          # An Origins Addon - Libra
          originslibra = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5210/380/libra-0.5.45.jar";
            hash = "sha256-wqbnrwDFOtMO3iqWO/BiTeGDaWU43foRm3G4elfq0rI=";
          };
          # Cloth Config API (Fabric/Forge/NeoForge)
          clothapi = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5729/96/cloth-config-8.3.134-forge.jar";
            hash = "sha256-NQUZ9F47R3sCVTQuM5Us21XM3CSF/6/dEAo81xbc9oo=";
          };
          # Mythic Mounts
          mmounts = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4507/470/mythic-mounts-1.19.2-7.2.jar";
            hash = "sha256-CYxLOtnEjey2QLZA0pR+edpUjiWJJdlPbRFJt58lbUg=";
          };
          # Create: Estrogen
          estrogen = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5538/93/Estrogen-4.1.1%2B1.19.2-fabric.jar";
            hash = "sha256-uE4l8CU9bKre4qVsQPvjbJZc/YAQacHz5XNocQs15XM=";
          };
          # Origins Extra Keybinds
          extrakeybindings = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4601/10/extrakeybinds-0.5.0%2B1.17-1.19.4.jar";
            hash = "sha256-slosvoCi3h9lVaEOm8PpkrZPVGOrFsCg0BBDwrZJ2d8=";
          };
          # FTB Library (Fabric)
          ftblibrary = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4661/833/ftb-library-fabric-1902.4.1-build.236.jar";
            hash = "sha256-4hOptfQCtOPaO72HbtDLAJoQ6Ydgwkz1P+NhwulWpzA=";
          };
          # SuperMartijn642's Config Lib
          smtcl = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4785/836/supermartijn642configlib-1.1.8a-fabric-mc1.19.jar";
            hash = "sha256-pVSl22+RUq/NYhbeYILO9ZCxQPfFTdOhpcIpmkxDfUA=";
          };
          # Client Crafting
          client_crafting = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4647/481/clientcrafting-fabric-1.19.2-1.6.jar";
            hash = "sha256-c1gDtcWMwSO4/EUa+9RgvpyJx3qy4tgTWAQ/Qdoa9to=";
          };
          # Jade
          jade = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4328/558/Jade-1.19.1-fabric-8.7.3.jar";
            hash = "sha256-6TBpFWGwCGijIs/HfNwdWZP8/BoiKTikZqTs+8jf5EI=";
          };
          # Magic Origins
          magicorigins = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4717/581/magic_origins%20v0.3.5%201.19-1.19.3.jar";
            hash = "sha256-Eq6moXuXUe+EF3naEvJINjvY0r5ssT33jzl/2qkXPxo=";
          };
          # Lithium (Fabric/NeoForge)
          lithium = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4439/700/lithium-fabric-mc1.19.2-0.11.1.jar";
            hash = "sha256-fuahLMXavQvNbTaHQycN4IvC26wR0rXG1iGEG49EhiE=";
          };
          # Enchantment Descriptions
          enchdesc = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4277/355/EnchantmentDescriptions-Fabric-1.19.2-13.0.14.jar";
            hash = "sha256-2iVwYGxQIXKlzMAt6vlH91ElUWqM6uLZ7VXDpOMFBV0=";
          };
          # Nature's Compass
          compass = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4118/387/NaturesCompass-1.19.2-2.1.0-fabric.jar";
            hash = "sha256-72J2jSj4tkdHp9LTuoo2bxJV0MUoq1EPGlylpwwVTWg=";
          };
          # SuperMartijn642's Core Lib
          corelib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6076/729/supermartijn642corelib-1.1.18a-fabric-mc1.19.2.jar";
            hash = "sha256-HidVdX8NHpqaCDyypV/7/vDqgrc2QP9DYCceXxGeA/g=";
          };
          # Bookshelf
          bookshelf = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4556/696/Bookshelf-Fabric-1.19.2-16.3.20.jar";
            hash = "sha256-b12Da0xz6iTst3CW1zVCEsNgc4BxbHMHR/1Yk4L2wu8=";
          };
          # Origins (Fabric)
          origins = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4044/263/Origins-1.19.2-1.7.1.jar";
            hash = "sha256-7T22iNJ7RWoMJhMi7j5PnMznssA2o7M2K1o5/aTxYak=";
          };
          # Animal Origins - Infinite Origins
          animalorigins = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5248/756/Animal%20Origins%202.3.0%201.19.2.jar";
            hash = "sha256-dCT6e8wzb4uD0S36J6MvTknKKfcfB0DsLwYDpI8HiQ4=";
          };
          # Skin Layers 3D (Fabric/Forge)
          skinlayers = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5970/909/skinlayers3d-fabric-1.7.4-mc1.19.2.jar";
            hash = "sha256-fFKXS7Cbdd8I/UZfz0PJfQsp1duJSdmBjpSduIady5c=";
          };
          # Carry On
          carryon = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5141/760/carryon-fabric-1.19.2-2.1.2.23.jar";
            hash = "sha256-GBeH/ZXQ08sSY5U2YQ7o4kfAhQZqF4Jp2aWgtyGvbVU=";
          };
          # Applied Energistics 2
          energistics = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5014/666/appliedenergistics2-fabric-12.9.9.jar";
            hash = "sha256-+TScA+J1bN2zuuCJJJ/od8eZdgCLJ4+RDMcrLVY8kKs=";
          };
          # CorgiLib
          corgi = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4554/112/CorgiLib-fabric-1.19.2-1.0.0.34.jar";
            hash = "sha256-brXcUr4h5yfOlWwb4ib8lbMvtkSSmxcvNY1w1uShwbg=";
          };
          # Create Fabric
          createfabric = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5245/232/create-fabric-0.5.1-f-build.1416%2Bmc1.19.2.jar";
            hash = "sha256-NxZ3LaK4kASp8VJIvvQ/Azjc051uU5qw1xH2gGC1JTA=";
          };
          # Extra Thicc Packets
          thiccpackets = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4032/19/extra_thicc_packets-1.0.jar";
            hash = "sha256-gOwKcFa3f7HgABoBWn0xN07uZw70R4qtJpVNgbg7VfU=";
          };
          # Dig's DnD origins
          dndorigins = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4627/100/digs_dnd_origins-1.19.2-0.0.9.jar";
            hash = "sha256-wbO6jWtfsnOj8GJWI1VtbtOt5A1m9Cq5uUecF4XuJ6o=";
          };
          # Night Lights
          lights = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4377/490/nightlights-fabric-1.19.2-1.1.jar";
            hash = "sha256-KSec5VraC8BPFBHe0p/GIeCM/2nBqYEZXUyEPFn9cvM=";
          };
          # Cobblemon
          cobblemon = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4468/330/Cobblemon-fabric-1.3.2%2B1.19.2.jar";
            hash = "sha256-JWsmnNWuU7OkmH2s9kGRaBvpL7VVE8fly5qR/Mi8BBw=";
          };
          # Oh The Biomes You'll Go Refabricated
          biomes = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5116/295/Oh_The_Biomes_You%27ll_Go-fabric-1.19.2-2.0.1.6.jar";
            hash = "sha256-s1Q5NfuaxkRk4zH04RAJ06OjRtqasTMGTJFTcSLJFUM=";
          };
          # Trinkets (Fabric)
          trinkets = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4343/755/trinkets-3.4.2.jar";
            hash = "sha256-WAfjgAAMjgzPo6KdNZgZ1VdgCzu03QiQ6QU8hG4/7Ng=";
          };
          # Indium
          indium = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/3957/480/indium-1.0.9%2Bmc1.19.2.jar";
            hash = "sha256-4L7jIedxykbEEXpGnNkWpx+M5Ey/01wAZCV3Xt+3m1A=";
          };
          # spark
          spark = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4505/310/spark-1.10.37-fabric.jar";
            hash = "sha256-93jph4eUaoaUzmA7lj2LqQdzcPR0OE2jjGB7z0u3dO8=";
          };
          # JourneyMap
          journeymap = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5208/377/journeymap-1.19.2-5.9.8-fabric.jar";
            hash = "sha256-9D95hLhEUj4IClwKas0Yop7Hb+sOCGvs0iPCReubjLc=";
          };
          # MEGA Cells
          megacells = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4780/807/megacells-fabric-2.0.4-1.19.2.jar";
            hash = "sha256-ffDrhOlyFnviDMdfOcR84yehwbw96P7vxJcnw2Am8nA=";
          };
          # Wraith Waystones
          waystones = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4567/225/wraith-waystones-3.0.8%2Bmc1.19.2.jar";
            hash = "sha256-g9nGv8Sgv96qNZOCXxaBSo8IbMh+rVFUktnemZ5okog=";
          };
          # oωo (owo-lib)
          owo = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4152/949/owo-lib-0.9.3%2B1.19.jar";
            hash = "sha256-qFz5fPCDAQhqvng/3pC5ZMeZRQzv8BzXnObT07cOSpw=";
          };
          #  ModernFix
          modernfix = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5803/580/modernfix-fabric-5.18.1%2Bmc1.19.2.jar";
            hash = "sha256-ZgGd5BpStiEy7nRL8KlLxOqpD0XlCKMbt+ncPmVAF84=";
          };
          # FTB Essentials (Forge & Fabric)
          essentials = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5120/108/ftb-essentials-fabric-1902.3.5-build.120.jar";
            hash = "sha256-tI1qICzBAaOC7gEOT1zcRLbsqQtPf3ZtZ19iSno3BUc=";
          };
          # Critters and Companions
          companions = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4644/101/crittersandcompanions-fabric-1.19.2-2.0.2.jar";
            hash = "sha256-Dzm30xmc5A8bIs863MtPt/x1Q4ziTtpwBYXBq7rK1YY=";
          };
          # Mouse Tweaks
          mouse = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/3828/448/MouseTweaks-fabric-mc1.19-2.22.jar";
            hash = "sha256-3jAT51/0TSDU956NUX0khc/UojZUoJxA7/X+45a4NtY=";
          };
          # Architectury API
          architectury = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5137/941/architectury-6.6.92-fabric.jar";
            hash = "sha256-By0Zy+Hc9GWIyBU3G1oxhv+EUSu9Ke0GvHSWm7OFdUM=";
          };
          # Blahaj (Fabric)
          blahaj = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4467/187/blahaj-fabric-1.19-0.3.2.jar";
            hash = "sha256-Fu35ur/JZgJ6N0gzo7kzk8VlyXTs8kus64w30PkUUjk=";
          };
          # AppleSkin
          appleskin = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4953/883/appleskin-fabric-mc1.19.2-2.5.1.jar";
            hash = "sha256-EeBgTjv42XdR+GT45s+CKESAmcDvVvuzHX6yvPUCF4I=";
          };
          # Controlling
          controlling = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4050/342/Controlling-fabric-1.19.2-10.0%2B7.jar";
            hash = "sha256-WAIwWBFg7q1HGdUdW3Djm/ehIH+Vbop0v5pWdjYH8mM=";
          };
          # Pettable
          pettable = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4099/583/pettable-1.3.1.jar";
            hash = "sha256-Lq44z5d8JZd0mb1AlcJOdZPg7rTM5z22EfTEPgUIJGc=";
          };
          # Sodium
          sodium = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/3957/319/sodium-fabric-mc1.19.2-0.4.4%2Bbuild.18.jar";
            hash = "sha256-EuzzqBvMGK6H6HkSTMvF0HnlAL4Q4ji/YfVtpcP3z1M=";
          };
          # Applied Energistics 2 Wireless Terminals
          aew = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4854/629/AE2WTLib-12.9.8.jar";
            hash = "sha256-3ZQUq2c7bCx+2pRAL8PkLpyFcKtYN57mzdMsTQs6Nio=";
          };
          # An Origins Addon - Apocalypse
          originaddonapocalypse = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5266/121/apocalypse_origins-0.3.73-1.19.2.jar";
            hash = "sha256-UPZE0mrOt2HJ9Ci4wIHVYBw/cPly4buM0a1li3Xo8bE=";
          };
          # Entangled
          entangled = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5885/913/entangled-1.3.20-fabric-mc1.19.2.jar";
            hash = "sha256-4Dkk796ejUornVO2qZ9pi8pnvcIKPljTT6Jj2BKh3CQ=";
          };
          # GeckoLib
          geckolib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4407/239/geckolib-fabric-1.19-3.1.40.jar";
            hash = "sha256-naXUg+wj+ZLI5Yd5EQk3L0mf015xY9nIX1fNT2TWMKc=";
          };
          # Guardians Galore
          galore = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4095/977/GuardiansGalore-1.19.2-3.1.jar";
            hash = "sha256-viQWQa/PtkwKB0Flo5hx9RGhotlRaxVZPzjI0qiaU4g=";
          };
          # [Deprecated] Farmer's Delight [Fabric]
          farmersdelight = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4939/667/farmers-delight-fabric-1.3.10.2.jar";
            hash = "sha256-JmDjjhnedxYKuYqZ87OcPm3mtW9vElyQUwzpbYdPo4w=";
          };
          # MidnightLib
          midnightlib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4059/589/midnightlib-fabric-1.0.0.jar";
            hash = "sha256-VxSeAylgYDEbp9fMeDfJzrICX2HjWtCC1jubIDQcqBk=";
          };
          # Create: Steam 'n' Rails
          steamrails = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5331/259/Steam_Rails-1.6.4%2Bfabric-mc1.19.2.jar";
            hash = "sha256-uuoTVJnZQW852Jog4YISdx4+VcHZ+HKz0VRJ5sbBcIA=";
          };
          #Macaw's Furniture
          MacawsFurniture = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5589/835/mcw-furniture-3.3.0-mc1.19.2fabric.jar";
            hash = "sha256-RGJWoszYYD9tYakWNsA9jE6VggntJjQhIiQ93VR8qTk=";
          };
          #Macaw's Paths and Pavings
          MacawsPathsandPavings = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6244/66/mcw-paths-1.1.0fabric-mc1.19.2.jar";
            hash = "sha256-DhbIjy9FkfzCMm+dA64D1KgxJ3QEhZsE0Ltn9JB02Xk=";
          };
          #Cucumber Library
          CucumberLibrary = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4610/684/Cucumber-Refabricated-1.19.2-1.0.6.jar";
            hash = "sha256-UyNDtzVkByrXoIc4kXzzAJWJ0Bme0Hqetzz/mcfn86k=";
          };
          #Forge Config Api
          ForgeConfigApi = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4401/535/ForgeConfigAPIPort-v4.2.11-1.19.2-Fabric.jar";
            hash = "sha256-vWnwxoN8cY19vXQW+8Tb/sv6ca8aH0CbPs35C41w8JM=";
          };
          #Mystical Agriculture
          MysticalAgriculture = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4614/164/MysticalAgriculture-Refabricated-1.19.2-2.0.8.jar";
            hash = "sha256-qVNnqRU+wQshQzRsZ3n4JiSlZYBo0qI5FLGr/m6JC3M=";
          };
          #playerAnimator
          playerAnimator = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4418/150/player-animation-lib-fabric-1.0.2.jar";
            hash = "sha256-Y5Q/Numw9h4GsW7TXFY174fyS9NrfkEc0YzGk8plw4Q=";
          };
          #Better Combat
          BetterCombat = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4534/620/bettercombat-fabric-1.7.1%2B1.19.jar";
            hash = "sha256-VA3QDJptOttN0rqroh2Ond14lFXprLmE7BEkCxHFcKQ=";
          };
          #BCLib
          BCLib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4986/808/bclib-2.1.8.jar";
            hash = "sha256-+f2Bckd0v658L4PqKcRJsxrXbYsle6DwhHpd+MyRb0s=";
          };
          #betterend
          BetterEnd = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4986/810/better-end-2.1.7.jar";
            hash = "sha256-Fzax425CiQso3NfTNJ3jUrEmYgP/uSCalAqeXEEJgi4=";
          };
          #betternether
          BetterNether = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4986/817/better-nether-7.1.5.jar";
            hash = "sha256-KsUmdUBfih8/6lFBI6VctN3X+6usIIzS2q/Vf4UJfos=";
          };
          #Clumbs
          Clumbs = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4153/346/Clumps-fabric-1.19.2-9.0.0%2B14.jar";
            hash = "sha256-G3ZShCHO32myf3CkpJ95q3ssODL2KRAumDNsFz5dY30=";
          };
          #FTB Ultimine
          FTBUltimine = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5670/776/ftb-ultimine-fabric-1902.4.2-build.14.jar";
            hash = "sha256-8lGQfT5CpZt5hyXAwHIfi3sduLjBC5Ac9FbKHAPk6HE=";
          };
          #Collective
          Colletive = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5460/518/collective-1.19.2-7.64.jar";
            hash = "sha256-npF2trVMtRhukJVhO/PpWkfGgncR9CBabiCCDovCvB0=";
          };
          #Double Doors
          DoubleDoors = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5334/520/doubledoors-1.19.2-5.7.jar";
            hash = "sha256-4VbbCSr1QMhIKPI5QueETg66SJQX8IUJHYEJqhXGQmg=";
          };
          #Fabric Seasons
          FabricSeasons = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4699/684/fabric-seasons-2.3%2B1.19.jar";
            hash = "sha256-ihAEtTnx7kDlSZ+MpkG2PFkI10+hzKPVYZY7DZL9Ex8=";
          };
          #McPitanLib
          McPitanLib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6160/201/mcpitanlib-3.1.5-1.19.2-fabric.jar";
            hash = "sha256-Bz9EVjXNKKMSl201fU0iW6leONDH5wDDSj8Sd5j4mOc=";
          };
          #Uncrafting Table
          UncraftingTable = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6136/588/UncraftingTable-fabric-1.4.5.jar";
            hash = "sha256-c1GfQh8r83fErV3WPXSg7IWPBvcITWx3Z+nX+i3q8bY=";
          };
          #Valkyrian Skys
          ValkyrianSkys = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4994/897/valkyrienskies-119-2.1.2-beta.1.jar";
            hash = "sha256-2Rs8F9PY6F9NwD1aHtk9n/Jas41mO5OTfVtRf5+7zuk=";
          };
          #Clockwork
          Clockworks = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5171/527/clockwork-1.19.2-0.1.13-fabric-4621aeec07.jar";
            hash = "sha256-Vz86S2nf5YEij2CU7K5f73bhgjkMEl02EdtzYqAIbPk=";
          };
          #Botania
          Botania = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5608/809/Botania-1.19.2-440.2-FABRIC.jar";
            hash = "sha256-i600B9eTmhifj8+NRoRTFzXFNaz7Hwp9pvT2S+1z8p0=";
          };
          #MrCrayfish's Furniture
          MrCrayfishsFurniture = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6186/452/refurbished_furniture-fabric-1.19.2-1.0.9.jar";
            hash = "sha256-Pd/cwV+b8P66x3E86q2vQWYlECjmIbV0+0T5TmtE5LE=";
          };
          #Moonlight Lib
          MoonlightLib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5567/103/moonlight-1.19.2-2.3.7-fabric.jar";
            hash = "sha256-12h2Sa/Ip/qXvnRCcZQGv6TJnsRI5jC+ouUsjjmiI1Y=";
          };
          #Supplementaries
          Supplementaries = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5226/669/supplementaries-1.19.2-2.4.21-fabric.jar";
            hash = "sha256-iW1TtFJhRfQT4hnzvD9Cmio+0VUoKi7gpxjo2+4yd0o=";
          };
          #Macow's Roofs
          MacowsRoofs = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5554/923/mcw-roofs-2.3.1-mc1.19.2fabric.jar";
            hash = "sha256-oJcVbF/1KGSMY/ta6WANO9g2yx7NqyuENzZ8+IW7bt4=";
          };
          #Chunkloaders
          Chunkloaders = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4809/753/chunkloaders-1.2.8a-fabric-mc1.19.2.jar";
            hash = "sha256-L3uEISVVc3i8GAkax+Z/t870dWk14HktBpaGe9OiTXk=";
          };
          #sophisticatedbackpacks
          sophisticatedbackpacks = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5803/830/sophisticatedbackpacks-1.19.2-3.20.2.22.jar";
            hash = "sha256-TeWI17wvS24GLs+gd4krlVsZGBvkcoU0WsdzPqBgyfc=";
          };
          #sophisticatedcore
          sophisticatedcore = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5803/819/sophisticatedcore-1.19.2-0.6.4.30.jar";
            hash = "sha256-QB9j44mIc9+sDXJXh+avCiWU9IU5v3bOIhjRHuFbo+Q=";
          };
          #sophisticatedstorage
          sophisticatedstorage = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5803/875/sophisticatedstorage-1.19.2-0.9.7.19.jar";
            hash = "sha256-Zk34GI7pIwScJedWJe4d/aX6xFUI25W14VL2c1g0rV4=";
          };
          #Eureka
          Eureka = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5321/627/eureka-1192-1.5.1-beta.2.jar";
            hash = "sha256-+Z2c7diZRw1lvticRLR/GmuPABDbYySu3pyTwKKeyfY=";
          };
          #simplyswords
          simplyswords = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4553/235/simplyswords-fabric-1.47.0-1.19.2.jar";
            hash = "sha256-C5UKjty7SrRwE5DjClaqh6+0NkN4HIsHZXbZ2tZvV2U=";
          };
          #Zenith
          Zenith = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5175/226/zenith-0.7.3%2B1.19.2%20.jar";
            hash = "sha256-zsVeu6mc1psbDv8NlQaD0YgDrVJdo0SzQNvD3weynDM=";
          };
          #dataattributes
          dataattributes = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4580/191/dataattributes-1.4.6%2B1.19.2.jar";
            hash = "sha256-N+X6uDt2VHuib1BVYVuUTLUhgbJ/i+JqBd8bgdQtptk=";
          };
          #playerex
          playerex = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/4608/785/playerex-3.5.4%2B1.19.2.jar";
            hash = "sha256-9kl9QHNF+x3FCsEXN0ZZM+P/6ZD1uXQYh+pqG8L/iIE=";
          };
          #simplevoicechat
          simplevoicechat = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6239/595/voicechat-fabric-1.19.2-2.5.28.jar";
            hash = "sha256-VQZpZCjK7scEPOpWI+gxHPeyc1uq2ysZVbFSIvz+qPk=";
          };
          #macawsandbioms
          macawsandbioms = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6196/872/mcwbyg-fabric-1.19-1.1.jar";
            hash = "sha256-hpmya3URIJYn3jV2MrVipNtMNxY8ZnhUIQaNmCzL+9M=";
          };
          #updatefixerupper
          updatefixerupper = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/3909/688/updatefixerupper-1.0.2.jar";
            hash = "sha256-cPvWU1x3fnnS8TquwipT00QRL3e3FYEnCk6xIn+GIa4=";
          };
          # addonslib
          addonslib = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/6192/759/addonslib-fabric-1.19-1.3.jar";
            hash = "sha256-QfWuDwGQfnB3eO7X2KK7jdgq/HuiuWcgKVvvhT4JroY=";
          };
          # framework
          framework = pkgs.fetchurl {
            url =
              "https://mediafilez.forgecdn.net/files/5692/376/framework-fabric-1.19.2-0.7.12.jar";
            hash = "sha256-9ar4i5Jz+Qv3KNCYM3FCle167GdgTac9P8qzYnWqGdU=";
          };
        });
      };
    };
  };
}
