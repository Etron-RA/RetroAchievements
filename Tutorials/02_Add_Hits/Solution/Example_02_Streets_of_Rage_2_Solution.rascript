// Streets of Rage 2
// #ID = 3

// $EF33: 8-bit - Holding Weapon
function HoldingWeapon() => byte(0x00EF33)

// $EF37: 8-bit - Weapon Type
function WeaponType() => byte(0x00EF37)

// $EF4E: Player one, number KOs
function Player1KO() => word(0x00EF4E)

// $EF82: Player one lives
function Player1Lives() => word(0x00EF82)

// $FC02: Screen Mode- 0=segalogo, 4=pressstart, 8=demo, c=mainmenu, 10=options, 14=ingame, 18=charselect, 1c=ending, 24=introcards, 28=credits
function ScreenMode() => byte(0x00FC02)

// $FC50: Axel selected = 0xff
function AxelSelected() => word(0x00FC50)

// $FC51: Max selected = 0xff
function MaxSelected() => word(0x00FC51)

// $FC52: Skate selected = 0xff
function SkateSelected() => word(0x00FC52)

// $FC53: Blaze selected = 0xff
function BlazeSelected() => word(0x00FC53)

// Record a hit for each character active during gameplay
// This variation is the current core achievement
achievement(
    title = "Team Game", 
    description = "Play once as every character",
    points = 4,
    trigger = unless(ScreenMode() != 20) &&
        once(AxelSelected() == 255) && 
        once(BlazeSelected() == 255) &&
        once(MaxSelected() == 255) && 
        once(SkateSelected() == 255)
)

// Record a hit for each character active during gameplay
// This variation of the using add hits to support using measure
achievement(
    title = "Example 2A: Team Game", 
    description = "Play once as every character", 
    points = 0,
    id = 111000002,
    trigger = measured(
                  tally(4,
                      once(ScreenMode() == 20 && AxelSelected() == 255),
                      once(ScreenMode() == 20 && MaxSelected() == 255),
                      once(ScreenMode() == 20 && SkateSelected() == 255),
                      once(ScreenMode() == 20 && BlazeSelected() == 255)
                  )
              )
)

// Count how many enemies where knocked out in one life
// This variation is the current core achievement
achievement(
    title = "Untouchable",
    description = "Defeat 200 enemies without dying", 
    points = 25,
    trigger = repeated(200, Player1KO() > prev(Player1KO())) &&
        never(Player1Lives() < prev(Player1Lives()))
)


// Count how many enemies where knocked out in one life
// This variation counts instance of multiple enemies getting knocked out at once.
achievement(
    title = "Example 2B: Untouchable", description = "Defeat 200 enemies without dying", points = 0,
    id = 111000006,
    trigger = measured(
                  tally(200, 
                      prev(Player1KO()) < Player1KO(),
                      prev(Player1KO()) + 1 < Player1KO(),
                      prev(Player1KO()) + 2 < Player1KO(),
                      prev(Player1KO()) + 3 < Player1KO(),
                      prev(Player1KO()) + 4 < Player1KO()
                  )
              ) &&
              never(ScreenMode() != 20) &&
              never(Player1Lives() < prev(Player1Lives()))
)

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

