local vehicles = GetAllVehicleModels()
local arrayOfVehicles = {}
local isPlayerAdmin = false
RegisterNetEvent('spawn-car-fivem:client:adminStatus')
AddEventHandler('spawn-car-fivem:client:adminStatus', function(isAdmin)
    isPlayerAdmin = isAdmin
    
end)
RegisterCommand('car', function()
    TriggerServerEvent('spawn-car-fivem:server:adminStatus')
    if isPlayerAdmin then
        for i = 1, 6, 1 do
            arrayOfVehicles[i] = vehicles[math.random(1,#vehicles)]
        end
        SendNUI('getCars',arrayOfVehicles)
        SendNUI('openUI',true)
        SetNuiFocus(true, true)
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[Server]", "Admin status needed"}
        })
    end
end, false)
RegisterCommand('car:random',function()
    if isPlayerAdmin then
        local vehicles = GetAllVehicleModels()
        local vehicle = vehicles[math.random(1,#vehicles)]
        RequestModel(vehicle)
        repeat Wait(0) until HasModelLoaded(vehicle)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local created = CreateVehicle(vehicle, playerCoords.x + 1, playerCoords.y + 1, playerCoords.z, heading, true, false)
        local plate = GetVehicleNumberPlateText(created)
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[Server]", "Admin status needed"}
        })
    end
end,false)

RegisterNUICallback('getSelectedCar',function(data,cb)
    if isPlayerAdmin then
        local vehicle = data
        RequestModel(vehicle)
        repeat Wait(0) until HasModelLoaded(vehicle)    
        local playerCoords = GetEntityCoords(PlayerPedId())
        local created = CreateVehicle(vehicle, playerCoords.x + 1, playerCoords.y + 1, playerCoords.z, heading, true, false)
        local plate = GetVehicleNumberPlateText(created)
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        cb({})
        SetNuiFocus(false,false)
    end
end)
RegisterNUICallback('getRandomCar',function(data,cb)
    if isPlayerAdmin then
        local vehicle = vehicles[math.random(1,#arrayOfVehicles)]
        RequestModel(vehicle)
        repeat Wait(0) until HasModelLoaded(vehicle)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local created = CreateVehicle(vehicle, playerCoords.x + 1, playerCoords.y + 1, playerCoords.z, heading, true, false)
        cb({})
        SetNuiFocus(false,false)
    end
end)

RegisterNUICallback('close', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)
