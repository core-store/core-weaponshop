local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
CreateThread(function()
    for k, _ in pairs(Config.location) do
        exports['qb-target']:AddCircleZone(Config.location[k], vector3(Config.location[k][1].xyz), 1.0, {
            name = Config.location[k],
            debugPoly = false,
        }, {
            options = {
                {
                    type = "client",
                    event = "core_weponshop:openshop",
                    icon = "fas fa-gun",
                    label = "Open Weapons Shop",
                },
                {
                    type = "client",
                    event = "core_weponshop:toolshop",
                    icon = "fas fa-gun",
                    label = "Open White Weapons Shop",

                },
            },
            distance = 0.85
        })
    end
end)
CreateThread(function()
    for k, _ in pairs(Config.location) do
        local StoreBlip = AddBlipForCoord(Config.location[k][1].xyz)
        SetBlipSprite(StoreBlip, 110)                      -- Set the sprite for the blip
        SetBlipColour(StoreBlip, 0)
        SetBlipScale(StoreBlip, 0.6)                       -- Set the color for the blip
        SetBlipAsShortRange(StoreBlip, true)               -- Make the blip only visible in a short range
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Weapon Shop") -- Set the blip name text
        EndTextCommandSetBlipName(StoreBlip)               -- End setting the blip nam
    end
end)
RegisterNetEvent('core_weponshop:toolshop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "tools",
        Config.tools)
end)
RegisterNetEvent('core_weponshop:openshop', function()
    QBCore.Functions.TriggerCallback("core_weponshop:server:getLicenseStatus", function(hasLicense, licenseItem)
        if hasLicense and licenseItem then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "weapons",
                Config.weappns)
        else
            QBCore.Functions.Notify('you dont have a license', 'error', 7500)
        end
    end)
end)
