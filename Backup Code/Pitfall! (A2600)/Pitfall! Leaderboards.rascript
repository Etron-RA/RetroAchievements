// Pitfall!
// #ID = 11191

// $0000: Lives
//        bit5=1st extra life
//        bit7=2nd extra life
function Life1() => bit5(0x000000)
function Life2() => bit7(0x000000)
function Lives() => Life1() + Life2()

// $0001: Screen id
function Screen() => byte(0x000001)

// $0013: Objects on screen layout
function GroundObjects() => byte(0x000013)
function HasVine() => GroundObjects() == 0x2

// $0014: Ground layout
//        00=ladder
//        01=ladder and two holes
//        02=pit and vine
//        03=pond and vine
//        04=pond and gators
//        05=vanishing pit
//        06=vanishing pit and vine
//        07=vanishing pond
function GroundLayout() => byte(0x000014)
function HasCrocs() => GroundLayout() == 0x4

// $001E: 00=game active
function GameActive() => byte(0x00001E) == 0

// $003B: Objects on ground
//        40=money bag
//        71=silver bar
//        81=gold bar
//        6e=ring
function GroundObject() => byte(0x00003B)
MoneyBag = 0x40
SilverBar = 0x81
GoldBar = 0x71
DiamondRing = 0x6e

// $0055: Score XX0000
// $0056: Score 00XX00
// $0057: Score 0000XX
function ScoreX00000() => high4(0x000055)
function Score0X0000() => low4(0x000055)
function Score00X000() => high4(0x000056)
function Score000X00() => low4(0x000056)
function Score0000X0() => high4(0x000057)
function Score00000X() => low4(0x000057)
function Score(){
    return ScoreX00000() * 100000 +
        Score0X0000() * 10000 +
        Score00X000() * 1000 +
        Score000X00() * 100 +
        Score0000X0() * 10 +
        Score00000X()
}

// $0058: Time XX:00 (BCD)
//        20=out of game
// $0059: Time 00:XX (BCD)
// $005A: Time (miliseconds)
function TimeXX0000() => byte(0x000058)
function GameOver() => TimeXX0000() >= 0x20
function TimeX00000() => high4(0x000058)
function Time0X0000() => low4(0x000058)
function Time00X000() => high4(0x000059)
function Time000X00() => low4(0x000059)
function Time0000XX() => byte(0x00005A)
function Time()
{
    return TimeX00000() * 36000 +
        Time0X0000() * 3600 +
        Time00X000() * 600 +
        Time000X00() * 60 +
        Time0000XX()
}

// $0060: (hex) SFX
//        0x01-0x1f rope swing
//        0x20-0x24 jump
//        0x25-0x30 item
//        0x31-0x52 ko
//        0x53-0x5c pit damage
function SFX() => byte(0x000060)
function RopeSwing() => SFX() == 0x1f
function ItemPickUp() => SFX() == 0x25

// $0061: Harry's Horizontal position on screen
function HarryHorizontal() => byte(0x000061)
function MiddleCroc() => HarryHorizontal() >= 0x38 && HarryHorizontal() <= 0x60
function AllCrocs() => HarryHorizontal() >= 0x48 && HarryHorizontal() <= 0x50
function JumpCroc2Croc1() => prev(HarryHorizontal()) == 0x45 && HarryHorizontal() == 0x44
function JumpCroc2Croc3() => prev(HarryHorizontal()) == 0x54 && HarryHorizontal() == 0x55
function JumpCroc1Shore() => prev(HarryHorizontal()) == 0x32 && HarryHorizontal() == 0x31
function JumpCroc3Shore() => prev(HarryHorizontal()) == 0x64 && HarryHorizontal() == 0x65

// $0065: Harry's sprite direction
//        bit3=left
function HarryDirection() => byte(0x000065)

// $0066: Scorpion's sprite direction
function ScorpionDirection() => byte(0x000066)

// $0069: Harry's Vertical position on screen
function HarryVertical() => byte(0x000069)
function HarryGround() => HarryVertical() >= 0x15 && HarryVertical() <= 0x4A
function HarryDungeon() => HarryVertical() >= 0x4B && HarryVertical() <= 0x56

// $006D: Treasures flags
// $006E: Treasures flags
// $006F: Treasures flags
// $0070: Treasures flags
function Treasures1() => bitcount(0x00006D)
function Treasures2() => bitcount(0x00006E)
function Treasures3() => bitcount(0x00006F)
function Treasures4() => bitcount(0x000070)
function Treasures() {
    return Treasures1() +
        Treasures2() +
        Treasures3() +
        Treasures4()
}

// $0072: 05=damage by logs
function LogDamage() => byte(0x000072)

//Count how many frames are in a timespan
function Frames(minutes, seconds, milliseconds) => minutes * 3600 + seconds * 60 + milliseconds
function Countdown()
{
    return TimeX00000() * -36000 +
        Time0X0000() * -3600 +
        Time00X000() * -600 +
        Time000X00() * -60 +
        Time0000XX() * -1 +
        Frames(20,00,00) 
}

// Starts the when score is > 2000
// Cancel if score above 114,000 (impossible)
// Submit on reset
leaderboard(
    title = "High Score",
    description = "Highest score (starts when score > 2,000 and submits on reset)",
    start  = Time() < Frames(20,00,00) && prev(Score()) <= 2000 && Score() > 2000,
    cancel = Score() > 114000,
    submit = GameOver(),
    value = prev(Score()),
    format = "SCORE"
)

// Starts the when score is > 2000
// Cancel if score above 114,000 (impossible)
// Submit when the player dies or on reset
leaderboard(
    title = "High Score Deathless",
    description = "Highest score in the first life (starts when score > 2,000 and submits on reset)",
    start  = Time() < Frames(20,00,00) && Lives() == 2 && prev(Score()) <= 2000 && Score() > 2000,
    cancel = Score() > 114000,
    submit = !GameActive() || GameOver(),
    value = prev(Score()),
    format = "SCORE"
)

// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when the silver bar is picked up
leaderboard(
    title = "Bank Heist",
    description = "Fastest time to pick up the first money bag",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0 || GameOver(),
    submit = prev(GroundObject()) == MoneyBag && ItemPickUp(),
    value = Countdown(),
    format = "FRAMES",
    lower_is_better = true
)

// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when the silver bar is picked up
leaderboard(
    title = "Silver Speedster",
    description = "Fastest time to pick up the first silver bar",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0 || GameOver(),
    submit = prev(GroundObject()) == SilverBar && ItemPickUp(),
    value = Countdown(),
    format = "FRAMES",
    lower_is_better = true
)


// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when the silver bar is picked up
leaderboard(
    title = "Gold Rush",
    description = "Fastest time to pick up the first gold bar",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0 || GameOver(),
    submit = prev(GroundObject()) == GoldBar && ItemPickUp(),
    value = Countdown(),
    format = "FRAMES",
    lower_is_better = true
)

// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when the diamond ring is picked up
leaderboard(
    title = "Diamond Run",
    description = "Fastest time to pick up the first diamond ring",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0 || GameOver(),
    submit = prev(GroundObject()) == DiamondRing && ItemPickUp(),
    value = Countdown(),
    format = "FRAMES",
    lower_is_better = true
)

// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when the diamond ring is picked up
leaderboard(
    title = "Collect 'em All!",
    description = "Fastest time to pick up a money bag, silver bar, gold bar, and diamond ring",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0 || GameOver(),
    submit = tally(4,
                once(prev(GroundObject()) == MoneyBag && ItemPickUp()),
                once(prev(GroundObject()) == SilverBar && ItemPickUp()),
                once(prev(GroundObject()) == GoldBar && ItemPickUp()),
                once(prev(GroundObject()) == DiamondRing && ItemPickUp())
             ),
    value = Countdown(),
    format = "FRAMES",
    lower_is_better = true
)

// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when all the treasures have been picked up
leaderboard(
    title = "Treasure Hunter",
    description = "Fastest time to pick up all 32 treasures",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0 || GameOver(),
    submit = prev(Treasures()) == 31 && Treasures() == 32,
    value = Countdown(),
    format = "FRAMES",
    lower_is_better = true
)

// Start the count of the second jump over the Scorpion
// Cancel none
// Submit on death, leaving ground, or screen change
leaderboard(
     "Scorpion Dance",
     "Most jumps over a scorpion without leaving the area or losing a life (two jumps to start)", 
     repeated(2,prev(ScorpionDirection()) != ScorpionDirection()) && 
     never(!GameActive()) &&
     never(HarryGround()) &&
     never(prev(Screen()) != Screen()),
     always_false(), 
     !GameActive() || HarryGround() || prev(Screen()) != Screen(),
     tally(0,
         once(prev(ScorpionDirection()) != ScorpionDirection()),
         prev(ScorpionDirection()) != ScorpionDirection()
     ), 
     format="VALUE"
)

// Start the count of the second jump over the corcodiles
// Cancel none
// Submit on death, leaving ground, or screen change
//leaderboard(
//     "Crocodile Hop",
//     "Most jumps from outside crocodile to outside crocodile without turning around on the middle crocodile, leaving the screen, or losing a life (two jumps to start)", 
//     tally(2,
//         JumpCroc2Croc1(),
//         JumpCroc2Croc3()
//     ) && 
//     never(HasVine()) &&
//     never(!HasCrocs()) &&
//     never(!GameActive()) &&
//     never(HarryDungeon()) &&
//     never(prev(Screen()) != Screen()) &&
//     never(MiddleCroc() && prev(HarryDirection()) != HarryDirection()),
//     always_false(), 
//     HasVine() || 
//     !HasCrocs() || 
//     !GameActive() ||
//     HarryDungeon() || 
//     prev(Screen()) != Screen() ||
//     MiddleCroc() && prev(HarryDirection()) != HarryDirection(),
//     tally(0,
//         once(prev(HarryHorizontal())!=HarryHorizontal()),          
//         JumpCroc2Croc1(),
//         JumpCroc2Croc3()
//     ), 
//     format="VALUE"
//)

// Start the count of the second jump over the corcodiles
// Cancel none
// Submit on death, leaving ground, or screen change
leaderboard(
     "Crocodile Rock",
     "Most jumps between the shores of the crocodile pond without turning around on a crocodile, leaving the screen, or losing a life (two jumps to start)", 
     tally(2,
         JumpCroc1Shore(),
         JumpCroc3Shore()
     ) && 
     never(HasVine()) &&
     never(!HasCrocs()) &&
     never(!GameActive()) &&
     never(HarryDungeon()) &&
     never(prev(Screen()) != Screen()) &&
     never(AllCrocs() && prev(HarryDirection()) != HarryDirection()),
     always_false(), 
     HasVine() || 
     !HasCrocs() || 
     !GameActive() ||
     HarryDungeon() || 
     prev(Screen()) != Screen() ||
     AllCrocs() && prev(HarryDirection()) != HarryDirection(),
     tally(0,
         once(prev(HarryHorizontal())!=HarryHorizontal()),   
         JumpCroc1Shore(),
         JumpCroc3Shore()
     ), 
     format="VALUE"
)

// Start the count of the second jump on a vine
// Cancel none
// Submit on death or changing direction
leaderboard(
    "Tarzan",
     "Swing on the most vines without turning back (two swings to start)", 
     repeated(2,RopeSwing()) &&
     never(!GameActive()) &&
     never(prev(HarryDirection()) != HarryDirection()),
     always_false(), 
     !GameActive() || prev(HarryDirection()) != HarryDirection(),
     tally(0,
         once(RopeSwing()),
         RopeSwing()
     ), 
     format="VALUE"
)