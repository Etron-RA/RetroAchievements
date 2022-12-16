// Chopper Command
// #ID = 12813

// $0061: 0x7f - died, after a short delay decrements to 1 by 1
//        0x01 - ready to fly
//        0x00 - flying
function Status() => byte(0x000061)

// $0062: Enemies Remaining
function EnemiesRemaining() => byte(0x000062)

// $0064: Lives
function Lives() => byte(0x000064)

// $0068: Level
function Level() => byte(0x000068)

// $006C: Score (AAxxxx)
// $006E: Score (xxBBxx)
// $0070: Score (xxxxCC)
function ScoreX00000() => high4(0x00006C)
function Score0X0000() => low4(0x00006C)
function Score00X000() => high4(0x00006E)
function Score000X00() => low4(0x00006E)
function Score0000X0() => high4(0x000070)
function Score00000X() => low4(0x000070)
function Score() {
    return ScoreX00000() * 100000 + 
        Score0X0000() * 10000 + 
        Score00X000() * 1000 +  
        Score000X00() * 100 + 
        Score0000X0() * 10 + 
        Score00000X()
}
