// Streets of Rage 2
// #ID = 3

// $EF4E: Player one, number KOs
function Player1KOs() => word(0x00EF4E)

// $EF82: Player one lives
function Player1Lives() => word(0x00EF82)

// $FC02: Screen Mode- 0=segalogo, 4=pressstart, 8=demo, c=mainmenu, 10=options, 14=ingame, 18=charselect, 1c=ending, 24=introcards, 28=credits
function ScreenMode() => byte(0x00FC02)

// Count how many enemies where knocked out in one life
// This variation is the current core achievement
achievement(
    title = "Untouchable",
    description = "Defeat 200 enemies without dying", 
    points = 25,
    trigger = repeated(200, Player1KOs() > prev(Player1KOs())) &&
        never(Player1Lives() < prev(Player1Lives()))
)

// Count how many enemies where knocked out in one life
// This variation counts instance of multiple enemies getting knocked out at once.
achievement(
    title = "Example 2B: Untouchable", 
    description = "Defeat 200 enemies without dying",
    points = 0,
    trigger = measured(
                  tally(200, 
                      prev(Player1KOs()) < Player1KOs(),
                      prev(Player1KOs()) + 1 < Player1KOs(),
                      prev(Player1KOs()) + 2 < Player1KOs(),
                      prev(Player1KOs()) + 3 < Player1KOs(),
                      prev(Player1KOs()) + 4 < Player1KOs()
                  )
              ) &&
              never(ScreenMode() != 20) &&
              never(Player1Lives() < prev(Player1Lives()))
)
