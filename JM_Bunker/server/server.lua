local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent('JM:Gambino:ErrorAlert')
AddEventHandler('JM:Gambino:ErrorAlert', function()
    local Allespillere = vRP.getUsers({})
    for k,v in pairs(Allespillere) do
        local JUSTME1108 = vRP.getUserId({v})
            if vRP.hasGroup({JUSTME1108, Bunker.Rank}) then
                TriggerClientEvent('ox_lib:notify', v, {title = 'Forkert Kodeord',description = 'ved Bunkeren',duration = 7000,position = 'center-right',type = 'success',style = {backgroundColor = '#E03131',color = '#ffffff',['.description'] = {color = '#E9ECEF'}},icon = 'fa-solid fa-triangle-exclamation',iconColor = '#ffffff',})		
            end
    end
end)