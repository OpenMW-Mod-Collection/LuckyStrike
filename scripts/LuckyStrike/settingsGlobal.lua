local I = require("openmw.interfaces")

I.Settings.registerGroup {
    key = 'SettingsLuckyStrike_settings',
    page = 'LuckyStrike',
    l10n = 'LuckyStrike',
    name = 'settings_groupName',
    permanentStorage = true,
    order = 1,
    settings = {
        {
            key = 'baseCritMult',
            name = 'baseCritMult_name',
            description = "baseCritMult_desc",
            renderer = 'number',
            integer = false,
            default = 3,
            min = 0,
        },
    }
}