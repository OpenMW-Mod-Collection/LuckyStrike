local storage = require('openmw.storage')

require("scripts.LuckyStrike.utils.omw_utils")

local settingsDamage = storage.globalSection('SettingsLuckyStrike_damage')

local function getDamageMult(attack)
    local weaponSkill = GetWeaponSkill(attack)
    local skillMult = settingsDamage:get("weaponSkillMult")

    local weaponSpeed = 1
    local weapon = attack.weapon
    if weapon and not attack.ammo then
        weaponSpeed = weapon.type.records[weapon.recordId].speed
    end
    local speedMult = settingsDamage:get("weaponSpeedMult")

    return skillMult * weaponSkill + speedMult * weaponSpeed
end

local function modifyDamage(statDamage, initMult, setting)
    if not statDamage then return false end

    local damageMult = initMult * settingsDamage:get(setting) / 100
    damageMult = math.max(damageMult, settingsDamage:get("minMult"))
    damageMult = math.min(damageMult, settingsDamage:get("maxMult"))
    statDamage = statDamage * damageMult

    return true
end

function ModifyAttack(attack)
    local initMult = getDamageMult(attack)
    local dmg = attack.damage
    local dmgModified = false
    dmgModified = dmgModified or modifyDamage(dmg.health, initMult, "baseHpCritMult")
    dmgModified = dmgModified or modifyDamage(dmg.fatigue, initMult, "baseFatCritMult")
    dmgModified = dmgModified or modifyDamage(dmg.magicka, initMult, "baseMagCritMult")
    return dmgModified
end
