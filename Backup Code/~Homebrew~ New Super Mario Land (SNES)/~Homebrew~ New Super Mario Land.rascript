// ~Homebrew~ New Super Mario Land
// #ID = 1234

// $0230: Mario Head Shape (Only when you die)
//        f0 = Shape In
//        6f = Shape Out
// $039B: Result Screen Timer 1
// $039C: Result Screen Timer 2
// $05A2: 10 = Mario Head UI on screen
// $07FD: Powerup (Just level 1-1 because it seems based on current level)
// $0800: Star Timer (Just level 1-1 because it seems based on current level)
// $0D2C: Maybe 2-3 Boss Action ID? (Normal)
//        0B - Shooting
//        11 - Moving
//        12 - Dies
function BossAction() => byte(0x000D2C)
// $0D62: Boss 2-3 Health (Normal Mode)
//        13 = Full Health
function BossHealth() => byte(0x000D62)
// $0D64: Boss 2-3 Attacking = 01 (Normal Mode)
// $0DDF: Maybe 2-3 Boss Acion ID (Expert)
// $0E15: Boss 2-3 Health (Expert Mode)
//        13 = Full Health
// $1C1D: 33 = Submarine/Plane Level
//        37 = At Main Menu
//        f7 = Normal Level
// $1CC5: (16-bit)
//        Related to timer?
//        If you freeze this address you will slowdown the game a lot
// $1CD2: P1 Inputs
//        Bit0 = Right D-Pad
//        Bit1 = Left D-Pad
//        Bit2 = Down D-Pad
// $1CD4: P1 Inputs one frame
// $1CDA: P2 Inputs
//        Bit0 = Right D-Pad
// $1CDC: P2 Inputs one frame
// $1CE2: P3 Inputs
//        Bit0 = Right D-Pad
// $1CE4: P3 Inputs one frame
// $1CEA: P4 Inputs
//        Bit0 = Right D-Pad
// $1CEC: P4 Inputs one frame
// $1D3A: World ID (Someone was drunk here?!)
//        03=World 1
//        0f=World 2
//        0c=World 3/The End
//        0e=World 4
//        0b=Ending
//        06=Results
// $2006: Lives
function Lives() => byte(0x002006)
// $2008: Coins
// $200A: Expert Mode Flag
// $200C: Can be used as World?
// $200E: Level ID
//        1d = Bonus Minigame
//        1e = Results
function Level() => byte(0x00200E)
// $2018: 00 = Normal Mario
//        01 = Submarine
//        02 = Plane
function Vechical() => byte(0x002018)
// $201A: Pause Flag
// $201C: Disable Entries/Exits Flag
//        Used when finishing a level or entering a pipe
// $201E: Demo Mode Flag
function Demo() => byte(0x00201E)
// $FB6C: Amount of Players shooting a fire ball
//        01 = Cero players
// $FB8C: Amount of Players Breaking a Brick (Only Submarine/Plane stages)
//        01 = Cero Players
// $FCD0: Total Lifes P1
// $FCD2: Total Deaths P1
// $FCD4: Total Coins P1
// $FCD6: Total Hits P1
// $FCD8: Total Lifes P2
// $FCDA: Total Deaths P2
// $FCDC: Total Coins P2
// $FCDE: Total Hits P2
// $FCE0: Total Lifes P3
// $FCE2: Total Deaths P3
// $FCE4: Total Coins P3
// $FCE6: Total Hits P3
// $FCE8: Total Lifes P4
// $FCEA: Total Deaths P4
// $FCEC: Total Coins P4
// $FCEE: Total Hits P4
// $FD11: Current Screen Coordinates
// $FD12: Current Screen ID
function ScreenID() => byte(0x00FD12)
// $FD2E: Current Players Amount
//        00=Everyone has died
// $FD32: 02 = Jumping
// $FD3A: Maybe level status?
//        01 - In-Level?
//        02 - In-Level?
//        05 - Ending Level
//        06 - Bonus Level
//        07 - Finished Bonus Level
//        09 - Boss Battle
// $FD3E: Total Jumps?
// $FD55: 32-Bit changes to FFFFFFFF when 2-3 Boss Killed
// $FD58: 19 or 18 to 1b or 1e when boss defeated

playersLookup = {
    0x1: "",
    0x2: "2 Players |",
    0x3: "3 Players |",
    0x4: "4 Players |",
}

function fixed()
{
    achievement(
        title = "Friends", description = "Beat 2-3 without beating the boss", points = 5,
        id = 89441, badge = "97750", published = "11/29/2019 4:04:09 AM", modified = "12/19/2019 5:22:49 PM",
        trigger = once(
                      Demo() != 1 &&
                      Level() == 6 && 
                      prev(ScreenID()) == 16 &&
                      ScreenID() == 17 
                  ) && 
                  trigger_when(
                      prev(Vechical()) == 1 &&
                      Vechical() == 0
                  )&&
                  never(
                       BossHealth() == 0x0 &&
                       BossAction() == 0x12
                  ) &&
                  never(Level() != 6) && 
                  never(prev(Lives()) > Lives())
                  
    )
}
fixed()

function original()
{
    achievement(
        title = "1-1", description = "Beat 1-1", points = 5,
        id = 89433, badge = "97742", published = "11/29/2019 4:03:54 AM", modified = "11/29/2019 4:56:36 AM",
        trigger = Level() == 1 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 14 && byte(0x00FD11) == 72
    )

    achievement(
        title = "Super Mario Run", description = "Complete 1-1 while holding right all the time (even if you die)(Don't crouch)", points = 10,
        id = 89453, badge = "97762", published = "11/29/2019 4:04:37 AM", modified = "11/29/2019 4:05:24 AM",
        trigger = never(byte(0x001C1D) == 55) && never(Demo() == 1) && Level() == 1 && ScreenID() == 14 && 
                  byte(0x00FD11) == 72 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 &&
                  ((unless(byte(0x0005A2) == 16) && unless(ScreenID() == 0) && unless(byte(0x00201A) == 1) && 
                    unless(once(bit0(0x001CD2) != 1)) && unless(once(bit2(0x001CD2) == 1)) && always_true()) ||
                   (unless(byte(0x0005A2) == 16) && byte(0x00FD2E) >= 2 && unless(ScreenID() == 0) && 
                    unless(byte(0x00201A) == 1) && unless(once(bit0(0x001CDA) != 1)) && unless(once(bit2(0x001CDA) == 1)) && always_true()) ||
                   (unless(byte(0x0005A2) == 16) && byte(0x00FD2E) >= 3 && unless(ScreenID() == 0) && 
                    unless(byte(0x00201A) == 1) && unless(once(bit0(0x001CE2) != 1)) && unless(once(bit2(0x001CE2) == 1)) && always_true()) ||
                   (unless(byte(0x0005A2) == 16) && byte(0x00FD2E) == 4 && unless(ScreenID() == 0) && 
                    unless(byte(0x00201A) == 1) && unless(once(bit0(0x001CEA) != 1)) && unless(once(bit2(0x001CEA) == 1)) && always_true()))
    )

    achievement(
        title = "1-2", description = "Beat 1-2", points = 5,
        id = 89434, badge = "97743", published = "11/29/2019 4:03:56 AM", modified = "11/29/2019 4:57:06 AM",
        trigger = Level() == 2 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 13 && byte(0x00FD11) == 80
    )

    achievement(
        title = "1-3", description = "Beat 1-3", points = 5,
        id = 89435, badge = "97744", published = "11/29/2019 4:03:58 AM", modified = "11/29/2019 5:00:06 AM",
        trigger = Level() == 3 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 14
    )

    achievement(
        title = "2-1", description = "Beat 2-1", points = 5,
        id = 89436, badge = "97745", published = "11/29/2019 4:04:00 AM", modified = "11/29/2019 5:01:52 AM",
        trigger = Level() == 4 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 14 && byte(0x00FD11) == 240
    )

    achievement(
        title = "2-2", description = "Beat 2-2", points = 5,
        id = 89437, badge = "97746", published = "11/29/2019 4:04:02 AM", modified = "11/29/2019 5:03:30 AM",
        trigger = Level() == 5 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 13 && byte(0x00FD11) == 8
    )

    achievement(
        title = "Brickmania", description = "At 2-3 destroy 100 or more of bricks", points = 5,
        id = 89438, badge = "97748", published = "11/29/2019 4:04:03 AM", modified = "11/29/2019 4:04:59 AM",
        trigger = never(Level() != 6) && repeated(100, byte(0x00FB9C) > prev(byte(0x00FB9C))) && Demo() != 1
    )

    achievement(
        title = "Hitmania", description = "At 2-3 do a total of 80 hits to enemies before reaching the boss battle", points = 10,
        id = 89439, badge = "97749", published = "11/29/2019 4:04:05 AM", modified = "11/29/2019 4:05:01 AM",
        trigger = never(Level() != 6) && Demo() != 1 &&
                  (always_false() || (unless(ScreenID() == 17) && tally(80, byte(0x00FCD6) > prev(byte(0x00FCD6)), byte(0x00FCDE) >
                
                     prev(byte(0x00FCDE)), byte(0x00FCE6) > prev(byte(0x00FCE6)), byte(0x00FCEE) > prev(byte(0x00FCEE)), always_false())))
    )

    achievement(
        title = "3-1", description = "Beat 3-1", points = 5,
        id = 89442, badge = "97751", published = "11/29/2019 4:04:11 AM", modified = "11/29/2019 5:05:05 AM",
        trigger = Level() == 7 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 22 && byte(0x00FD11) == 64
    )

    achievement(
        title = "3-2", description = "Beat 3-2", points = 5,
        id = 89443, badge = "97752", published = "11/29/2019 4:04:13 AM", modified = "11/29/2019 5:05:43 AM",
        trigger = Level() == 8 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 15 && byte(0x00FD11) == 64
    )

    achievement(
        title = "3-3", description = "Beat 3-3", points = 5,
        id = 89444, badge = "97753", published = "11/29/2019 4:04:15 AM", modified = "11/29/2019 5:06:06 AM",
        trigger = Level() == 9 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 14 && byte(0x00FD11) == 48
    )

    achievement(
        title = "4-1", description = "Beat 4-1", points = 5,
        id = 89445, badge = "97754", published = "11/29/2019 4:04:18 AM", modified = "11/29/2019 5:06:27 AM",
        trigger = Level() == 10 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 22 && byte(0x00FD11) == 64
    )

    achievement(
        title = "4-2", description = "Beat 4-2", points = 5,
        id = 89446, badge = "97755", published = "11/29/2019 4:04:20 AM", modified = "11/29/2019 5:06:50 AM",
        trigger = Level() == 11 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1 && 
                  ScreenID() == 19 && byte(0x00FD11) == 64
    )

    achievement(
        title = "Sarasaland Saved", description = "Beat New Super Mario Land!", points = 10,
        id = 89447, badge = "97756", published = "11/29/2019 4:04:23 AM", modified = "11/29/2019 4:05:15 AM",
        trigger = Level() == 12 && prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1
    )

    achievement(
        title = "A lot of Coins", description = "Beat the game having grabbed a total of 400 coins or more", points = 10,
        id = 89448, badge = "97757", published = "11/29/2019 4:04:25 AM", modified = "2/29/2020 6:18:11 AM",
        trigger = (word(0x00FCD4) + word(0x00FCDC) + word(0x00FCE4) + word(0x00FCEC) + 0) >= 400 && Level() == 12 && 
                  prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1
    )

    achievement(
        title = "Die", description = "Beat the game making a total of 300 hits or more to enemies", points = 10,
        id = 89449, badge = "97758", published = "11/29/2019 4:04:27 AM", modified = "2/29/2020 6:18:15 AM",
        trigger = (word(0x00FCD6) + word(0x00FCDE) + word(0x00FCE6) + word(0x00FCEE) + 0) >= 300 && Level() == 12 && 
                  prev(byte(0x00201C)) == 0 && byte(0x00201C) == 1 && Demo() != 1
    )

    achievement(
        title = "Cool", description = "Win 3 Mushrooms in a bonus game", points = 5,
        id = 89450, badge = "97759", published = "11/29/2019 4:04:29 AM", modified = "11/29/2019 4:05:19 AM",
        trigger = never(Level() != 29) && repeated(3, byte(0x002006) > prev(byte(0x002006))) && Demo() != 1
    )

    achievement(
        title = "Moneey", description = "Collect 99 coins", points = 5,
        id = 89451, badge = "97760", published = "11/29/2019 4:04:32 AM", modified = "11/29/2019 4:05:21 AM",
        trigger = Demo() != 1 &&
                  ((prev(byte(0x002008)) == 98 && byte(0x002008) == 99) ||
                   (prev(byte(0x002008)) == 98 && byte(0x002008) == 0))
    )

    achievement(
        title = "Jackpot", description = "Get 10 Extra Lives", points = 5,
        id = 89452, badge = "97761", published = "11/29/2019 4:04:34 AM", modified = "11/29/2019 4:05:22 AM",
        trigger = Demo() != 1 &&
                  ((prev(byte(0x002006)) == 9 && byte(0x002006) >= 10) ||
                   (prev(byte(0x002006)) == 8 && byte(0x002006) == 10))
    )

    achievement(
        title = "Boss beated", description = "At 2-3 beat the boss", points = 5,
        id = 89440, badge = "97747", published = "11/29/2019 4:04:07 AM", modified = "4/8/2020 1:42:39 AM",
        trigger = prev(byte(0x00FD58)) <= 25 && byte(0x00FD58) >= 27 && byte(0x00FD58) != 255 && Vechical() == 1 && 
                  Demo() != 1 && never(Level() != 6) && unless(ScreenID() != 17) && unless(byte(0x00FD2E) == 0)
    )
}

rich_presence_conditional_display(Demo() == 1, " Demo Mode")

rich_presence_conditional_display(Level() == 29, " Bonus Minigame")

rich_presence_display("{0} 🚶‍x{1} Lifes | 💰x{2} Coins | 👊x{3} Hits | ☠️‍x{4} Deaths",
    rich_presence_lookup("players", byte(0x00FD2E), playersLookup),
    rich_presence_value("lifes", word(0x00FCD0) + word(0x00FCD8) + word(0x00FCE0) + word(0x00FCE8)),
    rich_presence_value("coins", word(0x00FCD4) + word(0x00FCDC) + word(0x00FCE4) + word(0x00FCEC)),
    rich_presence_value("hits", word(0x00FCD6) + word(0x00FCDE) + word(0x00FCE6) + word(0x00FCEE)),
    rich_presence_value("deaths", word(0x00FCD2) + word(0x00FCDA) + word(0x00FCE2) + word(0x00FCEA))
)
