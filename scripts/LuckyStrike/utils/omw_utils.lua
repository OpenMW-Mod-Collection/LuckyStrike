local types = require("openmw.types")

function GetWeaponType(attack)
    if not attack.weapon then return "unarmed" end

    -- for throwables
    if attack.weapon.id == "@0x0" then
        return types.Weapon.records[attack.ammo].type
    end

    return types.Weapon.records[attack.weapon.recordId].type
end

function GetWeaponSkill(attack)
    if attack.attacker.type == types.Creature then
        return attack.attacker.type.records[attack.attacker.recordId].combatSkill
    end

    local weaponType = GetWeaponType(attack)
    local weaponSkill = WeaponTypes[weaponType](attack.attacker)
    return weaponSkill.modified
end