
local PlayerData = {}
local inRangeHackerman = false
QBCore = exports['qb-core']:GetCoreObject()

function checkforitems()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 

            TriggerEvent("hackerman:openMenu")
        else
            QBCore.Functions.Notify(Lang:t('error.missing_item', "error")
        end
    end, Config.Software.tradeable_item)

end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    
    Wait(500)
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
        
    if Config.UseMojitoDialogue == true then
        TriggerEvent("hackerman:client:loadNPC")
    end
end)


AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

-- This is to make sure you can restart the resource manually without having to log-out.
AddEventHandler('onResourceStart', function(resource)
    
	if resource == GetCurrentResourceName() then
		Wait(200)
		
        PlayerData = QBCore.Functions.GetPlayerData()
		isLoggedIn = true
        --TriggerEvent("hackerman:client:loadNPC")
	end
end)

AddEventHandler("hackerman:client:loadNPC", function()
    
    --if Config.UseMojitoDialogue == true then
        for k,v in pairs(Config.Locations) do
            exports['mojito_dialogue']:NewDialogueCallback(Config.PedModel, vector4(v.coords.x,v.coords.y,v.coords.z,v.coords.w), Config.PedLoadRange, {
                title = Lang:t('text.chat'),
                items = {
                    {text = Lang:t('text.yes'), value="yes"},
                    {text = Lang:t('text.no'), value="no"}
                }
            }, function(selection)
                if selection == "yes" then
                    
                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                        if result then 

                            TriggerEvent("hackerman:openMenu")
                        else
                            QBCore.Functions.Notify(Lang:t('error.missing_item'), "error")
                        end
                    end, Config.Software.tradeable_item)
                    
                else 
                    TriggerEvent('QBCore:Notify', Lang:t('success.exit'), "primary")
                end

            end)
        end
    --end
end)


RegisterNetEvent('hackerman:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = Lang:t('info.vendor'),
            isMenuHeader = true,
        },
        {
            id = 1,
            header = Lang:t('info.ZeroDay1'),
            txt = Lang:t('info.trade'),
            params = {
                event = "hackerman:client:exchangegoodsZeroDay1",
            }
        },
        {
            id = 2,
            header = Lang:t('info.ZeroDay2'),
            txt = Lang:t('info.trade'),
            params = {
                event = "hackerman:client:exchangegoodsZeroDay2",
            }
        },
        {
            id = 3,
            header = Lang:t('info.ZeroDay3'),
            txt = Lang:t('info.trade'),
            params = {
                event = "hackerman:client:exchangegoodsZeroDay3",
            }
        },
        {
            id = 4,
            header = Lang:t('info.ZeroDay4'),
            txt = Lang:t('info.trade'),
            params = {
                event = "hackerman:client:exchangegoodsZeroDay4",
            }
        },
    })
end)

AddEventHandler("hackerman:client:checkforitems", function()
    checkforitems()
end)

AddEventHandler("hackerman:client:exchangegoodsZeroDay1", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 

            TriggerServerEvent("hackerman:server:swapsies", 'zeroday1')
        else
            QBCore.Functions.Notify(Lang:t('error.missing_item', "error")
        end
    end, Config.Software.tradeable_item)
end)

AddEventHandler("hackerman:client:exchangegoodsZeroDay2", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 

            TriggerServerEvent("hackerman:server:swapsies", 'zeroday2')
        else
            QBCore.Functions.Notify(Lang:t('error.missing_item', "error")
        end
    end, Config.Software.tradeable_item)
end)

AddEventHandler("hackerman:client:exchangegoodsZeroDay3", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 

            TriggerServerEvent("hackerman:server:swapsies", 'zeroday3')
        else
            QBCore.Functions.Notify(Lang:t('error.missing_item', "error")
        end
    end, Config.Software.tradeable_item)
end)

AddEventHandler("hackerman:client:exchangegoodsZeroDay4", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then 

            TriggerServerEvent("hackerman:server:swapsies", 'zeroday4')
        else
            QBCore.Functions.Notify(Lang:t('error.missing_item', "error")
        end
    end, Config.Software.tradeable_item)
end)




CreateThread(function()     -- zone set up
    
    if Config.UseMojitoDialogue == true then
        TriggerEvent("hackerman:client:loadNPC")
    
    elseif Config.UseTarget == true then
        for k,v in pairs(Config.Locations) do
            exports[Config.TargetResourceName]:AddBoxZone(v.label, vector3(v.coords.x,v.coords.y,v.coords.z), v.length, v.width, {
                name = v.label,
                heading = v.coords.w,
                debugPoly = Config.Debug,
                minZ = v.minZ,
                maxZ = v.maxZ,
                },{
                options = { {
                            --type = "client",
                            label = v.label,
                            event = "hackerman:client:checkforitems",
                            icon = "fas fa-circle-sort",
                            --job = "all",
                            } },
                distance = 2.0
                })
        end
    end
    
    if Config.UseZones == true then
        
            for k=1, #Config.Locations do
                floors[k] = PolyZone:Create(Config.Locations[k].polyzone, {
                    name="hackysack"..k,
                    minZ = 	Config.Locations[k].minZ,
                    maxZ = Config.Locations[k].maxZ,
                    debugPoly = false
                })
                floors[k]:onPlayerInOut(function(isPointInside)
                    if isPointInside then
                        inRangeHackerman = true
                        
                        exports['qb-core']:DrawText(Lang:t('text.showmenu'))
                    else
                        inRangeHackerman = false
                        exports['qb-core']:HideText()       -- is this ok here? will it close other popup text accidentally?
                    end
                end)
            end
    end
    
end)

CreateThread(function()

    if Config.UseZones then
        while true do
            local sleep = 1000
            if isLoggedIn and closestFloor then
                if inRangeHackerman then
                    sleep = 0
                    if IsControlJustPressed(0, 38) then
                        ShowFloorHeaderMenu()
                        exports['qb-core']:KeyPressed()
                        Wait(500)
                        exports['qb-core']:HideText()
                        sleep = 1000
                    end
                
                end
            end
            Wait(sleep)
        end
    end
end)