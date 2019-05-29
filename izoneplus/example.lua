local notifOut = false
local  notifIn = false
Citizen.CreateThread(function()
    while true do
    Wait(100)
        TriggerEvent("izone:isPlayerInZoneSegura", "plaza", function(isIn)
            if isIn and not notifIn then
                NetworkSetFriendlyFireOption(false)
                ClearPlayerWantedLevel(PlayerId())
                TriggerEvent("pNotify:SendNotification",{
                    text = "<b style='color:#1E90FF'>Zona segura</b>",
                    type = "success",
                    timeout = (3000),
                    layout = "bottomcenter",
                    queue = "global"
                })
                notifIn = true
                notifOut = false
            elseif not isIn and not notifOut then
                NetworkSetFriendlyFireOption(true)
                TriggerEvent("pNotify:SendNotification",{
                    text = "<b style='color:#1E90FF'>Zona no segura</b>",
                    type = "error",
                    timeout = (3000),
                    layout = "bottomcenter",
                    queue = "global"
                })
                notifOut = true
                notifIn = false
            end
                    
--            if isIn then
--                DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
--                DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
--                DisableControlAction(0, 106, true) -- Disable in-game mouse controls
                    
--                if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
--                    SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
--                end
                    
--                if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
--                    SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
--                end
--            end
        end)
    end
end)
