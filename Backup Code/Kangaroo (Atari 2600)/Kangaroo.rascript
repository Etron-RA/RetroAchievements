// Kangaroo
// #ID = 13001

// $0024: screen
//        0-2
function Screen() => byte(0x000024)

// $0026: level
function Level() => byte(0x000026)

// $0027: Score [xx0000]
// $0028: score (x100)
function ScoreX00000() => high4(0x000027)
function Score0X0000() => low4(0x000027)
function Score00X000() => high4(0x000028)
function Score000X00() => low4(0x000028)
function Score() {
    return  ScoreX00000() * 100000 +
        Score0X0000() * 10000 +
        Score00X000() * 1000 +
        Score000X00() * 100
}


// $002D: Lives
function Lives() => byte(0x00002D)

// $0036: 0x80=new life music
//        0xc0=screen win music
function Music() => byte(0x000036)

// $003A: Game Variant [Lower4]
//        
//        0= 1P Novice
//        1=1P Advanced
//        2=2P Novice
//        3=2P Advanced
//        
//        bit7: 0=playing,1=title/demo
function Demo() => bit7(0x00003A)
function GameMode() => low4(0x00003A)
