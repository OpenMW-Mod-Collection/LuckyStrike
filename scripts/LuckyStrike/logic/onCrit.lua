local storage = require('openmw.storage')
local types = require("openmw.types")
local core = require("openmw.core")

local settingsOnCrit = storage.globalSection('SettingsLuckyStrike_onCrit')

local function showMessage(victim, attack)
    local player
    local msg
    if victim.types == types.Player then
        player = victim
        msg = "You suffered a critical hit!"
    elseif attack.attacker.types == types.Player then
        player = attack.attacker
        msg = "You landed a critical hit!"
    end

    if player then
        player:sendEvent("ShowMessage", { message = msg })
    end
end

function OnCrit(victim, attack)
    if settingsOnCrit:get("playSound") then
        core.sound.playSound3d("critical damage", victim)
    end
    
    if settingsOnCrit:get("showMessage") then
        showMessage(victim, attack)
    end
end
