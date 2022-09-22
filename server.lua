
local QBCore = exports['qb-core']:GetCoreObject()

webhook = ''        -- # put your webhook in if you want discord reporting

 
RegisterServerEvent('hackerman:server:swapsies')
AddEventHandler('hackerman:server:swapsies', function(software)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local key = 'Hackerman'
    local amount = 1
    local _software = software
    local ItemData = Player.Functions.GetItemByName(Config.Software.tradeable_item)
    local user_id = Player.PlayerData.citizenid

    if ItemData ~= nil then
        Player.Functions.RemoveItem(Config.Software.tradeable_item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Software.tradeable_item], "remove")
        Wait(500)
        if _software == "zeroday1" then
            Player.Functions.AddItem(Config.Software.zeroday1, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Software.zeroday1], "add")
        
        elseif _software == "zeroday2" then
            Player.Functions.AddItem(Config.Software.zeroday2, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Software.zeroday2], "add")
        
        elseif _software == "zeroday3" then
            Player.Functions.AddItem(Config.Software.zeroday3, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Software.zeroday3], "add")
        
        elseif _software == "zeroday4" then
            Player.Functions.AddItem(Config.Software.zeroday4, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Software.zeroday4], "add")
        end
        SendWebhookMessage(Webhook,Lang:t('success.logs_trade_made'):format(key,_software,amount,user_id..os.date("\n["..Lang:t('success.logs_date').."]: %d/%m/%Y ["..Lang:t('success.logs_hour').."]: %H:%M:%S")))
    end
end)




function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end


CreateThread(function(resourceName)
    local resourceName <const> = GetCurrentResourceName()
    PerformHttpRequest('https://raw.githubusercontent.com/troubleNZ/trbl-versions/main/trbl-hackerman.json', function (errorCode, resultData, resultHeaders)
      if not resultData then return end
      local retData <const> = json.decode(resultData)
      local version <const> = retData["version"]
      local currentVersion <const> = GetResourceMetadata(resourceName, "version", 0)
      local upToDateMsg <const> = retData["up-to-date"]["message"]
      local updateMsg <const> = retData["requires-update"]["message"]
      if version ~= currentVersion then
        local updMessage <const> = "^3 - Update here: " .. GetResourceMetadata(resourceName, "repository", 0) .. " (current: v" .. currentVersion .. ", newest: v" .. version .. ")^0"
        if retData["requires-update"]["important"] and updateMsg ~= nil then
          print("")
          print("  ^1Important Message:^0")
          print("")
          print((updateMsg):format(resourceName))
          print(updMessage)
          print("")
          print("")
        elseif updateMsg ~= nil then
          print((updateMsg):format(resourceName) .. "^0")
          print(updMessage)
        end
      elseif upToDateMsg ~= nil then
        print((upToDateMsg):format(resourceName) .. "^0")
      end
    end, 'GET')
  end)