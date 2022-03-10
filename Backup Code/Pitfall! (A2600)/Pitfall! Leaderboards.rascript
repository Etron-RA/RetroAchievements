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

// $001E: 00=game active
function GameActive() => byte(0x00001E) == 0

// $003B: Objects on ground
//        40=money bag
//        71=silver bar
//        81=gold bar
//        6e=ring
function GroundObject() => byte(0x00003B)

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
function RopeSwing() => SFX() == 31

// $0061: Harry's Horizontal position on screen
function HarryHorizontal() => byte(0x000061)

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
function PickUpTreasure()
{
    return  prev(Treasures1()) < Treasures1() ||
        prev(Treasures2()) < Treasures2() ||
        prev(Treasures3()) < Treasures3() ||
        prev(Treasures4()) < Treasures4()  
}

// $0072: 05=damage by logs
function LogDamage() => byte(0x000072)

//Count how many frames are in a timespan
function Frames(minutes, seconds, milliseconds) => minutes * 3600 + seconds * 60 + milliseconds
function Countdown()
{
    return Frames(20,00,00) + 
        TimeX00000() * -36000 +
        Time0X0000() * -3600 +
        Time00X000() * -600 +
        Time000X00() * -60 +
        Time0000XX() * -1
}

// Start the when the clock starts ticking down
// Cancel if score above 120,000 (impossible)
// Submit when the player dies
leaderboard(
    title = "High Score Deathless",
    description = "Highest score in the first life",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = Score() > 120000,
    submit = !GameActive(),
    value = Score(),
    format = "SCORE"
)

// Start the when the clock starts ticking down
// Cancel if clock resets (game over)
// Submit when the diamond ring is picked up
leaderboard(
    title = "Diamond Race",
    description = "Fastest time to pick up the first diamond ring",
    start  = prev(Time()) == Frames(20,00,00) && Time() == Frames(19,59,59),
    cancel = !GameActive() && Lives() == 0,
    submit = prev(GroundObject()) == 0x6e && (PickUpTreasure()),
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