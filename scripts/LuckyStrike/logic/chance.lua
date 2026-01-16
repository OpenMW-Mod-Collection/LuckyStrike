local storage = require('core.storage')

local settingsChance = storage.globalSection('SettingsLuckyStrike_chance')

local chanceFormulas = {
    Linear = function(actor)
        local luck = actor.type.stats.attributes.luck(actor)
        local luckMult = settingsChance:get("luckMult")
        local fatigue = actor.type.stats.dynamic.fatigue(actor)
        local fatigueRatio = (fatigue.base + fatigue.modifier) / fatigue.current
        local fatigueMult = settingsChance:get("fatigueMult")
        local baseCoeff = settingsChance:get("baseCoeff")
        return luck.modified * luckMult + fatigueRatio * fatigueMult + baseCoeff
    end,
    Classic = function(actor)
        local luck = actor.type.stats.attributes.luck(actor)
        return (luck.modified / 100) ^ 3 / 2
    end,
    ["Pure Luck"] = function(actor)
        local luck = actor.type.stats.attributes.luck(actor)
        return 0.1 + (luck.modified - 50) / 1000
    end,
}

function GetCritChance(actor)
    local formula = chanceFormulas[settingsChance:get("formula")]
    local chance = formula(actor)
    chance = math.max(chance, settingsChance:get("minChance"))
    chance = math.min(chance, settingsChance:get("maxChance"))
    return chance
end
