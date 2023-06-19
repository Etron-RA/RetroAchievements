// ~Hack~ Present Panic - A Princess Adventure
// #ID = 20504

// $0061: [8-bit] Current Level
//        0x00 = Overworld
//        0x46 = Peach's Castle
//        0xb4 = Level 1-A
//        0x76 = Level 1-B
//        0x32 = Level 2-A
//        0x6c = Level 3-A
//        0x87 = Level 3-B
//        0xca = Level 4-A
//        0x6e = Level 4-B
//        0x4b = Level 5-A
//        0xc1 = Level 5-B
//        0x61 = Level 6-A
//        0x46 = Level 6-B
//        0x00 = Level 6-C
function Level() => byte(0x000061)

LevelNames = {
    0: "on the Overworld",
    0x46: "in the Castle",
    0xb4: "in Winter Wonderland",
    0x76: "in Winter Wonderland",
    0x32: "in the Hilltops",
    0x6c: "in Blooper's Garden",
    0x87: "in Blooper's Garden",
    0xca: "in Frozen Outpost",
    0x6e: "in Frozen Outpost",
    0x4b: "in Frozen Entrée",
    0xc1: "in Frozen Entrée",
    0x61: "in the Castle"
}

// $0075: [8-bit] Peach's Location on Overworld Map - Y Coordinate
function PeachOverworldY() => byte(0x000075)

// $0079: [8-bit] Peach's Location on Overworld Map - X Coordinate
function PeachOverworldX() => byte(0x000079)

// $007f: [bit 5] On overworld (1 = overworld, 0 = in level)
function OnOverwold() => bit5(0x00007f)

// $0083: [8-bit] Koopalings Bosses Health (3=Dead, 0=FullHealth)
function KoopaHP() => byte(0x000083)

// $00C4: [8-bit] End of Level (Switches to 0xff when level is beat)
function EndFlag() => byte(0x0000C4)

// $00ED: [8-bit] Power Ups
//        0 = Small Peach
//        1 = Big Peach
//        2 = Fire
//        3 = Raccoon
//        4 = Blooper
//        5 = Tanooki (N/A)
//        6 = Candy Cane
//        7 = Glitched Sky Swim (N/A)
function PowerUps() => byte(0x0000ED)

PowerNames = {
   0: "Small",
   1: "Big",
   2: "Fire",
   3: "Raccoon",
   4: "Blooper",
   6: "Candy Cane",
}

// $00f1: [bit 0] Dead bit (0 = alive, 1 = dead)
function DeathStatus() => bit0(0x00f1)
function Alive() => DeathStatus() == 0
function Dead() => DeathStatus() == 1

// $04E2: [8-bit] Currently playing Sound, reads from directly below
function SFX() => byte(0x0004E2)

// $04E5: [8-bit] Currently playing Music, reads from directly below
//        F=FindPeachANDcredits B=WarpWhistleAndZone
function Music() => byte(0x0004E5)

// $0503: [8-bit] Game Over Screen (0xf8 when game over)
function GameOverScreen() => byte(0x000503)
function GameOver() => prev(GameOverScreen()) == 0 && GameOverScreen() == 0xf8


// $05ee: [BCD] Time hundreds column
// $05ef: [BCD] Time tens column
// $05f0: [BCD] Time ones column
function TimeX00() => low4(0x05ee)
function Time0X0() => low4(0x05ef)
function Time00X() => low4(0x05f0)
function Time() {
    return TimeX00() * 100 +
        Time0X0() * 10 +
        Time00X()
}

// $05f1: [8-bit] Time milliseconds (0x28 to 0x0)
function Milliseconds() => byte(0x05f1)

// $0711: [8-bit] Timer: Countdown to Spawning on Overworld Map
//        When this hits zero, the stars effect takes place.
function StartCountdown() => byte(0x000711)

// $0715: [24-bit] Current player score divided by dec10.
//        (max F423F[dec999,999])
//        (There's a hard coded 0 in the score display)
function Score() => tbyte(0x715)

// $0726: [8-bit] Whose Turn?
//        0x00: Peach
//        0x01: Daisy
function ActivePlayer() => byte(0x000726)

// $0736: [8-bit] Lives remaining - Peach
function Lives() => byte(0x000736)

// $0737: [8-bit] Lives remaining - Daisy
function DaisyLives() => byte(0x000737)

// $7DA2: [8-bit] Coin count - Peach
function Coins() => byte(0x0007DA2)

// $7DC5 [8-bit] Coin count - Daisy
function DaisyCoins() => byte(0x0007DC5)

// $7D80: [28 bytes] Peach - 00-No Item, 01-Mushroom, 02-Flower, 03-Leaf, 04-Frog, 05-Bear
//        06-Hammer Bro Suit, 07-Cloud, 08-P-Wing, 09-Star, 0A-Anchor, 0B-Hammer, 0C-Whistle, 0D-Music Box
function ItemSlot(slot) => byte(0x7D80 + slot)

// $7DA2: [8-bit] Coin count - Peach
function Coins() => byte(0x0007DA2)

// $7F15: [8 bytes] Map Events
//        01 = HelpBubbleOnCastle
//        02 = FlyingShip
//        03 = HammerBro
//        07 = Plant
//        08 = CardMatchGame
//        0A = BlackNwhiteShroom
//        0B = CoinShip
//        0E = Tank
//        0C = WhiteFlyingShip
//        0D = ShipCannon
function MapEvents() => byte(0x007F15)
function TitleScreen() => MapEvents() == 0

// Starting Level Tansisiton Screens (values found at beginning of levels)
StartingScreen = {
    1: 0xb4,    
    2: 0x32,
    3: 0x6c,
    4: 0xca,
    5: 0x4b,
    6: 0x5a
}

// Ending Levels Screens
EndingScreen = {
    1: 0xb4,    
    2: 0x32,
    3: 0x87,
    4: 0xca,
    5: 0xc1,
    6: 0x46
}

// Locations of the hidden 1ups (screen, cell)
Hidden1Ups = [
    [0xb4, 0x6549],
    [0x32, 0x60c3],
    [0x32, 0x6531],
    [0xca, 0x6122],
    [0xca, 0x6540],
    [0x4b, 0x623d],
    [0x5a, 0x7220]
]

// Functions  ///////////////////////////////////////////////////////////////////////////

// Converts the time minutes:seconds:frames to frames (1/60s each)
function TimeSpan(minutes, seconds, frames) => minutes * 3600 + seconds * 60 + frames

// Checks if the player is in game
function InGame()
{
    return MapEvents() == 1 && 
        ActivePlayer() == 0
}

// Checks if the game has been reset
function ResetGame()
{
    return InGame() && 
        Lives() == 4 &&
        Score() == 0 &&
        prev(StartCountdown()) == 2 &&
        StartCountdown() == 1
}

// Checks if a new game has been started
function StartGame()
{
    return InGame() && 
        Lives() == 4 &&
        Score() == 0 &&
        prev(StartCountdown()) == 1 &&
        StartCountdown() == 0
}

// Checks if the player has obtained a power up
function ObtainPowerUp(powerup)
{
    return InGame() && 
        PowerUps() == powerup
}

// Transistioning from the overworld to a level
function StartLevel(level)
{
    return InGame() && 
        Level() == StartingScreen[level] && 
        Time() == 300 && 
        prev(Milliseconds()) == 0x28 &&
        Milliseconds() == 0x27
}

// Beating the game when bowser hits the floor
function BeatGame()
{
    return InGame() &&
        Alive() &&
        Level() == 0x46 &&
        Music() == 0 &&
        prev(SFX()) != 8 &&
        SFX() == 8
}

// Checks for the end level flag (or beat condtions if last level)
function BeatLevel(level)
{
    if (level == 6)
        return BeatGame()
    
    return InGame() &&
        Level() == EndingScreen[level] &&
        prev(EndFlag()) == 0 && 
        EndFlag() == 255
}

// Checks if the player dies
function Death() {
    return InGame() &&
        prev(Lives()) > Lives()
}

// Checks that the play completes a level without powering up
function LittleLadyChallenge(level)
{
    start = once(StartLevel(level))
    
    cancel = never(PowerUps() != 0) &&
        never(Death()) &&
        never(GameOver())
        
    submit = trigger_when(BeatLevel(level))
     
    return start && cancel && submit
}

// Checks that the play completes the game without powering up
function LittleLadyWorldChallenge()
{
    start = once(StartGame())
    
    cancel = never(PowerUps() != 0) &&
        never(GameOver())
        
    submit = trigger_when(BeatLevel(6))
     
    return start && cancel && submit
}

// Checks that the play completes the game in a certain about of time
function ExpressWorldChallenge(time)
{
    start = once(StartGame())
    
    cancel = never(repeated(time, always_true())) &&
        never(ResetGame()) &&
        never(GameOver())
        
    submit = trigger_when(BeatLevel(6))
     
    return start && cancel && submit
}

// Check if the play collects 100 coins (conditions for double coin collect)
function Coin1Up()
{
    return InGame() &&
        prev(Lives()) + 1 == Lives() &&
        prev(Coins()) >= 97 && 
        prev(Coins()) < 100 && 
        Coins() <= 2
}

// Check if the player found the mushroom in the castle
function FoundMushroom()
{
    slotArray = []
    for index in range(0,27)
        array_push(slotArray, prev(ItemSlot(index)) == 0 && ItemSlot(index) == 1)

    return InGame() &&
        Level() == 0x46 &&
        any_of(slotArray, s => s)
        
}

// Check if the player revealed a hidden 1up
function Revealed1Up(hiddenLocation)
{
    screen = hiddenLocation[0]
    location = hiddenLocation[1]

    return InGame() &&
        Level() == screen &&
        trigger_when(
            prev(byte(location)) == 0xf3 &&
            byte(location) == 0x5f
        )
}

// Achievements /////////////////////////////////////////////////////////////////////////

// Power up achievements
achievement("Princess Power","Obtain the mushroom", 1, ObtainPowerUp(1))
achievement("Firey Passion","Obtain the fire flower", 1, ObtainPowerUp(2))
achievement("Power Gives You Wings","Obtain the racoon leaf", 1, ObtainPowerUp(3))
achievement("Bloop","Obtain the blooper suit", 1, ObtainPowerUp(4))
achievement("Candy Striper","Obtain the candy cane suit", 1, ObtainPowerUp(6))

// Item achievements
achievement("Filling the Royal Treasury","Collect 100 coins to get a 1up", 2, Coin1Up())
achievement("Secret Stash","Find the secret mushroom in the castle", 1, FoundMushroom())

// Progression achievements
achievement("Winter Wonderland","Beat level 1", 1, BeatLevel(1))
achievement("Hilltops","Beat level 2", 2, BeatLevel(2))
achievement("Blooper's Garden","Beat level 3", 3, BeatLevel(3))
achievement("Frozen Outpost","Beat level 4", 4, BeatLevel(4))
achievement("Frozen Entrée","Beat level 5", 5, BeatLevel(5))
achievement("Bowser The Grinch","Beat bowser on the final level", 5, BeatLevel(6))

// Challenge achievements
achievement("Little Lady Challenge I","Beat level 1 without powering up", 2, LittleLadyChallenge(1))
achievement("Little Lady Challenge II","Beat level 2 without powering up", 3, LittleLadyChallenge(2))
achievement("Little Lady Challenge III","Beat level 3 without powering up", 5, LittleLadyChallenge(3))
achievement("Little Lady Challenge IV","Beat level 4 without powering up", 5, LittleLadyChallenge(4))
achievement("Little Lady Challenge V","Beat level 5 without powering up", 5, LittleLadyChallenge(5))
achievement("Little Lady Challenge VI","Beat level 6 without powering up", 10, LittleLadyChallenge(6))
achievement("Little Lady World Challenge","Beat the game without powering up", 25, LittleLadyWorldChallenge())
achievement("Express Delivery World Challenge","Beat the game in under 7:00 minutes", 25, ExpressWorldChallenge(TimeSpan(7,0,0)))

// Hidden Mushroom achievements
achievement("Early Present I","Find the 1up mushroom in level 1", 1, Revealed1Up(Hidden1Ups[0]))
achievement("Early Present II","Find the first 1up mushroom at the start of level 2", 1, Revealed1Up(Hidden1Ups[1]))
achievement("Early Present III","Find the second 1up mushroom in the clouds of level 2", 1, Revealed1Up(Hidden1Ups[2]))
achievement("Early Present IV","Find the first 1up mushroom at the start of level 4", 1, Revealed1Up(Hidden1Ups[3]))
achievement("Early Present V","Find the second 1up mushroom at the top of level 4", 1, Revealed1Up(Hidden1Ups[4]))
achievement("Early Present VI","Find the 1up mushroom at the start level 5 above the skyline", 1, Revealed1Up(Hidden1Ups[5]))
achievement("Early Present VII","Find the 1up mushroom in level 6", 1, Revealed1Up(Hidden1Ups[6]))

// Rich Presence ////////////////////////////////////////////////////////////////////////

// If Peach is playing
rich_presence_conditional_display(
    InGame() && ActivePlayer() == 0, 
    "{0} Peach is {1} with {2} lives and {3} coins", 
    rich_presence_lookup("Powerups", PowerUps(), PowerNames),
    rich_presence_lookup("Levels", Level(), LevelNames),
    rich_presence_value("Lives", Lives(), "VALUE"),
    rich_presence_value("Coins", Coins(), "VALUE")
)

// If Daisy is playing
rich_presence_conditional_display(
    InGame() && ActivePlayer() == 1, 
    "{0} Peach is {1} with {2} lives and {3} coins", 
    rich_presence_lookup("Powerups", PowerUps(), PowerNames),
    rich_presence_lookup("Levels", Level(), LevelNames),
    rich_presence_value("Lives", DaisyLives(), "VALUE"),
    rich_presence_value("Coins", DaisyCoins(), "VALUE")
)

rich_presence_display("Peach and Daisy are at the title screen")

// Leaderboards /////////////////////////////////////////////////////////////////////////

LeaderboardNames = [
    "Overworld",
    "Winter Wonderland",
    "Hilltops",
    "Blooper's Garden",
    "Frozen Outpost",
    "Frozen Entrée",
    "Bowser's Castle"
]

// Leaderboard for each level
for index in range(1,6)
{
    leaderboard(
        title = LeaderboardNames[index], 
        description = "Fastest time to beat level " + index,
        start = StartLevel(index),
        cancel = Death() || GameOver(),
        submit = BeatLevel(index),
        value = always_true(),    
        format = "FRAMES",
        lower_is_better = true
    )
}

// Leaderboard for the whole game
leaderboard(
    title = "Speedrun", 
    description = "Fastest time to beat the game",
    start = StartGame(),
    cancel = TitleScreen() || GameOver(),
    submit = BeatGame(),
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)


// Leaderboard for the whole game
leaderboard(
    title = "Little Lady Speedrun", 
    description = "Fastest time to beat the game without powering up",
    start = StartGame(),
    cancel = PowerUps() != 0 || TitleScreen() || GameOver(),
    submit = BeatGame(),
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)
