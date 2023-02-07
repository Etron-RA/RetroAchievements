// Pitfall!
// #ID = 11191

// $0000: Lives
//        bit5=1st extra life
//        bit7=2nd extra life
function Lives() => bitcount(0x000000)

// $001E: 00=game active
function GameActive() => byte(0x00001E)

// $0055: Score XX0000
// $0056: Score 00XX00
// $0057: Score 0000XX
function ScoreX00000() => high4(0x000055)
function Score0X0000() => low4(0x000055)
function Score00X000() => high4(0x000056)
function Score000X00() => low4(0x000056)
function Score0000X0() => high4(0x000057)
function Score00000X() => low4(0x000057)

// Converts the BCD score values into Base 10 decimal
function Score()
{
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

// Converts the BCD time values into frames
// Note that minutes and seconds are BCD and the frames are already Base 10
function Time()
{
    return TimeX00000() * 36000 +
        Time0X0000() * 3600 +
        Time00X000() * 600 +
        Time000X00() * 60 +
        Time0000XX()
}

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

// Example #11C - Rich Presence for Pitfall
rich_presence_conditional_display(GameActive() != 0 || Time() == 0,
    "Taking a break between adventures"
)

rich_presence_display("⏳{0} | 💳{1}/32 | 🧑x{2} | 💯{3}",
    rich_presence_value("Time", Time(), format="FRAMES"),
    rich_presence_value("Digit", Treasures()),
    rich_presence_value("Digit", Lives()),
    rich_presence_value("Digit", Score())
)
