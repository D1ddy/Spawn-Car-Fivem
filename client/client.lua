local vehicles = GetAllVehicleModels()
local arrayOfVehicles = {}
RegisterCommand('car', function()
    for i = 1, 6, 1 do
        arrayOfVehicles[i] = vehicles[math.random(1,#vehicles)]
    end
    SendNUI('getCars',arrayOfVehicles)
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

RegisterNUICallback('getSelectedCar',function(data,cb)
    local vehicle = data
    RequestModel(vehicle)
    repeat Wait(0) until HasModelLoaded(vehicle)    
    local playerCoords = GetEntityCoords(PlayerPedId())
    local created = CreateVehicle(vehicle, playerCoords.x + 1, playerCoords.y + 1, playerCoords.z, heading, true, false)
    cb({})
    SetNuiFocus(false,false)
end)
RegisterNUICallback('getRandomCar',function(data,cb)
    local vehicle = vehicles[math.random(1,#arrayOfVehicles)]
    RequestModel(vehicle)
    repeat Wait(0) until HasModelLoaded(vehicle)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local created = CreateVehicle(vehicle, playerCoords.x + 1, playerCoords.y + 1, playerCoords.z, heading, true, false)
    cb({})
    SetNuiFocus(false,false)
end)

RegisterNUICallback('close', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)
