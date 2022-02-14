// Streets of Rage 2
// #ID = 3

// $EF33: 8-bit - Holding Weapon
function HoldingWeapon() => byte(0x00EF33)

// $EF37: 8-bit - Weapon Type
function WeaponType() => byte(0x00EF37)

// $EF4E: Player one, number KOs
function Player1KO() => word(0x00EF4E)

// $FC02: Screen Mode- 0=segalogo, 4=pressstart, 8=demo, c=mainmenu, 10=options, 14=ingame, 18=charselect, 1c=ending, 24=introcards, 28=credits
function ScreenMode() => byte(0x00FC02)

// Count how many enemies where knocked out while holding a weapon
// This variation is the current core achievement
achievement(
    title = "Steel Grip", 
    description = "Defeat 10 enemies without dropping your weapon", 
    points = 10,
    trigger = once(HoldingWeapon() == 1) &&
              repeated(10, Player1KO() > prev(Player1KO())) && 
              never(WeaponType() != prev(WeaponType())) &&
              never(HoldingWeapon() != 1)
)

// Count how many enemies where knocked out while holding a weapon
// This variation counts instance of multiple enemies getting knocked out at once.
achievement(
    title = "Example 2C: Steel Grip",
    description = "Defeat 10 enemies without dropping your weapon",
    points = 0,
    id = 111000004,
    trigger = measured(
                  tally(10, 
                      prev(Player1KO()) < Player1KO(),
                      prev(Player1KO()) + 1 < Player1KO(),
                      prev(Player1KO()) + 2 < Player1KO(),
                      prev(Player1KO()) + 3 < Player1KO(),
                      prev(Player1KO()) + 4 < Player1KO()
                  )
              ) &&
              never(ScreenMode() != 20) &&
              never(WeaponType() != prev(WeaponType())) &&
              never(HoldingWeapon() != 1)
)

