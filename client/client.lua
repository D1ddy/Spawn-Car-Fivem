RegisterCommand('car', function()
    SendNUI('openUI',true);
    SetNuiFocus(true, true)
end, false)
RegisterCommand('car:random',function()
    local vehicles = GetAllVehicleModels()
    local vehicle = vehicles[math.random(1,#vehicles)]
    RequestModel(vehicle)
    repeat Wait(0) until HasModelLoaded(vehicle)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local created = CreateVehicle(vehicle, playerCoords.x + 1, playerCoords.y + 1, playerCoords.z, heading, true, false)
end,false)

RegisterNUICallback('getClientData', function(_, cb)
    local playerCoords = GetEntityCoords(PlayerPedId())
    cb({
        x = math.ceil(playerCoords.x),
        y = math.ceil(playerCoords.y),
        z = math.ceil(playerCoords.z)
    })
end)

RegisterNUICallback('close', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)
