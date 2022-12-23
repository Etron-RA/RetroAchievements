// NBA Jam
// #ID = 593

// $06F1: Demo 00
//        In-Game 02
function Demo00() => byte(0x0006F1)

// $0A96: Player that is on fire; 0=None, 1=P1, 2=P2, 3=P3, 4=P4
function PlayerThatIsOnFire() => byte(0x000A96)

// $0CD5: 4 = overtime? 2=halftime
function Overtime2Halftime() => byte(0x000CD5)

// $18EC: win streak
function WinStreak() => byte(0x0018EC)

// $1C89: player 1 fg's
function Player1FgS() => byte(0x001C89)

// $1C99: total 3 pointers  player 1?
function ThreePointsForPlayer1() => byte(0x001C91)

// $1C99: total points for player 1?
function TotalPointsForPlayer1() => byte(0x001C99)

// $1CA1: player total dunks
function PlayerTotalDunks() => byte(0x001CA1)

// $1CA9: player assists
function PlayerAssists() => byte(0x001CA9)

// $1CB1: player 1 steals
function Player1Steals() => byte(0x001CB1)

// $1CB9: player 1 blocks
function Player1Blocks() => byte(0x001CB9)

// $1CC1: player 1 rebounds
function Player1Rebounds() => byte(0x001CC1)

function Complete(address, value)
{
    return prev(address) == value - 1 &&
        measured(address == value)
}

achievement(
    title = "One Three After Another Three", points = 10,
    description = "Score a 3 pointer 10 times as Player 1",
    id = 23956, badge = "24359", published = "2015-06-21 5:50:20 AM", modified = "2021-02-10 2:22:19 AM",
    trigger = Demo00() == 2 && Complete(ThreePointsForPlayer1(), 10) 
)

achievement(
    title = "Dunk It Again", points = 10,
    description = "Score 10 dunks as Player 1",
    id = 23957, badge = "24360", published = "2015-06-21 5:50:23 AM", modified = "2021-02-10 2:22:16 AM",
    trigger = Demo00() == 2 && Complete(PlayerTotalDunks(), 10)
)

achievement(
    title = "Not Selfish at All", points = 10,
    description = "Score a assist 10 times as  Player 1",
    id = 23958, badge = "24361", published = "2015-06-21 5:50:26 AM", modified = "2021-02-10 2:22:18 AM",
    trigger = Demo00() == 2 && Complete(PlayerAssists(), 10)
)

achievement(
    title = "Sold the Candy", points = 10,
    description = "Score a steal 10 times as  Player 1",
    id = 23959, badge = "24362", published = "2015-06-21 5:50:30 AM", modified = "2021-02-10 2:22:13 AM",
    trigger = Demo00() == 2 && Complete(Player1Steals(), 10)
)

achievement(
    title = "Block Story", points = 10,
    description = "Score a block 10 times as Player 1",
    id = 23960, badge = "24363", published = "2015-06-21 5:50:33 AM", modified = "2019-10-17 3:32:01 PM",
    trigger = Demo00() == 2 && Complete(Player1Blocks(), 10)
)

achievement(
    title = "Field Expert", points = 10,
    description = "Score ten field goals as Player 1",
    id = 23968, badge = "24371", published = "2015-06-21 5:50:58 AM", modified = "2015-06-21 6:52:46 AM",
    trigger = Demo00() == 2 && Complete(Player1FgS(), 10)
)

achievement(
    title = "This Ring is on Fire", points = 5,
    description = "Become on Fire",
    id = 23881, badge = "24262", published = "2015-06-20 6:13:40 PM", modified = "2015-06-21 6:51:08 AM",
    trigger = prev(PlayerThatIsOnFire()) != 1 && PlayerThatIsOnFire() == 1 && Demo00() == 2
)
