local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateCallback('core_weponshop:server:getLicenseStatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]
    local licenseItem = Player.Functions.GetItemByName("weaponlicense")
    local licenseHuntingItem = Player.Functions.GetItemByName("huntinglicense")
    cb(licenseTable.weapon, licenseItem, licenseTable.hunting, licenseHuntingItem)
end)
