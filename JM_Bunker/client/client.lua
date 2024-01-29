local point = lib.points.new({
  coords = Bunker.Ingang,
  distance = 5,
})

function point:onExit()
  lib.hideTextUI()
end

function point:nearby()
  lib.showTextUI('[E] - Bunken')

  if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
      TriggerEvent('JM:Gambino:Passcode')
  end
end

local point2 = lib.points.new({
  coords = Bunker.Udgang,
  distance = 5,
})

function point2:onExit()
  lib.hideTextUI()
end

function point2:nearby()
  lib.showTextUI('[E] - Gå ud af Bunken')

  if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
      TriggerEvent('JM:Gambino:TP:ud')
  end
end


local point3 = lib.points.new({
  coords = Bunker.Sletvehicle,
  distance = 3,
})

function point3:onExit()
  lib.hideTextUI()
end

function point3:nearby()
  lib.showTextUI('[E] - til at slette køretøjet')

  if self.currentDistance < 5 and IsControlJustReleased(0, 38) then
      TriggerEvent('JM:Gambino:sletvehicle')
  end
end


RegisterNetEvent('JM:Gambino:Passcode', function()
    local Passcode = lib.inputDialog('Bunkeren', {
        {type = 'input', label = 'Kodeord', password = true, required = true },
      })

      if not Passcode then return end

      if Passcode[1] == Bunker.Kodeord then 
      DoScreenFadeOut(2000)
      Citizen.Wait(2000)
      SetPedCoordsKeepVehicle(GetPlayerPed(-1), Bunker.Udgang - 1)
      DoScreenFadeIn(2000)
      else
        TriggerServerEvent('JM:Gambino:ErrorAlert')
        local ErrorAlert2 = lib.alertDialog({
          header = 'Bunken',
          content = 'Folk med Ranket: '..Bunker.Rank..' Har fået en notification om du har skrivet den forkerte kode!',
          centered = true,
          cancel = false,
          labels = {
            confirm = 'luk menuen'
          }
        })
      end 
      
    if not Passcode then return end
end)

RegisterNetEvent('JM:Gambino:TP:ud', function()
  DoScreenFadeOut(2000)
  Citizen.Wait(2000)
  SetPedCoordsKeepVehicle(GetPlayerPed(-1), Bunker.Ingang - 1)

  DoScreenFadeIn(2000)
end)

RegisterNetEvent('JM:Gambino:sletvehicle', function()
  local Player = GetPlayerPed(-1)
  local Car = GetVehiclePedIsIn(Player, false)
  SetEntityAsMissionEntity(Car, true, true)

  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(Car))
  else
    lib.notify({
      title = 'Bunken',
      description = 'du er ikke i et køretøj',
      type = 'error',
      icon = 'car'
  })
  end 
end)