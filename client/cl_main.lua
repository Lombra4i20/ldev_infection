TriggerEvent("getCore", function(core)
    VORPcore = core
end)

local sick = 0
local isArmadillo = false
local wasDead = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local isNearLocation = false
        for i, location in ipairs(Config.Locations) do
            if GetDistanceBetweenCoords(coords, location.x, location.y, location.z, true) < Config.PlagueDistance then
                isNearLocation = true
                break -- sai do loop assim que encontrar uma localização próxima
            end
        end
        isArmadillo = isNearLocation
        if not isNearLocation then
            sick = 0
        end
    end	
	end)

local infected = false
local lastInfectedTime = 0
local isLoopRunning = false
local lastDamageTime = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()
        local currentTime = GetGameTimer()

        -- Verifica se o jogador já está infectado
        if not infected then
            -- Verifica se o jogador foi atacado por um NPC
            if IsPedInMeleeCombat(playerPed) or IsPedBeingStunned(playerPed, 0) or IsPedBeingStealthKilled(playerPed) then
                infected = true
                lastInfectedTime = currentTime

                print("Player infected!")
            end
        else
            -- Verifica se a infecção durou por 2 minutos
            if (currentTime - lastInfectedTime) > 12000 then -- 2 minutos
                ClearPlayerHasDamagedAtLeastOneNonAnimalPed(playerPed)
                ClearPlayerHasDamagedAtLeastOnePed(playerPed)
                isLoopRunning = true

                infected = false
                print("Player cured!")
            elseif (currentTime - lastDamageTime) > 1500 and GetEntityHealth(playerPed) > 0 then -- Verifica se já passaram 3 segundos desde o último dano e o jogador está vivo
                SetEntityHealth(playerPed, GetEntityHealth(playerPed) - 3)
                lastDamageTime = currentTime
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        while infected do
            Wait(0)
            DrawTxt(Config.msg2, 0.50, 0.95, 0.5, 0.5, true, 255, 255, 255, 255, true)
            sick = sick + 1
        end
    end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			while isArmadillo do
			Wait(0)
			DrawTxt(Config.msg, 0.50, 0.95, 0.5, 0.5, true, 255, 255, 255, 255, true)
			sick = sick + 1
			--print(sick)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.HurtRefresh)
			local playerPed = PlayerPedId()
				if wasDead == false then
					Wait(0)
						if sick > Config.TimeMax then
						ApplyDamageToPed(playerPed, Config.HurtAmount, true, true, true, true)
						applyDmg()
						--print("APPLYING DAMAGE")
						else end
				end
	end
end)

function applyDmg()
	Citizen.CreateThread(function()
	while true do
	Wait(0)
		local pl = Citizen.InvokeNative(0x217E9DC48139933D)
		while Citizen.InvokeNative(0x2E9C3FCB6798F397, pl) do
			Wait(0)
			wasDead = true
			--print("DEAD")
			Wait(Config.SafeTime)
			--print("TIME RESETED")
			wasDead = false
		end
	end
	end)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end