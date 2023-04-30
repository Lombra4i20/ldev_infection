local VORPInv = {}

VORPInv = exports.vorp_inventory:vorp_inventoryApi()

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterNetEvent('usarbandagem:server')
AddEventHandler('usarbandagem:server', function()
    local source = source
    local player = VORPcore.getUser(source)
    local bandagem = VORPInv.getItem(source, 'bandage')

    if bandagem then   
        VORPInv.subItem(source, 'bandage', 1)
        TriggerClientEvent("vorp:TipRight", source, "Você usou uma bandagem")
		
		-- envia mensagem para atualizar a variável infected no cliente
        TriggerClientEvent("atualizarInfected", source, false)
    else
        TriggerClientEvent("vorp:TipRight", source, "Você não tem nenhuma bandagem")
    end
end)

