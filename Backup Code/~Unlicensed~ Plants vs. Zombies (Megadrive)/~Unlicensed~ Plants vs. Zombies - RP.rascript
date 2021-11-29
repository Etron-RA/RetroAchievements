// ~Unlicensed~ Plants vs. Zombies
// #ID = 8781

// $0002: Game State?
//        06=Menus
//        12=Ingame
function GameState() => byte(0x0002)
// $0338: [Input]
//        bit0 = Up
//        bit1 = Down
//        bit2 = Left
//        bit3 = Right
//        bit4 = A
//        bit5 = B
//        bit6 = C
//        bit7 = Start
// $033A: [Input]
//        bit4 = X?
//        bit5 = Y?
//        bit6 = Z?
// $55F0: Cursor X Position
// $55FE: 16bit Sun Overflow Count
function SunHigh() => word(0x55FE)
// $5600: 16bit Sun
function SunLow() => word(0x5600)
function Sun() => SunHigh() * 0xFFFF + SunLow()
// $5610: Number of Peas on Screen
// $5614: [Game Mode]
//        00=Story Mode
//        01=Endless
//        02=Options
function GameMode() => byte(0x5614)
// $5618: Lawn Mowers Remaining
function LawnMowers() => byte(0x5618)
// $561C: Option Selected in Pause Menu
//        00=Main Menu
//        01=Restart
//        02=Resume
// $5638: Text Palette? Can be used to check for end screen
// $563C: 01=Paused
// $5656: 01=Lawn Mower
// $5666: 01=Lawn Mower
// $5676: 01=Lawn Mower
// $5686: 01=Lawn Mower
// $5696: 01=Lawn Mower
// $56B0: Number of Zombies on Screen
function Zombies() => byte(0x56B0)
// $56C8: Plant 1
//        01=Peashooter
//        02=Sunflower
//        03=Wall-nut
//        04=Potato Mine
//        05=Snow Pea
//        06=Repeater
//        07=Cherry Bomb
//        08=Chomper
// $56EC: Plant 2
// $5710: Plant 3
// $5734: Plant 4
// $5758: Plant 5
// $577C: Plant 6
// $57A0: Plant 7
// $57C4: Plant 8
// $57E8: Plant 9
// $580C: Plant 10
// $5830: Plant 11
// $5854: Plant 12
// $5878: Plant 13
// $589C: Plant 14
// $58C0: Plant 15
// $58E4: Plant 16
// $5908: Plant 17
// $592C: Plant 18
// $5950: Plant 19
// $5974: Plant 20
// $5998: Plant 21
// $59BC: Plant 22
// $59E0: Plant 23
// $5A04: Plant 24
// $5A28: Plant 25
// $5A4C: Plant 26
// $5A70: Plant 27
// $5AA4: Plant 28
// $5AC8: Plant 29
// $5AEC: Plant 30
// $5B10: Plant 31
// $5B34: Plant 32
// $5B58: Plant 33
// $5B7C: Plant 34
// $5BA0: Plant 35
// $5BC4: Plant 36
// $5BE8: Plant 37
// $5C0C: Plant 38
// $5C30: Plant 39
// $5C54: Plant 40
// $5C78: Plant 41
// $5C9C: Plant 42
// $5CC0: Plant 43
// $5CE4: Plant 44
// $5D08: Plant 45
// $5F23: [Options] SFX Toggle
// $5F5A: Number of Plants Placed
function Plants() => byte(0x5F5A)
// $5F5E: 16bit Natural Sun Generation Timer
// $5F70: 01=Win
//        02=Game Over
function WinState() => byte(0x5F70)
// $5F71: [Options] Music Toggle
// $7D78: Current Level
//        Level 4 = First 5 Lane Map
//        Level 16 = Miniboss
//        Level 18 = Miniboss
//        Level 20 = Final Boss
function Level() => byte(0x7D78)
// $848C: Cursor Y Position
// $8490: Current Plant Type Selected
//        01=Peashooter
//        02=Sunflower
//        03=Wall-nut
//        04=Potato Mine
//        05=Snow Pea
//        06=Repeater
//        07=Cherry Bomb
//        08=Chomper
//        09=Shovel
function CurrentSelection() => byte(0x8490)
// $849E: Something Related To Music
Levels = {
    1: "1-1 🌇 1 Lane",
    2: "1-2 🌇 3 Lane",
    3: "1-3 🌇 3 Lane",
    4: "1-4 🌇 5 Lane",
    5: "1-5 🌇 5 Lane",
    6: "1-6 🌇 5 Lane",
    7: "1-7 🌇 5 Lane",
    8: "1-8 🌇 5 Lane",
    9: "1-9 🌇 5 Lane",
    10: "1-10 🌇 5 Lane",
    11: "2-1 🌃 5 Lane",
    12: "2-2 🌃 5 Lane",
    13: "2-3 🌃 5 Lane",
    14: "2-4 🌃 5 Lane",
    15: "2-5 🌃 5 Lane",
    16: "2-6 🌃 Mini Boss",
    17: "2-7 🌃 5 Lane",
    18: "2-8 🌃 Mini Boss",
    19: "2-9 🌃 5 Lane",
    20: "2-10 🌃 Final Boss",
}

Planting = {
    01: "Planting a Peashooter",
    02: "Planting a Sunflower",
    03: "Planting a Wall-nut",
    04: "Planting a Potato Mine",
    05: "Planting a Snow Pea",
    06: "Planting a Repeater",
    07: "Planting a Cherry Bomb",
    08: "Planting a Chomper",
    09: "Removing a Plant"
}

rich_presence_conditional_display(GameState() == 0x12 && GameMode() == 0,
    "{0} Story Mode | 🚩 {1} | 🌻 {2} vs. 🧟‍ {3} | 🌞 {4} | 🛡 {5}",
    rich_presence_lookup("Planting", CurrentSelection(), Planting),
    rich_presence_lookup("Level", Level(), Levels),
    rich_presence_value("Digit", Plants()),
    rich_presence_value("Digit", Zombies()),
    rich_presence_value("Digit", Sun()),
    rich_presence_value("Digit", LawnMowers())
)

rich_presence_conditional_display(GameState() == 0x12 && GameMode() == 1,
    "{0} Endless Mode | 🌻 {1} vs. 🧟‍ {2} | 🌞 {3} | 🛡 {4}",
    rich_presence_lookup("Planting", CurrentSelection(), Planting),
    rich_presence_value("Digit", Plants()),
    rich_presence_value("Digit", Zombies()),
    rich_presence_value("Digit", Sun()),
    rich_presence_value("Digit", LawnMowers())
)
rich_presence_conditional_display(GameState() == 0x12 && GameMode() == 2, "In Options Menu")

rich_presence_display("In Menu")