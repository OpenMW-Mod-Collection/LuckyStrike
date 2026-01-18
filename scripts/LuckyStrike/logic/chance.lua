local storage = require('openmw.storage')
local self = require('openmw.self')

require("scripts.LuckyStrike.utils.omw_utils")

local settingsChance = storage.globalSection('SettingsLuckyStrike_chance')

local chanceFormulas = {
    Linear = function(actor)
        local luck = actor.type.stats.attributes.luck(actor)
        local luckMult = settingsChance:get("luckMult")
        local baseChance = settingsChance:get("baseChance")
        local backstabBonus = IsBackHit(self, actor, settingsChance:get("actorFov"))
            and settingsChance:get("backstabBonus") or 0
        return (luck.modified * luckMult + backstabBonus + baseChance) / 100
    end,
    Classic = function(actor)
        local luck = actor.type.stats.attributes.luck(actor)
        return (luck.modified / 100) ^ 3 / 2
    end,
}

function GetCritChance(actor)
    local formula = chanceFormulas[settingsChance:get("formula")]
    local chance = formula(actor)
    chance = math.max(chance, settingsChance:get("minChance"))
    chance = math.min(chance, settingsChance:get("maxChance"))
    return chance
end
