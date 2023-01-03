local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-smallresources:client:Namaste', function(src)
    QBCore.Functions.Progressbar('doing_yoga', 'Doing Yoga', 15000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        TriggerEvent('animations:client:EmoteCommandStart', {"yoga"})
    }, {}, {}, function()  -- Done
        exports['ps-ui']:Circle(function(success)
            if success then
	        ClearPedTasks(PlayerPedId())
	        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 10))
                exports['ps-buffs']:AddHealthBuff(10000, 5)
		QBCore.Functions.Notify("You have a bit less stress", "success")					
            else
		ClearPedTasks(PlayerPedId())
                ApplyDamageToPed(PlayerPedId(), 5, false)
		SetPedToRagdollWithFall(PlayerPedId(), 1000, 2000, 1, GetEntityForwardVector(PlayerPedId()), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                QBCore.Functions.Notify("Just Breathe.....", "error") 
            end
        end, 2, 10)
    end)
end)

exports['qb-target']:AddTargetModel({876225403, -1978741854, 900603612, 2057317573, -232023078, -2137918589}, {
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
