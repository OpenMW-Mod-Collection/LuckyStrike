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

local function modifyDamage(attack, stat, initMult, setting)
    if not attack.damage[stat] then return false end

    local damageMult = initMult + settingsDamage:get(setting)
    damageMult = math.max(damageMult, settingsDamage:get("minMult"))
    damageMult = math.min(damageMult, settingsDamage:get("maxMult"))
    attack.damage[stat] = attack.damage[stat] * damageMult

    return true
end

function ModifyAttack(attack)
    local initMult = getDamageMult(attack)
    local dmgModified = false
    dmgModified = modifyDamage(attack, "health", initMult, "baseHpCritDmg") or dmgModified
    dmgModified = modifyDamage(attack, "fatigue", initMult, "baseFatCritDmg") or dmgModified
    dmgModified = modifyDamage(attack, "magicka", initMult, "baseMagCritDmg") or dmgModified
    return dmgModified
end
