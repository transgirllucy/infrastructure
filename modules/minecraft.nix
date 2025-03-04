{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  heart = "\u2764";
in {
  # Minecraft server settings
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.fabric = {
      enable = true;

      serverProperties = {
        allow-flight = true;
        difficulty = "normal";
        enable-command-block = true;
        max-players = 16;
        max-world-size = 29999984;
        motd = "${heart} made by bottoms for bottoms ${heart}  meow meow";
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
              hash = "";
            };
            # Patchouli
            patchouli = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4031/404/Patchouli-1.19.2-77-FABRIC.jar";
              hash = "";
            };
            #  Powah
            powah = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4729/360/Powah-4.0.11.jar";
              hash = "";
            };
            # Packet Fixer
            packetfixed = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6195/870/packetfixer-forge-2.0.0-1.19-to-1.20.1.jar";
              hash = "";
            };
            # Icarus
            icarus = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5641/911/icarus-1.14.1.jar";
              hash = "";
            };
            # An Origins Addon - Libra
            originslibra = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5210/380/libra-0.5.45.jar";
              hash = "";
            };
            # Cloth Config API (Fabric/Forge/NeoForge)
            clothapi = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5729/96/cloth-config-8.3.134-forge.jar";
              hash = "";
            };
            # Mythic Mounts
            mmounts = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4507/470/mythic-mounts-1.19.2-7.2.jar";
              hash = "";
            };
            # Create: Estrogen
            estrogen = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5538/93/Estrogen-4.1.1%2B1.19.2-fabric.jar";
              hash = "";
            };
            # Origins Extra Keybinds
            extrakeybindings = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4601/10/extrakeybinds-0.5.0%2B1.17-1.19.4.jar";
              hash = "";
            };
            # FTB Library (Fabric)
            ftblibrary = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4661/833/ftb-library-fabric-1902.4.1-build.236.jar";
              hash = "";
            };
            # SuperMartijn642's Config Lib
            smtcl = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4785/836/supermartijn642configlib-1.1.8a-fabric-mc1.19.jar";
              hash = "";
            };
            # Client Crafting
            client_crafting = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4647/481/clientcrafting-fabric-1.19.2-1.6.jar";
              hash = "";
            };
            # Jade
            jade = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4328/558/Jade-1.19.1-fabric-8.7.3.jar";
              hash = "";
            };
            # Magic Origins
            magicorigins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4717/581/magic_origins%20v0.3.5%201.19-1.19.3.jar";
              hash = "";
            };
            # Lithium (Fabric/NeoForge)
            lithium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4439/700/lithium-fabric-mc1.19.2-0.11.1.jar";
              hash = "";
            };
            # Enchantment Descriptions
            enchdesc = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4277/355/EnchantmentDescriptions-Fabric-1.19.2-13.0.14.jar";
              hash = "";
            };
            # Nature's Compass
            compass = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4118/387/NaturesCompass-1.19.2-2.1.0-fabric.jar";
              hash = "";
            };
            # SuperMartijn642's Core Lib
            corelib = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/6076/729/supermartijn642corelib-1.1.18a-fabric-mc1.19.2.jar";
              hash = "";
            };
            # Bookshelf
            bookshelf = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4556/696/Bookshelf-Fabric-1.19.2-16.3.20.jar";
              hash = "";
            };
            # Origins (Fabric)
            origins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4044/263/Origins-1.19.2-1.7.1.jar";
              hash = "";
            };
            # Animal Origins - Infinite Origins
            animalorigins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5248/756/Animal%20Origins%202.3.0%201.19.2.jar";
              hash = "";
            };
            # Skin Layers 3D (Fabric/Forge)
            skinlayers = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5970/909/skinlayers3d-fabric-1.7.4-mc1.19.2.jar";
              hash = "";
            };
            # Carry On
            carryon = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5141/760/carryon-fabric-1.19.2-2.1.2.23.jar";
              hash = "";
            };
            # Applied Energistics 2
            energistics = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5014/666/appliedenergistics2-fabric-12.9.9.jar";
              hash = "";
            };
            # CorgiLib
            corgi = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4554/112/CorgiLib-fabric-1.19.2-1.0.0.34.jar";
              hash = "";
            };
            # Create Fabric
            createfabric = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5982/729/create-fabric-0.5.1-i-build.1630%2Bmc1.19.2.jar";
              hash = "";
            };
            # Extra Thicc Packets
            thiccpackets = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4032/19/extra_thicc_packets-1.0.jar";
              hash = "";
            };
            # Dig's DnD origins
            dndorigins = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4627/100/digs_dnd_origins-1.19.2-0.0.9.jar";
              hash = "";
            };
            # Night Lights
            lights = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4377/490/nightlights-fabric-1.19.2-1.1.jar";
              hash = "";
            };
            # Cobblemon
            cobblemon = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4468/330/Cobblemon-fabric-1.3.2%2B1.19.2.jar";
              hash = "";
            };
            # Oh The Biomes You'll Go Refabricated
            biomes = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5116/295/Oh_The_Biomes_You%27ll_Go-fabric-1.19.2-2.0.1.6.jar";
              hash = "";
            };
            # Trinkets (Fabric)
            trinkets = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4343/755/trinkets-3.4.2.jar";
              hash = "";
            };
            # Indium
            indium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/3957/480/indium-1.0.9%2Bmc1.19.2.jar";
              hash = "";
            };
            # spark
            spark = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4505/310/spark-1.10.37-fabric.jar";
              hash = "";
            };
            # JourneyMap
            journeymap = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5208/377/journeymap-1.19.2-5.9.8-fabric.jar";
              hash = "";
            };
            # MEGA Cells
            megacells = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4780/807/megacells-fabric-2.0.4-1.19.2.jar";
              hash = "";
            };
            # Wraith Waystones
            waystones = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4567/225/wraith-waystones-3.0.8%2Bmc1.19.2.jar";
              hash = "";
            };
            # oωo (owo-lib)
            owo = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4152/949/owo-lib-0.9.3%2B1.19.jar";
              hash = "";
            };
            #  ModernFix
            modernfix = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5803/580/modernfix-fabric-5.18.1%2Bmc1.19.2.jar";
              hash = "";
            };
            # FTB Essentials (Forge & Fabric)
            essentials = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5120/108/ftb-essentials-fabric-1902.3.5-build.120.jar";
              hash = "";
            };
            # Critters and Companions
            companions = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4644/101/crittersandcompanions-fabric-1.19.2-2.0.2.jar";
              hash = "";
            };
            # Mouse Tweaks
            mouse = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/3828/448/MouseTweaks-fabric-mc1.19-2.22.jar";
              hash = "";
            };
            # Architectury API
            architectury = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5137/941/architectury-6.6.92-fabric.jar";
              hash = "";
            };
            # Blahaj (Fabric)
            blahaj = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4467/187/blahaj-fabric-1.19-0.3.2.jar";
              hash = "";
            };
            # AppleSkin
            appleskin = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4953/883/appleskin-fabric-mc1.19.2-2.5.1.jar";
              hash = "";
            };
            # Controlling
            controlling = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4050/342/Controlling-fabric-1.19.2-10.0%2B7.jar";
              hash = "";
            };
            # Pettable
            pettable = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4099/583/pettable-1.3.1.jar";
              hash = "";
            };
            # Sodium
            sodium = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/3957/319/sodium-fabric-mc1.19.2-0.4.4%2Bbuild.18.jar";
              hash = "";
            };
            # Applied Energistics 2 Wireless Terminals
            aew = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4854/629/AE2WTLib-12.9.8.jar";
              hash = "";
            };
            # An Origins Addon - Apocalypse
            originaddonapocalypse = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5266/121/apocalypse_origins-0.3.73-1.19.2.jar";
              hash = "";
            };
            # Entangled
            entangled = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5885/913/entangled-1.3.20-fabric-mc1.19.2.jar";
              hash = "";
            };
            # GeckoLib
            geckolib = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4407/239/geckolib-fabric-1.19-3.1.40.jar";
              hash = "";
            };
            # Guardians Galore
            galore = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4095/977/GuardiansGalore-1.19.2-3.1.jar";
              hash = "";
            };
            # [Deprecated] Farmer's Delight [Fabric]
            farmersdelight = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4939/667/farmers-delight-fabric-1.3.10.2.jar";
              hash = "";
            };
            # MidnightLib
            midnightlib = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/4059/589/midnightlib-fabric-1.0.0.jar";
              hash = "";
            };
            # Create: Steam 'n' Rails
            steamrails = pkgs.fetchurl {
              url = "https://mediafilez.forgecdn.net/files/5331/259/Steam_Rails-1.6.4%2Bfabric-mc1.19.2.jar";
              hash = "";
            };
          }
        );
      };
    };
  };
}
