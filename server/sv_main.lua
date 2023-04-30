local VORPInv = {}

VORPInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('usarBandagem')
AddEventHandler('usarBandagem', function()
    local _source = source
    local player = VorpCore.getUser(_source)
    local bandagem = VORPInv.getItem(_source, 'bandage')
    
    if bandagem then   
        infected = false -- Mudando a variável infected para false
        VORPInv.subItem(_source, 'bandage', 1)
        VORPcore.NotifyRightTip(_source,"Você usou uma bandagem",4000)
    else
        VORPcore.NotifyRightTip(_source,"Você não tem nenhuma bandagem",4000)
    end
end)