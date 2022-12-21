// Rainbow Islands: The Story of Bubble Bobble 2 - Extra Version
// #ID = 328

// $E89A: [8-bit] Boss Health
function BossHealth() => byte(0x00E89A)

// $F600: [8-bit] Game State
//        0x00 = Title
//        0x04 = Menu/Configuration
//        0x08 = Demo
//        0x0C = Game Over
//        0x10 = In Game (bit 4)
//        0x14 = Won
function GameState() => byte(0x00F600)
function InGame() => bit4(0x00F600) == 1

// $F606: Round Number
function RoundNumber() => word(0x00F606)

// $FF02: [8-bit] Score 000000XX
function Score000000xx() => byte(0x00FF02)

// $FF03: [8-bit] Score 0000XX00
function Score0000xx00() => byte(0x00FF03)

// $FF04: [8-bit] Score 00XX0000
function Score00xx0000() => byte(0x00FF04)

// $FF05: [8-bit] Score XX000000
function ScoreXx000000() => byte(0x00FF05)

function CompleteRound(round) => prev(RoundNumber()) == round && RoundNumber() == round + 1

achievement(
    title = "Insect Island", points = 5,
    description = "Defeat the Boss on Insect Island",
    id = 763, badge = "01030", published = "2013-05-11 6:05:22 AM", modified = "2020-01-31 8:55:33 AM",
    trigger = InGame() && CompleteRound(4) 
)

achievement(
    title = "Combat Island", points = 5,
    description = "Defeat the Boss on Combat Island",
    id = 764, badge = "01030", published = "2013-05-11 6:05:30 AM", modified = "2020-01-31 8:55:32 AM",
    trigger = InGame() && CompleteRound(8)
)

achievement(
    title = "Monster Island", points = 10,
    description = "Defeat the Boss on Monster Island",
    id = 765, badge = "01030", published = "2013-05-11 6:05:36 AM", modified = "2013-05-11 6:06:18 AM",
    trigger = InGame() && CompleteRound(12)
)

achievement(
    title = "Toy Island", points = 10,
    description = "Defeat the Boss on Toy Island",
    id = 766, badge = "01030", published = "2013-05-11 6:05:42 AM", modified = "2019-10-11 12:33:01 PM",
    trigger = InGame() && CompleteRound(16)
)

achievement(
    title = "Doh's Island", points = 10,
    description = "Defeat the Boss on Doh's Island",
    id = 767, badge = "01030", published = "2013-05-11 6:05:45 AM", modified = "2019-10-11 12:33:01 PM",
    trigger = InGame() && CompleteRound(20)
)

achievement(
    title = "Robot Island", points = 10,
    description = "Defeat the Boss on Robot Island",
    id = 768, badge = "01030", published = "2013-05-11 6:05:48 AM", modified = "2019-09-23 9:21:01 AM",
    trigger = InGame() && CompleteRound(24)
)

achievement(
    title = "Dragon Island", points = 10,
    description = "Defeat the Boss on Dragon Island",
    id = 769, badge = "01030", published = "2013-05-11 6:05:50 AM", modified = "2019-09-23 9:21:01 AM",
    trigger = InGame() && CompleteRound(28)
)

achievement(
    title = "Magical Island", points = 10,
    description = "Defeat the Boss on Magical Island",
    id = 770, badge = "01030", published = "2013-05-11 6:05:53 AM", modified = "2019-10-02 10:28:01 AM",
    trigger = InGame() && CompleteRound(33)
)

achievement(
    title = "Magical Island", points = 10,
    description = "Defeat the Boss on Magical Island",
    id = 771, badge = "01030", published = "2013-05-11 6:05:56 AM", modified = "2013-05-11 6:05:56 AM",
    trigger = InGame() && CompleteRound(33)
)
