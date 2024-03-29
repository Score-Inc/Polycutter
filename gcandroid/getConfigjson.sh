getConfigJson() {
    getArguments=$1
    if [ $getArguments = "folderStructure" ]; then
        folderStructure_resources=$(jq -r '.folderStructure.resources' config.json)
        folderStructure_data=$(jq -r '.folderStructure.data' config.json)
        folderStructure_packets=$(jq -r '.folderStructure.packets' config.json)
        folderStructure_scripts=$(jq -r '.folderStructure.scripts' config.json)
        folderStructure_plugins=$(jq -r '.folderStructure.plugins' config.json)
    elif [ $getArguments = "Server" ]; then
        logCommands=$(jq '.server.logCommands' config.json 2>/dev/null)
        if [[ $logCommands = "true" ]]; then
            logCommandsOut="${GC}True${WC}"
        elif [[ $logCommands = "false" ]]; then
            logCommandsOut="${RC}False${WC}"
        else
            logCommandsOut="${RC}Error${WC}"
        fi
        runMode=$(jq '.server.runMode' config.json 2>/dev/null)
        if [[ $runMode = "\"HYBRID\"" ]]; then
            runModeOut="${GC}HYBRID${WC}"
        elif [[ $runMode = "\"DISPATCH_ONLY\"" ]]; then
            runModeOut="${GC}DISPATCH_ONLY${WC}"
        elif [[ $runMode = "\"GAME_ONLY\"" ]]; then
            runModeOut="${GC}GAME_ONLY${WC}"
        else
            runModeOut="${RC}Error${WC}"
        fi
    elif [ $getArguments = "Server.HTTP" ]; then
        server_http_bindAddress=$(jq -r '.server.http.bindAddress' config.json 2>/dev/null)
        if [[ $server_http_bindAddress == "" ]]; then
            server_http_bindAddress="${RC}Error${WC}"
        fi
        server_http_accessAddress=$(jq -r '.server.http.accessAddress' config.json 2>/dev/null)
        if [[ $server_http_accessAddress == "" ]]; then
            server_http_accessAddress="${RC}Error${WC}"
        fi
        server_http_accessPort=$(jq '.server.http.accessPort' config.json 2>/dev/null)
        if [[ $server_http_accessPort == "" ]]; then
            server_http_accessPort="${RC}Error${WC}"
        fi
    elif [ $getArguments = "Server.HTTP.Encryption" ]; then
        server_http_encryption_useEncryption=$(jq '.server.http.encryption.useEncryption' config.json 2>/dev/null)
        if [[ $server_http_encryption_useEncryption == "false" ]]; then
            server_http_encryption_useEncryptionOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useEncryption == "true" ]]; then
            server_http_encryption_useEncryptionOut="${GC}True${WC}"
        else
            server_http_encryption_useEncryptionOut="${RC}Error${WC}"
        fi
        server_http_encryption_useInRouting=$(jq '.server.http.encryption.useInRouting' config.json 2>/dev/null)
        if [[ $server_http_encryption_useInRouting == "false" ]]; then
            server_http_encryption_useInRoutingOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useInRouting == "true" ]]; then
            server_http_encryption_useInRoutingOut="${GC}True${WC}"
        else
            server_http_encryption_useInRoutingOut="${RC}Error${WC}"
        fi
        server_http_encryption_keystore=$(jq -r '.server.http.encryption.keystore' config.json 2>/dev/null)
        if [[ $server_http_encryption_keystore == "" ]]; then
            server_http_encryption_keystore="${RC}Error${WC}"
        fi
        server_http_encryption_keystorePassword=$(jq -r '.server.http.encryption.keystorePassword' config.json 2>/dev/null)
        if [[ $server_http_encryption_keystorePassword == "" ]]; then
            server_http_encryption_keystorePassword="${RC}Error${WC}"
        fi
    elif [ $getArguments = "Server.http.policies.cors" ]; then
        server_http_policies_cors_enabled=$(jq '.server.http.policies.cors.enabled' config.json 2>/dev/null)
        if [[ $server_http_policies_cors_enabled == "false" ]]; then
            server_http_policies_cors_enabledOut="${RC}False${WC}"
        elif [[ $server_http_policies_cors_enabled == "true" ]]; then
            server_http_policies_cors_enabledOut="${GC}True${WC}"
        else
            server_http_policies_cors_enabledOut="${RC}Error${WC}"
        fi
    elif [ $getArguments = "server.http.files" ]; then
        server_http_files_indexFile=$(jq -r '.server.http.files.indexFile' config.json 2>/dev/null)
        if [[ $server_http_files_indexFile == "" ]]; then
            server_http_files_indexFile="${RC}Error${WC}"
        fi
        server_http_files_errorFIle=$(jq -r '.server.http.files.errorFile' config.json 2>/dev/null)
        if [[ $server_http_files_errorFIle == "" ]]; then
            server_http_files_errorFIle="${RC}Error${WC}"
        fi
    elif [ $getArguments = "server.http.game" ]; then
        server_game_bindAddress=$(jq -r '.server.game.bindAddress' config.json 2>/dev/null)
        if [[ $server_game_bindAddress == "" ]]; then
            server_game_bindAddress="${RC}Error${WC}"
        fi
        server_game_bindPort=$(jq '.server.game.bindPort' config.json 2>/dev/null)
        if [[ $server_game_bindPort == "" ]]; then
            server_game_bindPort="${RC}Error${WC}"
        fi
        server_game_accessAddress=$(jq -r '.server.game.accessAddress' config.json 2>/dev/null)
        if [[ $server_game_accessAddress == "" ]]; then
            server_game_accessAddress="${RC}Error${WC}"
        fi
        server_game_accessPort=$(jq -r '.server.game.accessPort' config.json 2>/dev/null)
        if [[ $server_game_accessPort == "" ]]; then
            server_game_accessPort="${RC}Error${WC}"
        fi
        server_game_loadEntitiesForPlayerRange=$(jq '.server.game.loadEntitiesForPlayerRange' config.json 2>/dev/null)
        if [[ $server_game_loadEntitiesForPlayerRange == "" ]]; then
            server_game_loadEntitiesForPlayerRange="${RC}Error${WC}"
        fi
        server_game_enableScriptInBigWorld=$(jq '.server.game.enableScriptInBigWorld' config.json 2>/dev/null)
        if [[ $server_game_enableScriptInBigWorld = "true" ]]; then
            server_game_enableScriptInBigWorldOut="${GC}True${WC}"
        elif [[ $server_game_enableScriptInBigWorld = "false" ]]; then
            server_game_enableScriptInBigWorldOut="${RC}False${WC}"
        fi
        server_game_enableConsole=$(jq '.server.game.enableConsole' config.json 2>/dev/null)
        if [[ $server_game_enableConsole == "true" ]]; then
            server_game_enableConsoleOut="${GC}True${WC}"
        elif [[ $server_game_enableConsole == "false" ]]; then
            server_game_enableConsoleOut="${RC}False${WC}"
        else
            server_game_enableConsoleOut="${RC}Error${WC}"
        fi
        server_game_kcpInterval=$(jq '.server.game.kcpInterval' config.json 2>/dev/null)
        if [[ $server_game_kcpInterval == "" ]]; then
            server_game_kcpInterval="${RC}Error${WC}"
        fi
        server_game_logPackets=$(jq -r '.server.game.logPackets' config.json 2>/dev/null)
        if [[ $server_game_logPackets == "" ]]; then
            server_game_logPackets="${RC}Error${WC}"
        fi
        server_game_isShowPacketPayload=$(jq '.server.game.isShowPacketPayload' config.json 2>/dev/null)
        if [[ $server_game_isShowPacketPayload == "false" ]]; then
            server_game_isShowPacketPayloadOut="${RC}False${WC}"
        elif [[ $server_game_isShowPacketPayload == "true" ]]; then
            server_game_isShowPacketPayloadOut="${GC}True${WC}"
        else
            server_game_isShowPacketPayloadOut="${RC}Error${WC}"
        fi
        server_game_isShowLoopPackets=$(jq '.server.game.isShowLoopPackets' config.json 2>/dev/null)
        if [[ $server_game_isShowLoopPackets == "true" ]]; then
            server_game_isShowLoopPacketsOut="${GC}True${WC}"
        elif [[ $server_game_isShowLoopPackets == "false" ]]; then
            server_game_isShowLoopPacketsOut="${RC}False${WC}"
        else
            server_game_isShowLoopPacketsOut="${RC}Error${WC}"
        fi
    elif [ $getArguments == "server.game.gameOptions" ]; then
        server_game_gameOptions_sceneEntityLimit=$(jq '.server.game.gameOptions.sceneEntityLimit' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_sceneEntityLimit == "" ]]; then
            server_game_gameOptions_sceneEntityLimit="${RC}Error${WC}"
        fi
        server_game_gameOptions_watchGachaConfig=$(jq '.server.game.gameOptions.watchGachaConfig' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_watchGachaConfig == "true" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_watchGachaConfig == "false" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${RC}False${WC}"
        else
            server_game_gameOptions_watchGachaConfigOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_enableShopItems=$(jq '.server.game.gameOptions.enableShopItems' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_enableShopItems == "true" ]]; then
            server_game_gameOptions_enableShopItemsOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_enableShopItems == "false" ]]; then
            server_game_gameOptions_enableShopItemsOut="${RC}False${WC}"
        else
            server_game_gameOptions_enableShopItemsOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_staminaUsage=$(jq '.server.game.gameOptions.staminaUsage' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_staminaUsage == "true" ]]; then
            server_game_gameOptions_staminaUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_staminaUsage == "false" ]]; then
            server_game_gameOptions_staminaUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_staminaUsageOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_energyUsage=$(jq '.server.game.gameOptions.energyUsage' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_energyUsage == "true" ]]; then
            server_game_gameOptions_energyUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_energyUsage == "false" ]]; then
            server_game_gameOptions_energyUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_energyUsageOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_fishhookTeleport=$(jq '.server.game.gameOptions.fishhookTeleport' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_fishhookTeleport == "true" ]]; then
            server_game_gameOptions_fishhookTeleportOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_fishhookTeleport == "false" ]]; then
            server_game_gameOptions_fishhookTeleportOut="${RC}False${WC}"
        else
            server_game_gameOptions_fishhookTeleportOut="${RC}Error${WC}"
        fi
    elif [ $getArguments == "server.game.gameOptions.inventoryLimits" ]; then
        server_game_gameOptions_inventoryLimits_weapons=$(jq '.server.game.gameOptions.inventoryLimits.weapons' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_weapons == "" ]]; then
            server_game_gameOptions_inventoryLimits_weapons="${RC}Error${WC}"
        fi
        server_game_gameOptions_inventoryLimits_relics=$(jq '.server.game.gameOptions.inventoryLimits.relics' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_relics == "" ]]; then
            server_game_gameOptions_inventoryLimits_relics="${RC}Error${WC}"
        fi
        server_game_gameOptions_inventoryLimits_materials=$(jq '.server.game.gameOptions.inventoryLimits.materials' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_materials == "" ]]; then
            server_game_gameOptions_inventoryLimits_materials="${RC}Error${WC}"
        fi
        server_game_gameOptions_inventoryLimits_furniture=$(jq '.server.game.gameOptions.inventoryLimits.furniture' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_furniture == "" ]]; then
            server_game_gameOptions_inventoryLimits_furniture="${RC}Error${WC}"
        fi
        server_game_gameOptions_inventoryLimits_all=$(jq '.server.game.gameOptions.inventoryLimits.all' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_all == "" ]]; then
            server_game_gameOptions_inventoryLimits_all="${RC}Error${WC}"
        fi
    elif [ $getArguments == "server.game.gameOptions.avatarLimits" ]; then
        server_game_gameOptions_avatarLimits_singlePlayerTeam=$(jq '.server.game.gameOptions.avatarLimits.singlePlayerTeam' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_avatarLimits_singlePlayerTeam == "" ]]; then
            server_game_gameOptions_avatarLimits_singlePlayerTeam="${RC}Error${WC}"
        fi
        server_game_gameOptions_avatarLimits_multiplayerTeam=$(jq '.server.game.gameOptions.avatarLimits.multiplayerTeam' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_avatarLimits_multiplayerTeam == "" ]]; then
            server_game_gameOptions_avatarLimits_multiplayerTeam="${RC}Error${WC}"
        fi
    elif [ $getArguments == "server.game.gameOptions.resinOptions" ]; then
        server_game_gameOptions_resinOptions_resinUsage=$(jq '.server.game.gameOptions.resinOptions.resinUsage' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_resinOptions_resinUsage == "true" ]]; then
            server_game_gameOptions_resinOptions_resinUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_resinOptions_resinUsage == "false" ]]; then
            server_game_gameOptions_resinOptions_resinUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_resinOptions_resinUsageOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_resinOptions_cap=$(jq '.server.game.gameOptions.resinOptions.cap' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_resinOptions_cap == "" ]]; then
            echo "${RC}Error${WC}"
        fi
        server_game_gameOptions_resinOptions_rechargeTime=$(jq '.server.game.gameOptions.resinOptions.rechargeTime' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_resinOptions_rechargeTime == "" ]]; then
            server_game_gameOptions_resinOptions_rechargeTime="${RC}Error${WC}"
        fi
    elif [ $getArguments == "server.game.gameOptions.rates" ]; then
        server_game_gameOptions_rates_adventureExp=$(jq '.server.game.gameOptions.rates.adventureExp' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_rates_adventureExp == "" ]]; then
            server_game_gameOptions_rates_adventureExp="${RC}Error${WC}"
        fi
        server_game_gameOptions_rates_mora=$(jq '.server.game.gameOptions.rates.mora' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_rates_mora == "" ]]; then
            server_game_gameOptions_rates_mora="${RC}Error${WC}"
        fi
        server_game_gameOptions_rates_leyLines=$(jq '.server.game.gameOptions.rates.leyLines' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_rates_leyLines == "" ]]; then
            server_game_gameOptions_rates_leyLines="${RC}Error${WC}"
        fi
    elif [ $getArguments == "databaseInfo.game" ]; then
        databaseInfo_game_connectionUri=$(jq -r '.databaseInfo.game.connectionUri' config.json 2>/dev/null)
        if [[ $databaseInfo_game_connectionUri == "" ]]; then
            databaseInfo_game_connectionUri="${RC}Error${WC}"
        fi
        databaseInfo_game_collection=$(jq -r '.databaseInfo.game.collection' config.json 2>/dev/null)
        if [[ $databaseInfo_game_collection == "" ]]; then
            databaseInfo_game_collection="${RC}Error${WC}"
        fi
    elif [ $getArguments == "databaseInfo.server" ]; then
        databaseInfo_server_connectionUri=$(jq -r '.databaseInfo.server.connectionUri' config.json 2>/dev/null)
        if [[ $databaseInfo_server_connectionUri == "" ]]; then
            databaseInfo_server_connectionUri="${RC}Error${WC}"
        fi
        databaseInfo_server_collection=$(jq -r '.databaseInfo.server.collection' config.json 2>/dev/null)
        if [[ $databaseInfo_server_collection == "" ]]; then
            databaseInfo_server_collection="${RC}Error${WC}"
        fi
    elif [ $getArguments == "language" ]; then
        language_language=$(jq -r '.language.language' config.json 2>/dev/null)
        if [[ $language_language == "" ]]; then
            language_language="${RC}Error${WC}"
        fi
        language_fallback=$(jq -r '.language.fallback' config.json 2>/dev/null)
        if [[ $language_fallback == "" ]]; then
            language_fallback="${RC}Error${WC}"
        fi
        language_document=$(jq -r '.language.document' config.json 2>/dev/null)
        if [[ $language_document == "" ]]; then
            language_document="${RC}Error${WC}"
        fi
    else
        echo "${RC}Cant Load, Unknown Error!${WC}"
    fi
}
