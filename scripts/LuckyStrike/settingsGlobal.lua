local I = require("openmw.interfaces")

I.Settings.registerGroup {
    key = 'SettingsLuckyStrike_chance',
    page = 'LuckyStrike',
    l10n = 'LuckyStrike',
    name = 'chance_groupName',
    permanentStorage = true,
    order = 1,
    settings = {
        {
            key = 'preset',
            name = 'preset_name',
            description = 'preset_description',
            renderer = 'select',
            argument = {
                l10n = "LuckyStrike",
                items = {
                    "Modern",
                    "Classic",
                    "Simple",
                },
            },
            default = "Modern",
        },
        {
            key = 'formula',
            name = 'formula_name',
            description = 'formula_description',
            renderer = 'select',
            argument = {
                l10n = "LuckyStrike",
                items = {
                    "Linear",  -- just trow everything in there
                    "Classic", -- (Luck / 100) ^ 3 / 2
                    "Pure Luck", -- (0.1 + (luck.modified - 50) / 1000
                },
            },
            default = "Linear",
        },
        {
            key = 'luckMult',
            name = 'luckMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'fatigueMult',
            name = 'fatigueMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'baseCoeff',
            name = 'baseCoeff_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'minChance',
            name = 'minChance_name',
            renderer = 'number',
            integer = false,
            default = .05,
            min = 0,
            max = 1,
        },
        {
            key = 'maxChance',
            name = 'maxChance_name',
            renderer = 'number',
            integer = false,
            default = .10,
            min = 0,
            max = 1,
        },
    }
}

I.Settings.registerGroup {
    key = 'SettingsLuckyStrike_damage',
    page = 'LuckyStrike',
    l10n = 'LuckyStrike',
    name = 'damage_groupName',
    permanentStorage = true,
    order = 2,
    settings = {
        {
            key = 'preset',
            name = 'preset_name',
            description = 'preset_description',
            renderer = 'select',
            argument = {
                l10n = "LuckyStrike",
                items = {
                    "Modern",
                    "Classic",
                    "Simple",
                },
            },
            default = "Modern"
        },
        {
            key = 'weaponSkillMult',
            name = 'weaponSkillMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'weaponSpeedMult',
            name = 'weaponSpeedMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'baseHpCritMult',
            name = 'baseHpCritMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'baseFatCritMult',
            name = 'baseFatCritMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'baseMagCritMult',
            name = 'baseMagCritMult_name',
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
        {
            key = 'minMult',
            name = 'minMult_name',
            renderer = 'number',
            integer = false,
            default = 2,
            min = 0,
        },
        {
            key = 'maxMult',
            name = 'maxMult_name',
            renderer = 'number',
            integer = false,
            default = 8,
            min = 0,
        },
    }
}