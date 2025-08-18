local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('spawn-car-fivem:server:adminStatus')
local function isAllowedToChange(src)
    return src == 0 or QBCore.Functions.HasPermission(src, "admin") or IsPlayerAceAllowed(src, 'command')
end
AddEventHandler('spawn-car-fivem:server:adminStatus', function()
    local playerSource = source
    local isAdmin = isAllowedToChange(playerSource)
    TriggerClientEvent('spawn-car-fivem:client:adminStatus', playerSource,isAdmin)
end)
