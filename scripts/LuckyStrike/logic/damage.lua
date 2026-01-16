local storage = require('openmw.storage')
local types = require("openmw.types")

local settingsDamage = storage.globalSection('SettingsLuckyStrike_damage')

local function getWeaponSkill(attack)
    if attack.attacker.type == types.Creature then
        return attack.attacker.type.records[attack.attacker.recordId].combatSkill
    end

    local skills = attack.attacker.type.stats.skills
    local weapon = attack.weapon and attack.weapon.TYPE
    local weaponSkill = WeaponTypes[weapon](skills)(attack.attacker)
    return weaponSkill.modified
end

local function getDamageMult(attack)
    local weaponSkill = getWeaponSkill(attack)
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

    local damageMult = initMult * settingsDamage:get(setting)
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
