local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-smallresources:client:Namaste', function(src)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    QBCore.Functions.Progressbar('doing_yoga', 'Doing Yoga', 15000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "missfam5_yoga",
        anim = "i_yogapose_a",
        flag = 8,
    }, {}, {}, function()  -- Done
        exports['ps-ui']:Circle(function(success)
            if success then
                --print("success")
		--TriggerServerEvent('hud:server:RelieveStress', 25)
                QBCore.Functions.Notify("You have a bit less stress", "success") 
                exports['ps-buffs']:AddStressBuff(40000, 5)				
                ClearPedTasks(PlayerPedId())
            else
                --print("fail")
		ClearPedTasks(PlayerPedId())
                QBCore.Functions.Notify("Just Breathe.....", "error") 
		SetPedToRagdollWithFall(ped, 1000, 2000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end
        end, 2, 10)
    end)
end)

exports['qb-target']:AddTargetModel({-1978741854, 2057317573, -232023078}, {
    options = {
        {
            type = "client",
            event = "qb-smallresources:client:Namaste",
            targeticon = "fas fa-yin-yang",
            label = "Namaste",
        },
    },
    distance = 2.5
})

CreateThread(function()
    Yoga = AddBlipForCoord(-1493.59, 829.14, 181.6)
    SetBlipSprite (Yoga, 197)
    SetBlipDisplay(Yoga, 4)
    SetBlipScale  (Yoga, 0.6)
    SetBlipAsShortRange(Yoga, true)
    SetBlipColour(Yoga, 24)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Yoga")
    EndTextCommandSetBlipName(Yoga)
end)
