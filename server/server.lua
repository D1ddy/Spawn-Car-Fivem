RegisterNetEvent('spawn-car-fivem:server:adminStatus')
AddEventHandler('spawn-car-fivem:server:adminStatus', function()
    local playerSource = source
    local isAdmin = IsPlayerAceAllowed(playerSource, "group.admin") 
    TriggerClientEvent('spawn-car-fivem:client:adminStatus', playerSource, isAdmin)
end)
