// Pitfall!
// #ID = 11191

// $001E: 00=game active
function GameActive() => byte(0x00001E) == 0

// $0055: Score XX0000
// $0056: Score 00XX00
// $0057: Score 0000XX
function ScoreX00000() => high4(0x000055)
function Score0X0000() => low4(0x000055)
function Score00X000() => high4(0x000056)
function Score000X00() => low4(0x000056)
function Score0000X0() => high4(0x000057)
function Score00000X() => low4(0x000057)
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
function Time()
{
    return TimeX00000() * 36000 +
        Time0X0000() * 3600 +
        Time00X000() * 600 +
        Time000X00() * 60 +
        Time0000XX()
}

// Convert the time minutes:seconds:milliseconds to frames (1/60s each)
function Frames(minutes, seconds, milliseconds) => minutes * 3600 + seconds * 60 + milliseconds

// Check if the score goes from between low and high score to above the high score
function ScoreRange(lowScore, highScore)
{
    return measured(
               prev(Score()) > lowScore &&
               prev(Score()) < highScore &&
               Score() >= highScore
           )
}

// Create an achievement for scoring more than 75,000 points in 10 minutes or less
achievement(
    title = "Example 4B: Golden Scorpion", 
    description = "Score 70000 points in 10 minutes or less", 
    points = 0,
    trigger = GameActive() && 
    ScoreRange(60000, 70000) && 
    unless(Time() < Frames(10,0,0))
)