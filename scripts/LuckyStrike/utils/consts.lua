local types = require("openmw.types")

WeaponTypes = {
    [types.Weapon.TYPE.Arrow] =                 function(skills) return skills.marksman end,
    [types.Weapon.TYPE.AxeOneHand] =            function(skills) return skills.axe end,
    [types.Weapon.TYPE.AxeTwoHand] =            function(skills) return skills.axe end,
    [types.Weapon.TYPE.BluntOneHand] =          function(skills) return skills.blunt end,
    [types.Weapon.TYPE.BluntTwoClose] =         function(skills) return skills.blunt end,
    [types.Weapon.TYPE.BluntTwoWide] =          function(skills) return skills.blunt end,
    [types.Weapon.TYPE.Bolt] =                  function(skills) return skills.marksman end,
    [types.Weapon.TYPE.LongBladeOneHand] =      function(skills) return skills.longBlade end,
    [types.Weapon.TYPE.LongBladeTwoHand] =      function(skills) return skills.longBlade end,
    [types.Weapon.TYPE.MarksmanBow] =           function(skills) return skills.marksman end,
    [types.Weapon.TYPE.MarksmanCrossbow] =      function(skills) return skills.marksman end,
    [types.Weapon.TYPE.MarksmanThrown] =        function(skills) return skills.marksman end,
    [types.Weapon.TYPE.ShortBladeOneHand] =     function(skills) return skills.shortBlade end,
    [types.Weapon.TYPE.SpearTwoWide] =          function(skills) return skills.spear end,
}