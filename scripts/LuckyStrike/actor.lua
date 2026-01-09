local storage = require('openmw.storage')
local core = require("openmw.core")
local self = require("openmw.self")
local I = require("openmw.interfaces")

local settings = storage.globalSection('SettingsLuckyStrike_settings')

local function tryCrit(attack)
    local luck = attack.attacker.type.stats.attributes.luck(attack.attacker)
    if not (math.random() < (luck / 100) ^ 3 / 2) then return end

    local baseMult = settings:get("baseCritMult")
    local weaponSpeed = 1
    if attack.weapon then
        -- TODO: test it on ranged weapons
        weaponSpeed = attack.weapon.records[attack.weapon].speed
    end

    attack.damage.health = attack.damage.health * baseMult * weaponSpeed
    core.sound.playSound3d("critical damage", self)
end

I.Combat.addOnHitHandler(tryCrit)
