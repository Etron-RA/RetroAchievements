// Teenage Mutant Ninja Turtles II: The Arcade Game
// #ID = 2114

// $0025: Cheats: b0=9 lives, b7=Stage Select
function Cheats() => byte(0x000025)

// $03F0-03F2: P1 - Score
function ScoreX00000() => high4(0x0003F2)
function Score0X0000() => low4(0x0003F2)
function Score00X000() => high4(0x0003F1)
function Score000X00() => low4(0x0003F1)
function Score0000X0() => high4(0x0003F0)
function Score00000X() => low4(0x0003F0)
function Score() {
    return ScoreX00000() * 100000 +
        Score0X0000() * 10000 +
        Score00X000() * 1000 +
        Score000X00() * 100 +
        Score0000X0() * 10 +
        Score00000X()
}

function ObtainScore(goal, range)
{
    return Cheats() == 0 &&
        prev(Score()) >= goal - range && 
        prev(Score()) < goal && 
        measured(Score() >= goal)
}

achievement(
    title = "Inexperienced Turtle", points = 5,
    description = "Score 120 Points",
    id = 4233, badge = "13794", published = "2013-12-29 7:46:35 PM", modified = "2019-11-26 5:25:01 PM",
    trigger = ObtainScore(120, 5)
)

achievement(
    title = "Level Up", points = 10,
    description = "Score 320 points",
    id = 4227, badge = "13655", published = "2013-12-29 7:46:15 PM", modified = "2020-05-25 9:46:37 PM",
    trigger = ObtainScore(320, 5)
)

achievement(
    title = "Master Turtle", points = 25,
    description = "Score 720 Points",
    id = 3978, badge = "13656", published = "2013-12-12 2:41:32 PM", modified = "2020-05-25 9:46:39 PM",
    trigger = ObtainScore(720, 5)
)
